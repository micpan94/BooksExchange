import React, { useEffect, useState } from 'react'
import {
    useRouteMatch,
    useParams
} from "react-router-dom";
import superagent from 'superagent'

const AdvertisementDetails = (props) => {
    const { id, name } = useParams()
    const maciej = props.location.search

    const [data, setData] = useState({})

    useEffect(() => {
        superagent.get('http://localhost:8090/inzynierka-1.0-SNAPSHOT/json?json1=' + id)
            .then((response) => {
                console.log('response', JSON.parse(response.text))
                setData(JSON.parse(response.text))
            })
            .catch(err => {
                console.log('err', err)
            })
    }, [])

    const isEmpty = Object.keys(data).length === 0

    if (isEmpty) {
        return (
            <div>
                PANEK LADOWANIE
            </div>
        )
    }

    return (
        <div>
            <h1>HELLO {name}</h1><br />
            <div>id: {data.id}</div>
            <div>title: {data.title}</div>
            <div>price: {data.price}</div>
            <div>Jelen: {maciej}</div>
        </div>
    )
}

export default AdvertisementDetails

