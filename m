Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF01547DB
	for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681145; cv=fail; b=rHMKqPOYp6s4O74uTad58zn+G3wedxglcvlojBvkf2VmMeeXAK7V9zLOD/08VEMhizEeN+MgVZ+YLowaCUnA6Zp64CQQ2XrNvgmVoq/o6qAS5197n0I+fDPGEhITf8wCRkWBCy6xxRqc0isBHiIj+8FppZq7yCNBM+/nHZOAdvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681145; c=relaxed/simple;
	bh=kXlFUKnZ2nLOGwE65P0RmVOChn5sVvIIte+VUkSTJQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pl/mFk/R2xy7KUJ7OsJfAJU6O1PKN6RM4PSNLwHVCVMv0ReK79O8+oXFR4xMJ9vu9whAXwAqqVBAXf+LKAKOPFrRhgDwStYybJSRigaZbO+CZSEsXpTBxijmG/9L5qy2WdDb/SjHg55ZIxvwgs6tST9YKXh+yKjWdYogu1Soigw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=30229g8q; arc=fail smtp.client-ip=40.107.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="30229g8q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDeGFSoxB1hDkKu5hQ3VWpTw0+u6yjaCiWQo6VKt4OhyqvHzeU1ViR8i3oHE4bgj1SbhI+6mujqsFL/3Ar4SLVeVCx6UbSE5U8nOs70YpCgfxxJt1fvD3TLV/aQjWo01nuQuD0CPbUM1jIlEAhrN6FHzSDebK/tlwHzoDyO2SgZpbuHQ8YZKub3UoU7h7H1O6tkysOhodZJtvf33Ri5kGClbW9qPvMSuQrcIZ/y00DaKrZLE/GI+CN0w9ftc+lOvbtwWoL3y2QO0rGwYdhctIQXGSSGrhv23905If890F82XPqQykXivQn2RcI//zIh29LW3/Ky4w9VCRW7oWkA6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvb/WgQuXB7z5rQfNqUt2RlgD+aG2LwuRa3loyH2JZ4=;
 b=kdg2Wc7B7Y/2qt9mrzYE8j6GLQoaHjEiWGQ9dHZbyfxNHu6+CPS6vAKVtSMGfmRsRsbxPtdQvPnKpzQcBdwVZwbOWzEVJmRFl79Y5IMu5R7tCg+oo/jy+pW04k3HeEo/AtWPrhwxqh/C/SaE1OfNXknBICWtckBSYRgJYcQ0spJ0nAuJzfOenFF7xxaHpaaFHeMNYMbhF4pn5nXrIzfWdRIMHNqCDD8llgMdUsj2autdMJ1uCVnvnWIHlmh5IvmZxQVKRz32Rqpya1XivaGT0ymoaKZkbI7puhCN+8V0RHTyximJaa+lff59BYmkLQLKIppp9KjdYeZ3sQKQYeh5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvb/WgQuXB7z5rQfNqUt2RlgD+aG2LwuRa3loyH2JZ4=;
 b=30229g8qqzMTTEGDoNbihbUZ7gwyJM4yphkHLm2u4GOc3/jLFyKjmJtRvnA9ynn50Rcd+1N+6W34LNeyz3nYZKun5Vr8LbaOg4LBMV/sljJ7+R3X2sRUkM9pWM0PqBkdESujwoJVSufgHh1iZg32R6EUusvmEeYBGQOZ+8xqOV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:25:39 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:25:39 +0000
Message-ID: <7fadd459-05c2-4adf-be02-25ccf6990251@amd.com>
Date: Mon, 30 Sep 2024 15:25:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] transport-pci: Add MSI support
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mie@igel.co.jp" <mie@igel.co.jp>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad> <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240930022818-mutt-send-email-mst@kernel.org>
 <8f7a2626-f066-4a49-af09-9b83e95ca0a6@amd.com>
 <IA0PR12MB87138EEE12B3A853C10605AADC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <030cf387-48ca-40b8-8dab-70f6beb4011a@amd.com>
 <IA0PR12MB87130121332B747C19FCDB06DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB87130121332B747C19FCDB06DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9cd232-3c2e-43c5-7819-08dce1211550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVpzcG9OUWN0MG8rNE52ME40a1Vqa21PQjV5UWZrQ01ialp0UDRGeTZ6dmVm?=
 =?utf-8?B?QXhTbXNIa0M1aFVvY2xma1dVbm8yQktrenhvSm92RVhEMm5xQy9aL0s4V0Rt?=
 =?utf-8?B?dVA2YW5hNEhNUCsvUDZuRUd1Q0Z6M1ZERTR6VGRnMVMxRkw4VStQZ1ZidllD?=
 =?utf-8?B?RmpyTmdybHJnU0lYQlJxMlZvRXpYaHFxcXdubmdVNEg2TzNzdjUzVXJHNDNJ?=
 =?utf-8?B?Z2lHb2c1eGZLVHBUaTFmVy82dEN1ZksrNWZNZ0tTODU2Nk5tYmJuVklFOXUz?=
 =?utf-8?B?SXlma3VyK1hXeTdpcjBsNGdFNE5QUkVOdzUzVFBDc0x5NmcybFFHRGdMR0pq?=
 =?utf-8?B?R1I5ZnBQVkowRFJzaUlSRWNWM1FiMUdnV0h6aGljbmxOZXZQYnNKUk9COUs1?=
 =?utf-8?B?djhCQlJiaEpwbTVpUFhxT1cvMmE5amF6bFdQQmlMNndWOUx4M2w3M0o5NFNT?=
 =?utf-8?B?ME9JVlVjMkNnUjhKcEI2TXNLWFJCYVlMcGRmUWdBa1BCVGcwb2tjbW9YYk1Z?=
 =?utf-8?B?djZnOFI2ditOWE9BQndmMnlrbEwrMlBJSWlBcE5mRGVqcTJ5SWh1eTdjMVNp?=
 =?utf-8?B?YndMaU5kSUM0ZHhUM1l3Mk1mMU9QeG80OUZoSXB1Qy9tWk9RekxsbkUyQVA5?=
 =?utf-8?B?cGlCaFd6WG5SZ2xuU21IT09BSGR5VDNGSHplbDNYQVNuUjlyTWYyUHRndUMz?=
 =?utf-8?B?TG5SRGRNeUVKb01nVnpJOEJJRU8wR0x1SXZWaUZFTFhVZ3lyUUt3UllRZm91?=
 =?utf-8?B?OGtjT3BwVFhQRlhEYUV0ZWlLSnI4SEExbVc5YUVoN3NNR0pxOGJGVGZ3cXFq?=
 =?utf-8?B?SnZMMTIzNHcwSWdlV0NnTklYQ1VRbWtyYkZodVpJYVZyL2p1MzQ3c2VtcnUv?=
 =?utf-8?B?NGJxK1Jqa3VqTmlpaHR3UllZQm1vR0pJd05YaWYycHdFdThKTFlZcEpFT3Yv?=
 =?utf-8?B?U0JybGlqMXNuOXVWdlRpZjhqR1BvTVlxRlRMYUpmeWZiUXc0ZHZpdm1iNHE1?=
 =?utf-8?B?bWorbkJ4TGRLc1hHMkZmUFRmeUR0ak4rRVdoSmo0VkcrVlVUVzRMc0JkZWxu?=
 =?utf-8?B?ejM5emFadjhuTitXMkx3U2dwR0FtYllHdDR3UWE3TWdFa1k2MDlTcDBWL1pi?=
 =?utf-8?B?SXNTcmFFZFBsNjBscHlDVTZRUC96Q0NaNG9yTDVXODlNZFdJVWh6V3NTdlkr?=
 =?utf-8?B?TG16MVJ2OXBuWGNCQi85dXpPa0xSNWpOYkpBQkd4V0FBaEUrVHpOSVRXVzlH?=
 =?utf-8?B?aFNRT2ZSbXE2Y09hdGNBL2hrTzVFMHc3YnFvdWlFZ1o5YW8zR1V3OC9RVTBS?=
 =?utf-8?B?VlJNVldqbWtKWndSZ2tpT0hEa1NrRXB6OGE5R05uTE5BQjAwVFlrQ0dOMjcy?=
 =?utf-8?B?RFR3QUI5R0h6Q2RGR2xOd3IyT2k1TndWVnJRZmVVdEJuS0lCVy8ycnFrbkRz?=
 =?utf-8?B?eUFBS0JLM0N0WDBJQlh5R0xWU3RKTjJOQk1RYWV0Q0pUdGVuT1NXd25EbXlh?=
 =?utf-8?B?T0ZHb0VoZUh2NzhMbnJpQ0s1ekdnSmJjYmdPSTlwNmhZbTRoZ2NQU1NCTGYz?=
 =?utf-8?B?S3pEOXVweDd1WWE4WFIvUEIra0ZzVTVBSjlzYit4Y0t6cDhVcDZ4Wk0xZGJN?=
 =?utf-8?B?MklBRUdUbjJRUG42Z1ozdE5WVUxDUFh3RlVaSEpNcXVaWk9ib1lTYTBqelNk?=
 =?utf-8?B?WlZmdE9NSGIvWXdYemNNNFU0RWMvMzdiV29kV0ZNVWpML3FQalBVN0FWWkZZ?=
 =?utf-8?B?OXlKTWNETFIzNWFNQWhGZC95VEpsVWIrMFdQNDlSMXd0Wmd0R0RROU04aFpz?=
 =?utf-8?B?QTNuWC95UUgvUzZUaHgrQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCttMUVZNGs4b2x6YVRYei9mYmlhNlN3aWlaNFB1azJrS2U2RmlFaS94V3Rn?=
 =?utf-8?B?K2tQU0kzOXZCVGFiYXNOcFFyTlN1ak9ZNGN1Y0dGdVRYZWdEL0JvakRIUmVN?=
 =?utf-8?B?b1oxRjZOU1FKaTk5QnNDQWFMVkpYRmxhQld3b1EyN2pNNUZTZ1JUd1BhOHhB?=
 =?utf-8?B?cW5OL3FlL0RqQytXMklDeVVoSGx5bEptVGhNVUFnQjBGUW5TWTRiSUtQc3Vp?=
 =?utf-8?B?NGlWVVZvUlA4U3d6akNyeWFRQUJzMnRuY2NabFRkQWlGcFlPbEVnUmdxeDZB?=
 =?utf-8?B?bmxqSUR2UVFPejJ0bjJSeEZkNmNjcStNdnNtMTBFY3pJUzBxTVNBb3pCbHRK?=
 =?utf-8?B?cXZQc3V6dnhWYzczSGZzZElNc2xRdTN1OHpiZmlMOWIxZk1UQzYrZ01XalVX?=
 =?utf-8?B?UDljdFF4NnpxVmdkcDZZSEdXcW9LTHArdktac1E4cnRMQ2haM3QvMTY1ckEy?=
 =?utf-8?B?WHFqUUJGRW5OY0VCSGVuMVUrallSbU9CZjFTdlRmVlFtZTNSb1d3eHZqekFn?=
 =?utf-8?B?dkJ6K3VhUTk0cmhuM2JKMFN0R090cE1MbTdQVCtrUDg3OFVUVTVSdmJHbkov?=
 =?utf-8?B?Yklla05RdzYvcVNXb0NwWm5TZHhNVm9WYlM2Mk1FbytHYVdHbXJmbzRKT2Ew?=
 =?utf-8?B?VGhTMmdTRjB4K1ZXcVQ0VVpma1FVVDJXV2doWndLKzFjNGZqY3NlcVlwODA3?=
 =?utf-8?B?N2NXUnNZdGFERjRtMkJDd0dTTTNxQUdYZnYwYnNFeGJRQmpaVEVVTnJqM0pi?=
 =?utf-8?B?SlFQNDBjNzU2NktHNXdhbEVsbjdiM0FKOWZTck5FVjMxeG5XUHJLUU9iVzlt?=
 =?utf-8?B?VUY4dnNaRGEyUTlGTThSb1NWNG9GQVNLYUhHbE5pODJuc0s1TTJXaWd1TzY1?=
 =?utf-8?B?U25VcWo3dXUyTnFjRTNvOHBUTS9HQlM5UnM2OGZELzFHekExTDNjb2JVbmNF?=
 =?utf-8?B?bytUelVjd0ptOGZXNFZtc0E2RWNVVTZpaGV6ZmRKQnhwNHlIRHV6eHUybTZs?=
 =?utf-8?B?N0lzeUJXQXl4RURTUjM5M2VYekF2QzNQWXlrMGhFU1N4SEhyRDUzSGY5c0NP?=
 =?utf-8?B?Lzg0UnB3VDlBU1UwYkZ3Nzh6TjJTNGkzS2tBNzVTdzJjdXFUQXNhWktudFJw?=
 =?utf-8?B?blJBTHFHMWV4eUdSOENOTDRQRXZBZjUrc1RzRGIxV0FZUTNNOU5YK3lpNmc5?=
 =?utf-8?B?azdkajR3NzZ4Vkp1bTNHSk5pUUE3dzNEU2N2Qm1YUkNreXdudEliWmtwamVQ?=
 =?utf-8?B?SGxEMG1aUi91aHdQTktTTER6alhiYWhSWE5McFEyK3BBOHNodDBYcHlSOW92?=
 =?utf-8?B?M1NzQU1NZEVuNXIzRi9QRjVoWDNBNnhndW1sNEo0aUVoeVZzNkcvcllwSjVw?=
 =?utf-8?B?MkpPYjJiZnZmdVphazJLU0taNWVOd0d5Tlg2QURwY0dMMWQ2Vm1zbUxENFVj?=
 =?utf-8?B?RmMzV2doMzVMOUVVWUllc1lobTRBZVlMUHpscDlIUTYrWGE5eHIxVGIxUEhl?=
 =?utf-8?B?c1JVQ1VuekZ4NDFZMnVpZlFGKzFKTWFzZUU2Uk40NitwQUxnUWJ3UjFKWDRR?=
 =?utf-8?B?b2VvakZSZThzL0NBUFVGbWhmQmJCdWlHcE5YaEpTeFhXUEF6bUd1RVZUYkhm?=
 =?utf-8?B?UWtoaVFiTTNybHRHNlI0UUI2T1FhUG54ZXRkMVlOQm9GeUZUNDFOSitGTHpZ?=
 =?utf-8?B?VVlDbkxaRmRONkFmSHJhOFNDcEFBRUZzTjlhQkFvekdiQU9jKzNCcE52SjRF?=
 =?utf-8?B?dk5VUmtHVHJPa2RDMUdzZ1dxQk1UN2p1Y1lyQTNMMlhNaXNuNDAzVG1HMHdE?=
 =?utf-8?B?cC91cjRKeWJXbVRIcGNFd2hjcG1KOUcrbzJiUjBPbnZTMkdUQUdsenBBVzA5?=
 =?utf-8?B?ZnFnNEJMVTE3eWRqV3pzaHZoMkp2eDdKMEpDd0lYR0tnMlUrMEJKdzQwWEVT?=
 =?utf-8?B?L09SSHh6cDlCb3dBYmwyNjBTTVRzWEhiR0lLbkEyS2VKeFpnMi9mNjBscXRv?=
 =?utf-8?B?dGlIK2VrSldBb0VaNkJEVzh3YWpGcUFBUE52OWIzOGlWNnlZRzR0a05HU3pm?=
 =?utf-8?B?NmF3S3pvakJlRThzWmVzSmtsMjFDMjJ4cXoxWDlhY2ZHOUowYTRXT3d6MFJk?=
 =?utf-8?Q?fim9k1FjdX7w7buztz6gz7n37?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9cd232-3c2e-43c5-7819-08dce1211550
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:25:39.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfKPBdAiL+iMtlFmVxWhltN/miL3NJn7aXBc3xtiX7Qm2cKDwS+F9L6rLijodUz2Wc3FAwcFwwxfKVU1hb1v7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185

On 9/30/2024 3:15 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Monday, September 30, 2024 12:41 PM
>>
>> On 9/30/2024 3:01 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Monday, September 30, 2024 12:13 PM
>>>>
>>>> On 9/30/2024 2:30 PM, Michael S. Tsirkin wrote:
>>>>> On Mon, Sep 30, 2024 at 05:45:48AM +0000, Parav Pandit wrote:
>>>>>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>>>>> Sent: Tuesday, September 3, 2024 11:02 AM
>>>>>>>
>>>>>>> On Wed, Jul 24, 2024 at 09:51:43PM +0530, Manivannan Sadhasivam
>>>> wrote:
>>>>>>>> On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam
>>>> wrote:
>>>>>>>>> MSI is the predecessor of MSI-X that allows PCIe devices to send
>>>>>>>>> interrupts to the host. Compared to MSI-X, MSI supports only a
>>>>>>>>> maximum of 32 vectors per PCIe function. But MSI has been widely
>>>>>>>>> supported by the PCIe devices requiring fewer interrupts such as
>>>>>>> Modems, WLAN cards etc...
>>>>>>>>> Currently, Virtio spec only documents MSI-X and INTX interrupt
>>>>>>>>> mechanisms for the PCI transport. So if a Virtio device based on
>>>>>>>>> PCI transport supports only MSI, then the driver on the guest
>>>>>>>>> will only use INTX for receiving the interrupts. This is really
>>>>>>>>> sub-optimal and affects the performance of the device. Because
>>>>>>>>> with MSI, the device can use one vector per queue (max of 32
>>>>>>>>> vectors) thus avoiding the overhead associated with a shared
>>>>>>>>> INTX
>>>> vector.
>>>>>>>>> Hence, add support for MSI to the Virtio PCI transport. MSI
>>>>>>>>> support is added such a way that it reuses the existing
>>>>>>>>> infrastructure of MSI-X, like the
>>>>>>>>> config_msix_vector/queue_msix_vector fields of the Virtio common
>>>>>>>>> config structure. This makes it easy for the Virtio drivers to
>>>>>>>>> add MSI
>>>> support without any disruptive changes.
>>>>>>>> Gentle ping!
>>>>>>>>
>>>>>>> Ping again. Virtio maintainers, can you please share some feedback?
>>>>>>>
>>>>>> Overall looks to me.
>>>>>> A small comment below on single MSI vector.
>>>>>>
>>>>>>
>>>>>>> - Mani
>>>>>>>
>>>>>>>> - Mani
>>>>>>>>
>>>>>>>>> Signed-off-by: Manivannan Sadhasivam
>>>>>>>>> <manivannan.sadhasivam@linaro.org>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> Changes in v2:
>>>>>>>>>
>>>>>>>>> * Fixed a spelling mistake in commit message
>>>>>>>>> * Removed update to legacy interface
>>>>>>>>> * Used 'MSI vector' consistently
>>>>>>>>>
>>>>>>>>>  transport-pci.tex | 115
>>>>>>>>> ++++++++++++++++++++++++++++++++++++----------
>>>>>>>>>  1 file changed, 92 insertions(+), 23 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>>>>>> a5c6719..fd92641 100644
>>>>>>>>> --- a/transport-pci.tex
>>>>>>>>> +++ b/transport-pci.tex
>>>>>>>>> @@ -347,7 +347,7 @@ \subsubsection{Common configuration
>>>> structure
>>>>>>> layout}\label{sec:Virtio Transport
>>>>>>>>>          Driver Feature Bits selected by \field{driver_feature_select}.
>>>>>>>>>
>>>>>>>>>  \item[\field{config_msix_vector}]
>>>>>>>>> -        Set by the driver to the MSI-X vector for configuration change
>>>>>>> notifications.
>>>>>>>>> +        Set by the driver to the MSI/MSI-X vector for
>>>>>>>>> + configuration change
>>>>>>> notifications.
>>>>>>>>>  \item[\field{num_queues}]
>>>>>>>>>          The device specifies the maximum number of virtqueues
>>>>>>>>> supported
>>>>>>> here.
>>>>>>>>> @@ -371,7 +371,7 @@ \subsubsection{Common configuration
>>>> structure
>>>>>>> layout}\label{sec:Virtio Transport
>>>>>>>>>          A 0 means the queue is unavailable.
>>>>>>>>>
>>>>>>>>>  \item[\field{queue_msix_vector}]
>>>>>>>>> -        Set by the driver to the MSI-X vector for virtqueue notifications.
>>>>>>>>> +        Set by the driver to the MSI/MSI-X vector for virtqueue
>>>>>>> notifications.
>>>>>>>>>  \item[\field{queue_enable}]
>>>>>>>>>          The driver uses this to selectively prevent the device
>>>>>>>>> from executing
>>>>>>> requests from this virtqueue.
>>>>>>>>> @@ -631,11 +631,11 @@ \subsubsection{ISR status
>>>>>>>>> capability}\label{sec:Virtio Transport Options / Virti  in
>>>>>>>>> \field{ISR status} before sending a device configuration  change
>>>>>>> notification to the driver.
>>>>>>>>> -If MSI-X capability is disabled, the device MUST set the Queue
>>>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>>>>>> +Queue
>>>>>>>>>  Interrupt bit in \field{ISR status} before sending a virtqueue
>>>>>>>>> notification to the driver.
>>>>>>>>>
>>>>>>>>> -If MSI-X capability is disabled, the device MUST set the
>>>>>>>>> Interrupt Status
>>>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>>>>>> +Interrupt Status
>>>>>>>>>  bit in the PCI Status register in the PCI Configuration Header
>>>>>>>>> of the device to the logical OR of all bits in \field{ISR
>>>>>>>>> status} of the device.  The device then asserts/deasserts INT\#x
>>>>>>>>> interrupts unless masked @@ -645,7 +645,7 @@ \subsubsection{ISR
>>>>>>>>> status capability}\label{sec:Virtio Transport Options / Virti
>>>>>>>>>
>>>>>>>>>  \drivernormative{\paragraph}{ISR status capability}{Virtio
>>>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>>>>> ISR status capability}
>>>>>>>>>
>>>>>>>>> -If MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>>>>> +If MSI/MSI-X capability is enabled, the driver SHOULD NOT
>>>>>>>>> +access
>>>>>>>>>  \field{ISR status} upon detecting a Queue Interrupt.
>>>>>>>>>
>>>>>>>>>  \subsubsection{Device-specific configuration}\label{sec:Virtio
>>>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>>>>> Device-specific configuration} @@ -1017,7 +1017,7 @@
>>>>>>>>> \subsubsection{Device Initialization}\label{sec:Virtio Transport
>>>>>>>>> Options / Virti  \drivernormative{\subparagraph}{MSI-X Vector
>>>>>>>>> Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>>>> PCI-specific Initialization And Device Operation / Device
>>>>>>>>> Initialization / MSI-X Vector Configuration}
>>>>>>>>>
>>>>>>>>>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
>>>>>>>>> -Driver MAY fall back on using INT\#x interrupts for a device
>>>>>>>>> +Driver MAY fall back on using MSI or INT\#x interrupts for a
>>>>>>>>> +device
>>>>>>>>>  which only supports one MSI-X vector (MSI-X Table Size = 0).
>>>>>>>>>
>>>>>>>>>  Driver MAY interpret the Table Size as a hint from the device
>>>>>>>>> @@
>>>>>>>>> -1034,6 +1034,75 @@ \subsubsection{Device
>>>>>>>>> Initialization}\label{sec:Virtio Transport Options / Virti  the
>>>>>>>>> driver MAY retry mapping with fewer vectors, disable MSI-X  or
>>>>>>>>> report
>>>>>>> device failure.
>>>>>>>>> +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport
>>>>>>>>> +Options / Virtio Over PCI Bus / PCI-specific Initialization And
>>>>>>>>> +Device Operation / Device Initialization / MSI Vector
>>>>>>>>> +Configuration}
>>>>>>>>> +
>>>>>>>>> +When MSI capability is present and enabled in the device
>>>>>>>>> +(through standard PCI configuration space)
>>>>>>>>> +\field{config_msix_vector} and \field{queue_msix_vector} are
>>>>>>>>> +used to map configuration change and
>>>>>>> queue interrupts to MSI vectors. In this case, the ISR Status is unused.
>>>>>>>>> +
>>>>>>>>> +Writing a valid MSI vector, 0 to 0x1F, to
>>>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} maps
>>>>>>>>> +interrupts triggered by the configuration change/selected queue
>>>>>>>>> +events respectively to the corresponding MSI vector. To disable
>>>>>>>>> +interrupts for an event type, the driver unmaps this event by
>>>>>>>>> +writing a special NO_VECTOR
>>>>>>>>> +value:
>>>>>>>>> +
>>>>>>>>> +\begin{lstlisting}
>>>>>>>>> +/* Vector value used to disable MSI for queue */
>>>>>>>>> +#define VIRTIO_MSI_NO_VECTOR            0xffff
>>>>>>>>> +\end{lstlisting}
>>>>>>>>> +
>>>>>>>>> +Note that mapping an event to vector might require device to
>>>>>>>>> +allocate internal device resources, and thus could fail.
>>>>>>>>> +
>>>>>>>>> +\devicenormative{\subparagraph}{MSI Vector
>>>>>>>>> +Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>>>> +PCI-specific Initialization And Device Operation / Device
>>>>>>>>> +Initialization / MSI Vector Configuration}
>>>>>>>>> +
>>>>>>>>> +A device that has an MSI capability SHOULD support at least 2
>>>>>>>>> +and at most 0x20 MSI vectors.
>>>>>>>>> +Device MUST report the number of vectors supported in
>>>>>>>>> +\field{Multiple Message Capable} field in the MSI Capability as
>>>>>>>>> +specified in \hyperref[intro:PCI]{[PCI]}.
>>>>>>>>> +The device SHOULD restrict the reported MSI Multiple Message
>>>>>>>>> +Capable field to a value that might benefit system performance.
>>>>>>>>> +\begin{note}
>>>>>>>>> +For example, a device which does not expect to send interrupts
>>>>>>>>> +at a high rate might only specify 2 MSI vectors.
>>>>>>>>> +\end{note}
>>>>>>>>> +Device MUST support mapping any event type to any valid vector
>>>>>>>>> +0 to number of MSI vectors specified in \field{Multiple Message
>>>>>>>>> +Capable}
>>>>>>> field.
>>>>>>>>> +Device MUST support unmapping any event type.
>>>>>>>>> +
>>>>>>>>> +The device MUST return vector mapped to a given event,
>>>>>>>>> +(NO_VECTOR if unmapped) on read of
>>>>>>> \field{config_msix_vector}/\field{queue_msix_vector}.
>>>>>>>>> +The device MUST have all queue and configuration change events
>>>>>>>>> +unmapped upon reset.
>>>>>>>>> +
>>>>>>>>> +Devices SHOULD NOT cause mapping an event to vector to fail
>>>>>>>>> +unless it is impossible for the device to satisfy the mapping request.
>>>>>>>>> +Devices MUST report mapping failures by returning the NO_VECTOR
>>>>>>>>> +value when the relevant
>>>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
>>>>>>>>> +
>>>>>>>>> +\drivernormative{\subparagraph}{MSI Vector
>>>>>>>>> +Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>>>> +PCI-specific Initialization And Device Operation / Device
>>>>>>>>> +Initialization / MSI Vector Configuration}
>>>>>>>>> +
>>>>>>>>> +Driver MUST support device with any MSI vector from 0 to 0x1F.
>>>>>>>>> +Driver MAY fall back on using INT\#x interrupts for a device
>>>>>>>>> +which only supports one MSI vector (MSI Multiple Message
>>>>>>>>> +Capable =
>>>> 0).
>>>>>>>>> +
>>>>>> A single MSI (and MSI-X) vector is still far more optimal than INTx
>>>>>> due to
>>>> the inefficiency of the INTx delivery on PCIe transport.
>>>>> And lack of support on VFs.
>>>>>
>>>>>> And for sw based devices, it anyway doesnt matter a lot either.
>>>>>>
>>>>>> So when a new functionality like MSI is added, it does not need to
>>>>>> continue
>>>> what MSI-X has done.
>>>>>> So I request you to remove this guidance of INTx fallback on single
>>>>>> MSI
>>>> vector.
>>>>> Let's provide an alternative guidance then.
>>>>> Device SHOULD implement at least 2 MSI vectors?
>>>> I think one MSI vector is enough for functionalities, just shared by
>>>> all interrupts.
>>>>
>>> Functionally MSI vector can work sub-optimally, because now on every VQ
>> notification, the driver will inspect configuration space to discover changes,
>> generating more unwanted PCI traffic.
>> when the device notifies the driver, the driver needs to read the vq avail / used
>> index.
>> But the driver doesn't need to examine all config space when receive
>> vq_notifications, the config space changes are reported through config
>> interrupt.
> Right, but when there is only one vector recommendation, the driver cannot distinguish between vq notification vs config notification.
> And it will result in inspecting config space changes
That is true. And the driver can check config_generation to determine whether there is a config change.
Only one MSI vector would sure lead to performance overhead. But it is still the minimal requirements.

Additionally, the spec may want to say: Ideally each vq and the config space should have their own MSIX vector,
and should provide at least one MSI vector in its MSI capability.
>
> Driver can implement moderation to not read at < 1msec interval.
>
> So there are few options for driver and device each has trade off.
>
>>> So, 2 seems a more practical tradeoff across functionality / performance /
>> scale.
>>> And single MSI vector instead of INTx is of course a good recommendation
>> by itself to include as independent line.
>> It should be a minimal requirement, not for optimization

