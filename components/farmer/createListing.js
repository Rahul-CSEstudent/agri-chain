import { useState } from "react";

function Input({ label, id, type, value, onChange }) {
    return (
        <div className="relative mb-4">
            <label htmlFor={id} className="leading-7 text-sm text-gray-600">{label}</label>
            <input type={type} id={id} value={value} onChange={onChange} className="w-full bg-white rounded border border-gray-300 focus:border-green-500 focus:ring-2 focus:ring-green-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
        </div>
    )
}

export default function CreateListing() {
    const [cropName, setCropName] = useState("");
    const [quantity, setQuantity] = useState("");
    const [price, setPrice] = useState("");

    return (
        <section className="text-gray-600 body-font">
            <div className="container px-5 py-20 mx-auto flex flex-wrap items-center">
                <div className="lg:w-2/6 md:w-1/2 rounded-lg p-8 flex flex-col mx-auto w-full mt-10 md:mt-0">
                    <h2 className="text-gray-900 text-lg font-medium title-font mb-5">Create a Listing</h2>
                    <Input
                        label="Crop Name"
                        id="cropName"
                        type="text"
                        value={cropName}
                        onChange={(e) => setCropName(e.target.value)}
                    />
                    <Input
                        label="Quantity"
                        id="quantity"
                        type="number"
                        value={quantity}
                        onChange={(e) => setQuantity(e.target.value)}
                    />
                    <Input
                        label="Price"
                        id="price"
                        type="number"
                        value={price}
                        onChange={(e) => setPrice(e.target.value)}
                    />
                    <button className="text-white bg-green-500 border-0 py-2 px-8 focus:outline-none hover:bg-green-600 rounded text-lg">Add Listing</button>
                    <p className="text-xs text-gray-500 mt-3">This will create a new listing</p>
                </div>
            </div>
        </section>

    )
}