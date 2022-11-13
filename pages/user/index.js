import Search from "../../components/customer/search";
import { ThirdwebWeb3Provider } from '@3rdweb/hooks';

export default function MyApp() {
    const supportedChainIds = [1, 4, 137];
    const connectors = {
        injected: {},
    };
    return (
        <ThirdwebWeb3Provider
            supportedChainIds={supportedChainIds}
            connectors={connectors}
        >
            <Search />
        </ThirdwebWeb3Provider>
    );
}