Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF218C93F
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208724; cv=fail; b=tfK5ZceL5HW6tskm4Hb9Xv6Ktw20s73hvq7RIgUCR2bW119meI2EhQK/0ueqUDaa9Kd2vdhda3pBHqgp3ArF1z3Cz02GVN1J2OO7HKGiDcDWOmNOfs7dWGR9s03MAYWIzgnqKUiO0AZ54zu6Sd/La1LO/rxTx8D90dXi4PwsoCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208724; c=relaxed/simple;
	bh=VK7HXNLOQHmTwJArjCiyK3aFMbeQ5+8e0bLVoF+dRsM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DdRKDK9VKgJETu7CJH/xH9RKM6Zmh18KOamrwFCift6o1C7bsiKHfgeGcaLbpwSzF8Flr7yZJIe4pO8QQBqe+nfYwIWPkBfD7IW3e5rk1Ia60q+E/zeR1CJh+OVZsOjlkSO2Jlhs0Rx1E7os4ou4x7i9Lr+tdl6/Y6Cet8h9Ezo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=bQld46gE; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="bQld46gE"
Received: from 40.93.78.5_.trendmicro.com (unknown [172.21.10.233])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 671661019A90E
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 12:53:29 +0000 (UTC)
Received: from 40.93.78.5_.trendmicro.com (unknown [172.21.193.255])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id CBEFB10000080;
	Fri,  9 Aug 2024 12:53:21 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1723208001.105000
X-TM-MAIL-UUID: 2200873d-6176-4b0c-9ea6-9622c7f4471a
Received: from FR6P281CU001.outbound.protection.outlook.com (unknown [40.93.78.5])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 19CB91000030F;
	Fri,  9 Aug 2024 12:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE4mTPuR/EutyuBBFROHIYQJaBsXsugyILa7ET1ztMgm7R97AIFiRNUvhrKfz1WkQvJ8tRHZwWPCL6w7wJ3X0RIWCmsl6oVx2plt4/7q3dR9I1RaEK6/SBn3Sakff8FSRBg+4SvZ1U8KPStgc1vEkC+CcrN2wBBfMtHRsvPPwWlRZWYt8Q9fC9EwOM6fmcMLuTYORYE4CEE/R3+wSwGyzHB8skL63SnMqD1LI3U6Guqxl0XJ9jY+XChp85UlmVbWo63zCEONy0OSpcls4PrX9t1SWB5LFpTtfZ+NGtncUy//DKdytEZ+8PLmAA37bECjsFYyPlXaIPZ6iN1jJwujxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZD9G2RxuLyRfH3DgME+tf/zeoI5FaTEFmiAalYBgac=;
 b=RkRDdSuh0KMfxMPXvH9P3UyhdSvSn802K0nWEi1fBL+jLjzmxZy+Cvozpwc3BaEyg81ORQc39lZ1q9KhhB8AQvGkW5BzLJyyfzxokmFC+mAKV+qAIvSVHyH4b8wlgmTbQrGlP2vAPKw7quyuieCe8tdwTdKe0hqMxk4rhhtAu2VBi0innZvlJDCV+pIMjAaoVZ+uExngkXKzwYubBYRjI/vlERagKPAq6q2mxCKqavUCi4SbG1VYZxiLIYnylbso3lVRo8ALeOFxnkVVARIEljYmkL5/Plod7Pgr52Ersi2ep5czfWoprYyXpGZGnSS258QPmFysm8qK8RTCUkKEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <57b03b96-f2a8-4130-8101-9eff6118c4b3@opensynergy.com>
Date: Fri, 9 Aug 2024 14:53:18 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [virtio-comment] [RFC PATCH v3 0/4] virtio-rtc: Add device
 specification
To: David Woodhouse <dwmw2@infradead.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@nvidia.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20240725005322-mutt-send-email-mst@kernel.org>
 <4ecf6fe856c7237a3e5207c1cb97010f42546a47.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <4ecf6fe856c7237a3e5207c1cb97010f42546a47.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0003.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::6)
 To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|BEZP281MB2198:EE_
X-MS-Office365-Filtering-Correlation-Id: 6266fdfe-bedf-46b0-05d4-08dcb8723e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmNXcW14TWJ6Vml0TGRLV2c0aDRwYlRQVm5aTnZmOGxSZnl4N3d5dlE2ck1T?=
 =?utf-8?B?eGZESlJpOEF2UFRTY0o3SFVrWDI2ZnUvMGRrZHQxRUlta1BuRGNrRVJieG8x?=
 =?utf-8?B?bkhrRVhXS3hNeDM1UDhqRGx5NTZ5WkdWWUZ5YmQ4VzMvNUFYTC9pOVdnQ0M1?=
 =?utf-8?B?TzZXMUlLMkZMQmMvc01EMUdkQ000WE5vQ1Uxc3RZZUNWenZWaDBuQUxzdTU2?=
 =?utf-8?B?Y2Q3RTAvU1F1TzlHTDFRSFU0T1hTMUtVeDhlWVh6OTdEQ2tmVTJJSHhaNVFq?=
 =?utf-8?B?VDhWNk8vaHJ2MjlXTW5rK3ViMStwa25BMHJoNXNhSXJIVVpDSDZaUkhISzF5?=
 =?utf-8?B?WFc1YUZKUFdCM0pVS016bmtoNlIwWUNieEFGOGJiTG85eG96YW9UZDFmTnE1?=
 =?utf-8?B?dnpnYmlGelVPVnVIekRmVWRyM3dYMm1LUnBpa25oZHg3NlFEKzR3cldyQXNv?=
 =?utf-8?B?aGEzMzBDTVNYd2tZNXBUa1dCdStHMWVLRjF5TUdEV3pvVkRPdU1zMWJGdkpl?=
 =?utf-8?B?RmhaVkRCZEQ3eWxUaTI4OGROaSsyMll5Q1VtRDNGUW0yZUptaVFKU1JZRmNM?=
 =?utf-8?B?S3N5ekk3NnNOOFVyRVhpK2pyMHI2bzJwQjl0UE56enl6dkwrOU52UHpycElh?=
 =?utf-8?B?TGY3UHJ0TVI2N2JtR0RBMGNIbGpKU3lEbWRWdks4WC92b1Njc2pZMTc1K0hM?=
 =?utf-8?B?czVrYTNuVEFGaFNaZmF4NHJNQlcvOFhIcTlwVW1JaEQyZTBXTmJldE9SNUgv?=
 =?utf-8?B?USsxVGRtZjlXTTlaVkFZMlRhWkNDUnFVQjN5dkU0MVNFejNoUGIveEZSazBU?=
 =?utf-8?B?TUVzK3piUEgvZDZkTHRaK25aaHdvR3ZobDFCL2RRbzFDS3hJYWpIdW1ScGZH?=
 =?utf-8?B?bm5pSEpTd1lwU3ZkYnMrSWsydURPNDE3SUVsMjRXTUZFUmtGa01ReThtZXFD?=
 =?utf-8?B?QnI4SGM0RmNTK1VlYjVoU20xbTN1VERTV2FqQlU1WUJPZjE1L2FRWExUUHUz?=
 =?utf-8?B?cFM0L0VFUSsrNzAvQmVBVnhxUnQ2QTdSRCtTU2lBZGJldWh5djVWS2p4OFZN?=
 =?utf-8?B?U29BN1lKVzVmQW1zb1BReGpsOU5ROHVyaWVTekxCSlpJcTJvdFpnSGp2czhP?=
 =?utf-8?B?Zm85Mzg4aVRON3g1byttT2dOVTlLWWMwUmo0RytsREM3bmUrS1FoODFxNmJL?=
 =?utf-8?B?cVFUdHc0RUJkUlE1Znh2cjlxOHd4Nk9FeVhFL1N2SnRmUHBMT2Y1TXR1MGJQ?=
 =?utf-8?B?Q3huUTNuWUEyd3Q1eUNIaEtIK2V6anFrRzVtYmM0OEpMcGVHaFRMRGhwQ3I4?=
 =?utf-8?B?QS9UT25QQkE2MmZUQ2EwelRaV2hZMnN6QzhURXFMazNDREkxZC9BMUkwY2g0?=
 =?utf-8?B?dk1IcWU1VlQ3K3FJaXNicWJVMU9hTG1OVWtEWXlWUlNyd0pncmc4NTBqM3lP?=
 =?utf-8?B?bW5zTmplSTVDSW1Sc2FLVUJQVjJqRnFlQmg4ZzhqRFhFM3lyemdaNk9PNGFN?=
 =?utf-8?B?M1dZVjNKenliKzI1bnRvcXJ4bGN2RVlMODRwRHJJOVFDODZ5NkQxM3ZodHNx?=
 =?utf-8?B?OEdzaFM4OFF0T1JXVXhodUcwWE5sZ2RUSmhPZnpoU25pNW1wUDgycjV0WmZN?=
 =?utf-8?B?akJEYkplcGw2Y2lJM0Z6M1kxbXFiVWNmMUIvU3VxbTVmZHNsTlBVU1FzeS9N?=
 =?utf-8?B?N1RnWWJhL3M2eXlTTzZVa0RRMU1rTUNCdmtxcmdoVlVtZlRJeUFaR1NRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alliTDhWaWRWSFRzZ3paQVYxbDMwVUlTOE9lYUdZWC9xNExubFJDNjBmKzRI?=
 =?utf-8?B?SmRKTDAwRDc1SzJIR2pTNEpONk9vb0RyTFgvdWFpOHhPMWcvSC9OSU0rQTFF?=
 =?utf-8?B?dXoxZXBDS2RQcWZyaXdwQUVzN3RnbnV1MUNVNWpTTEN6TGdzOVpVWFhOblF5?=
 =?utf-8?B?TCt1QXB2S0F5aTNsdzVzbU9JcmJNS2Q3VHBaZWFCSjFDU1kyOUxLQ09JTDBn?=
 =?utf-8?B?T3RLbExsVVd2M0tJMGdmRE1jbHZ6aE9UTkdPNlJoYXFMT05NclQ3eW1CRGZI?=
 =?utf-8?B?T1AwM1NhazJSb01RdWFjU0pLcExpeEhTNzJxZ1F3VDdtZU9LQmFLck1YMTFp?=
 =?utf-8?B?Tlg2MEVyQ2FCK1daNmozTG03QTk3eFllYnd2SnBhd3pGMUF1ZTd1WjBGZVln?=
 =?utf-8?B?aGVXL1BucGVHdVJMMzRSU0dSMTYrTTNWWHRXaU1ObUxwM0tpVCs0ZzNmYXI2?=
 =?utf-8?B?OXVCMTNKR3R2L0VxdTk2OTZOb1JIZU9jcHExeHc3dnArL0V6SUpBZVVIcWF5?=
 =?utf-8?B?a01rdDlmdWFHenprSDM5SCs2MnFkVGY3SFhrNURic2tjUkx2Y0VzeVI1WU53?=
 =?utf-8?B?L1FEWEVXNWxlVUZLVzV0WkJFNnhvT0pEZDlwdTg2MjdoeGc5b2hmY1c4OVhB?=
 =?utf-8?B?S3NXZmpZT1UxT2VBL2Fnd3hiQmlSV3FyUUVxNGZncFIrSGtUNHMxQ0w2QTNk?=
 =?utf-8?B?WTZRVU9FMk1sOGQwQndmc2s2RkNoZTdNeWpQRWNKQVlISktkQnFlcmFxT2pt?=
 =?utf-8?B?MStCbFdZNnFGTFZWaUhTNU9NcmVQbTNQc05SS2VPTGt5NG5XR0IzMnpvd004?=
 =?utf-8?B?N2FjWnNpOSttVGozNjNtRkJsOTk4aUVGUkFnejcrNmVGRFlpZVhLdmlOV0dZ?=
 =?utf-8?B?NXJvdjVCSm1BZEhpQXNkVlk4SDRUYS9yL0t1QkF5NVhJdHRsaTBrc0dibG1I?=
 =?utf-8?B?eDIzcHI5K21uWmwxUHNyKzZyeUlQWGJJMnViQkhwQjJ4Y1JCZUpyLzZtUmQr?=
 =?utf-8?B?MnZCekZqZmQwajJpcHJzUnkyVTFwaEI5S01GRVBvelo3dG1sWUkram5hbDdZ?=
 =?utf-8?B?S2R2Zmp5SCsycXgxbGJDR1ZPbnRodmJla3NWeTVUT3NJNEtJVkliY3NrVkdm?=
 =?utf-8?B?RTBQYTRYS2VnMFpsT0hnSXJtWnlYVkVYcHlVZmkxbCtHR2VBZDU1d2g5cDRN?=
 =?utf-8?B?bE53bkNBS21EeXk4LzBKRFZKblltcFlKNTRUUXdReXUvdEloWllUVTdrZ1Vt?=
 =?utf-8?B?OEQ4blExREsrUUJTOTRPWXdheTd5RFpuNXZlMVV0NDhxSFhJSXJsVXFwSlBZ?=
 =?utf-8?B?Qm1YTXlWTTJmcmpwbEtMeThUQVRLNU1xanpDcVBRNXpBQWJQdnVFOXU1Z1lC?=
 =?utf-8?B?cTZYdUhHdFFVdTF2K0wvUlhMa3g1c1M4aFZZUUUvYkdnNGR1ZnMzd21yaVVn?=
 =?utf-8?B?bUF0ZVVkZFgyMTQ4eSt0dUMrbGR5TkhyWDIzTGRvOC9lckpXVmVNNkZFR2pm?=
 =?utf-8?B?VGc1UW50WmxVVlpVdVQwNHQrdENicWlHTnFlaC9CZTNzRFN5SHpIQzg4TzZV?=
 =?utf-8?B?MG8rSVFoK3hUeisva2l4d3hsRWhBem1Sd29qTHZmZHAyaytvRVQzTFFXeGw2?=
 =?utf-8?B?SENWY1hYRS9PNXhiZXFsOGcrbWY1WU9nRXlpUDFPNEJMcFNxcXA3NCtmQU5I?=
 =?utf-8?B?cU1LSGlNL2grYTh2WGRRSElYY2x3Q0tUSWl1ZVVHUjdkVU81Zm1XYXRWTStR?=
 =?utf-8?B?OGw5RCtzZ3Zqd1hrY3huVGFwbEhtRFE3RGNMQlJsZHJoWUhuc2NQc2EwNFpm?=
 =?utf-8?B?NkZwZnpjS2JsbVArS1JYYnQ1V0ZzMEFEZUIvYXJ0cHZ1aU80Q1Nzb01NT1hV?=
 =?utf-8?B?TnRLNXB2Yjk0OVZnWGpJN3lTU0cwVXZLVjlsUDlOWk5IR05mOXczYnNueEtM?=
 =?utf-8?B?K29yaXVDT2liWEZlUG5sZktGbXdCVGZwY1BZS3YrVWRTVzc5TWdqcFJnOWZY?=
 =?utf-8?B?c0RXdWRHMUkyMFk1V3lMZ1dLQldRRkdTaWR1QnQzc3VCRmRjMmN5c0xHdThY?=
 =?utf-8?B?Smh2bFQ3bDIrcXRFWmFTbm9UYm9uZSs3RlZRRjlEOWgwTXRZT3N3M0FyZFFN?=
 =?utf-8?B?MmRMd3JIRGt1VkdrY2hUYlVTY3BLb3lGRE5uVmpyWGljNnpncW54QWNrM0Jn?=
 =?utf-8?Q?XGG1wVkcxnIXRcMrgNotKjFMpEnRvPuF4pdKrFxFsOSw?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6266fdfe-bedf-46b0-05d4-08dcb8723e7e
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 12:53:19.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuZ6SfUTaHg9TyIe5wk6cxy9OakvSl10ONjuJZHcuX4TzoKWA9iKBcvHmjYYS/d5U3FGXQBNGmYCk8q9CMFAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2198
X-TM-AS-ERS: 40.93.78.5-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1028-28584.007
X-TMASE-Result: 10--11.405500-4.000000
X-TMASE-MatchedRID: 0dFPYP4mu5T5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxhYt
	PiFAM/SvcQQjXLG6PQGyrQA+FaAzBdp+SXfZ1mpyeJchdZcr1K2n2i3kZizDsSimJVj5dukrr2U
	ZR/HJv/hBPzSMgZ5XbXWEMHF8clRqNVqd3XsX2VYlQx76zly9o/JDp0CY93MSKHGQohQFy1+IBh
	8op5+tsM2je917ppUJlbvyy5aFlFEg69NTvongp6rmVQfj/CdG7dqGWuybY1M+Jg7sQdznaEYV/
	vlA7lOdQFn/6y4YZU+Ol6JMPiJnDiT9X8pqzpZCbAQSvnY/AMXNZ57VOrxNNHDEHegv0sMV8cXe
	tDGWj5MtzfEEZFApabRchDoUW0Yq8GjCF7GkJjBCPQBD3xA/3aryV/2jRq/XEgg3cwDHl/1qdlV
	1LmbEfINlCgp1qvO8+elXIvQlkFilrcQNKg029ImRx7OV7paz3CH2ZNj9XqU58Sarp97J825FeH
	tsUoHu4OG1Bk18VWGOfty9FkFPhTy+Q8SHdhcKHRsvIEjU16Q2RRIMOrvjaQ==
X-TMASE-XGENCLOUD: a7e3dc63-304d-4e8a-8f27-15831494808c-0-0-200-0
X-TM-Deliver-Signature: 9C645FDE350219A55A2FACCB7261AAA4
X-TM-Addin-Auth: p/PBf0+WEZfnCZAM06yfTKHFEzwVFUgfzVZM5bioSySRlkC0nHssE9LocTE
	kKKN1244FG1CvleNUaUOvXxogHd9h3/HW1udEaiTvjFDtCvbEBcoSLY5TQJYrYfQWZYG4ZEYlCt
	kYGF6XOMaePkYnFKeCuEtKWhIoGd40io7K08UaCBrGg7Pewq3Sm+mI7o7HQPI6mf1InKVq1+kAj
	EpfrJUt/zCc5aSmF2duhnMN401T6NcSgpay8tUEX5l5xVfRELMoZ1jFgx5RdJfMYqbsNlJi8QEU
	SwyUcF6Inu4yt9U=.WBxMtBl8eUa0KWqv1VvPzUWUuNJJZ3ZZMMzO7//pMU+zuY1Nf65oakfTYD
	DIdiWphNJjZltchIYI0RBw3oXWDYlyWQmJvcOre+63vCot7/Tfw6d0XJ8zsaF/BYGvs7MY/7O87
	OIiZ2eXVPTOXcjO07u2VFyWp9CQoxuZ9KvL6aI+LGpenVydYr1X9OMc+hmcWXelvFyQ3O+I4Qju
	Yj+xF1ykbWvuYTi8Yo0p2+iXdfePxaxIdy6ze68PiIwESV8njbvxfdBS8KR9UUq3XMmxbZadUxx
	RPnZHJK3NPjpO4mI6fvRdXEBd691hSfYZp64rX6e2QLIZqvdDGGiVfifmgA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1723208001;
	bh=VK7HXNLOQHmTwJArjCiyK3aFMbeQ5+8e0bLVoF+dRsM=; l=2110;
	h=Date:From:To;
	b=bQld46gERquwNisJrhTraIyJmR+Ga0PLegka7Z8PzsGjDQSqxKSsWyyHiv4yDcZ0j
	 P8JlwCu9hoSkcTqe2ZP9oEJcP7r30wDJy5h0W7PvUBZDgHogdwGzuPcwdYLO2TVvAE
	 SBd4uypMlhEm7HwE94vdcrjy76b3Qq1DyTwWeqgImtPkFU0mxoqfCYqFxUEXsp8jLi
	 O1ik5cV0s46O6iI+aqiU3FtX9/iv3LVuMvWG7jiiYTqnvTTlieu832CAsosWNOTqrq
	 TtNtk/iSe2ImkB+QyTloxJ63E4DpsKg+mQmtZ6bSdkBLdLNgw6HufT2ua9ayjRLitV
	 k9bstZMcnAbIQ==

On 25.07.24 10:32, David Woodhouse wrote:
> On Thu, 2024-07-25 at 00:53 -0400, Michael S. Tsirkin wrote:
>> On Mon, Dec 18, 2023 at 07:42:49AM +0100, Peter Hilber wrote:
>>> This iteration of the virtio-rtc RFC spec
>>>
>>> - addresses the comments from Parav (patch 1),
>>>
>>> - separates the normative statements into a dedicated patch (patch 2), and
>>>
>>> - adds an optional alarm feature (patch 3-4).
>>>
>>> Summary
>>> -------
>>>
>>> The RTC (Real Time Clock) device provides information about current
>>> time. The device can provide different clocks, e.g. for the UTC or TAI
>>> time standards, or for physical time elapsed since some past epoch. The
>>> driver can read the clocks with simple or more accurate methods.
>>> Optionally, the driver can set an alarm.
>>
>> What is the status here?

The RFC spec patch series v4 was sent in May [1]. I plan to send out RFC
spec patch series v5, mostly according to the discussion with David, soon.

Unfortunately, due to the holiday season, it might still take one or two
weeks for internal reviews to conclude.

The Linux kernel driver implementation according to RFC spec series v5 is
still WIP. The implementation according to RFC spec v3 is available [2].

Best regards,

Peter

> 
> I believe Peter is on vacation and planning to publish an updated
> version of the specification in the second week of August. From
> https://lore.kernel.org/virtio-comment/85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com/
> 
> dwmw2> With this, I think we're at a point where I can seriously propose this
> dwmw2> be adopted into your virtio-rtc specification? Do you have that in a
> dwmw2> public git tree that I can work from to provide an actual patch?
> 
> Peter> I am sorry, but I think I will not be able to publish a specification
> Peter> update until I go on vacation. I will be back in the week of August 5th.

[1] https://lore.kernel.org/virtio-comment/20240522170003.52565-1-peter.hilber@opensynergy.com/T/#t
[2] https://lore.kernel.org/all/20231218073849.35294-1-peter.hilber@opensynergy.com/#r
