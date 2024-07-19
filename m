Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE30208BA
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377349; cv=fail; b=o2rSik5a4ZJ+fSZbwyJXYK6bY/sbgPVMY4Ex4d9mgfGQcsPQnsQrGiwd4s8ke3ND3K/9ZeYbncaPehMRMxu4MzqsMVxYAiqXL/DHfz71fRuJ8mzk7yFfwhkPAx7rttR1HoseyJVDX6QoYOAwhKG3Zv2S+y2lJokrAGaJCGs62gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377349; c=relaxed/simple;
	bh=uRSOM1LjtdLKUPr7y9hGdKrCFTDUR2RazDhNcdW7SJI=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fEUfj3az9A0vtfxNr4FWoiwRe7RlREBp5zM5MxgdNvsUCUfV8sImAQcR7pIUFbJ4X+W8DR7Vr0cDlnjYI/4aeeDSzEttcnfC0AJHFPtWH7OQ3rARjU6vtGhBQTIooHa9Xcg//G1RwmSagw6WRXapXXFSeTLBXio483nS2uNEKGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=lP1VeXXH; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="lP1VeXXH"
Received: from 40.93.78.48_.trendmicro.com (unknown [172.21.10.202])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 69E6A10062286
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 08:18:38 +0000 (UTC)
Received: from 40.93.78.48_.trendmicro.com (unknown [172.21.173.61])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 7A4A210001FAD;
	Fri, 19 Jul 2024 08:18:31 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1721377110.715000
X-TM-MAIL-UUID: 8c9fc63b-4c70-4ed4-9986-af6557406a68
Received: from FR5P281CU006.outbound.protection.outlook.com (unknown [40.93.78.48])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id AEDAF100003C2;
	Fri, 19 Jul 2024 08:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rv1N4LtOJdFaUYp4+pAZBRnmABiBBTbWuWx9Q0FDLAQWW4cpPunbXYo7mxIY8xnltzL+hDvUCO+2UMcDDbFd5Hvoz9igRMzDRIoxChZAMN+7EtkJpNtqM0979kIGwSOJxuuwF0Okodw/s9WBr9lmc3OMGauhdrvx5cKKSJD/9aqL4I7QqMMzNkb2QBFTFcvG77rdDUK4jc9JJ7yKqxnR64swpwYEohInwKe5R1H+q5BHBL/cRXEHTQsJtq2eG/g0KISEz/IoqUi88MuiBmzTnAw9GlWKgMimWbtLkGLjabiR90/FSIo5YoqI4UmEDGPjZ+xRi+pEO0frNM0f4dXCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpd5YVdgWXLElOg9MSMq2foGcCoWq0fNa2v+M0/o0jg=;
 b=pDwEx0cpTwldVFafPXQUSEzpGeXWPzlmzCRteyH7x8bmAazRVQfz1IMIhucqMdyZAeLQs8BgtVt+WPPPB1NjCH2QPa46NXFHL07TrF8S0bnfxghbzSj3heqoqIjFbO6Y3Vn9Q13qiaqoyasE8T0m8bKqXsDYCv6Hp8QlA143/z2P0x65KZ9CBTsIevP3J5PsoMLYTZuMgDBouMublL1B3vieHZmhRstipQSE+BC3DAmTGqwXtwka4BbxKS58UVXHhG0QQObL+DF69WH+wuQzEuN3QwNJ3AENjaUU6FLIhIu2LXBW/Qq3Q2aSeYN8sdHj3wtwwyY2gzaSyQqyV/NdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <16892c87-c527-4a98-9546-9ddbbfd062ca@opensynergy.com>
Date: Fri, 19 Jul 2024 10:18:28 +0200
From: Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [RFC PATCH v4 5/5] virtio-rtc: Indicate leap seconds and clock
 performance
To: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Jason Wang <jasowang@redhat.com>, "Ridoux, Julien" <ridouxj@amazon.com>,
 "Luu, Ryan" <rluu@amazon.com>, "Chashper, David" <chashper@amazon.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
 <20240522170003.52565-6-peter.hilber@opensynergy.com>
 <3935e6c2b4b73968d0c4728a3c1f429f121609e7.camel@infradead.org>
 <668b681a-8025-49eb-a75a-7dac4fff8b56@opensynergy.com>
 <41c09f2bd37bd476ce9e1582cfca1d2ba16a1a59.camel@infradead.org>
 <20483787-62df-4ca6-868f-71b4d4898323@opensynergy.com>
 <b1645fa81d693b899430f7210ae1cab7d28dbc1e.camel@infradead.org>
 <85c93b42-41a2-42c4-a168-55079bbfff71@opensynergy.com>
 <04b017a0bc97700ad1e6770c2c3d458d2f25708e.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <04b017a0bc97700ad1e6770c2c3d458d2f25708e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::13) To BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3d::8)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB1906:EE_|FR0P281MB1770:EE_
X-MS-Office365-Filtering-Correlation-Id: e37060b5-429c-41e5-9ec4-08dca7cb5ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjVLNkNnVDFPTkVLWWNOQlNVaWtSQ0l6MU9LbUR2S2FzaUEreHpOR3hFZ1Ur?=
 =?utf-8?B?N3BqMXRFVTlRcUVHZ3p5eitmS2V5ZVlQY2dOVmJZZmxFUi9JS0dPY0xMSkho?=
 =?utf-8?B?aW5QdSsxbDRXYmNqQUFpYURqSEVDUlJQQ1VZSXJFYzBMSlhJTlRmT2dxZVd3?=
 =?utf-8?B?SHpGYUZ4RzRnby92NEw1b0sydnVTTDVnMXFJNGRhTWRQa3V4SkJlQXlTY09I?=
 =?utf-8?B?NTMwMUZxS01lRzlVR0RsRmZzMUc0bE8vTC9aWHRLTE05QSs0cGdaSHBJeU1D?=
 =?utf-8?B?TXBhTTZzTHV5YzZVU2NxL1I5VENjWGZOREVxMlBvZXNhRHV1WWR0VjRHM2lC?=
 =?utf-8?B?aHhRSG1vc3dVQjhxeUc5dUl3dzBRN2MrcE55TGJHeEtHdlJ1VkFLUy9LcEJB?=
 =?utf-8?B?RksxTGhweFFsdE55ZUhmcWdEVXdmbjNBMGIrMXFBdG9SdDd2T2dLTkM2S0NS?=
 =?utf-8?B?dTVsR08vMnVjR0R2NDhRRWJrSnBHQStaSWlDTUFRekJoTHRuUVo1T0EwWXpO?=
 =?utf-8?B?Z1BKR3dobFVzYWZ4dnJUYXFZVlJISlpBeCs3RVRKREFTSDVzZjZCUmFCTHZE?=
 =?utf-8?B?NW9yMEV1amY4Q1A3T3hIUWgvMUcrUWRISmVpKzVQbUJsUFJyRGszdW5aZkND?=
 =?utf-8?B?NElqc1g1NkhZbHFCM2FoZnZMbXBhSkwxL0dXT0kyWXFVOE5URTJLRUtyMUtX?=
 =?utf-8?B?Mi9QdTZhMGQ1MzFVS2pEcGx4OFZVNC9DL09qVk1qeXRUL2J2b2lYQ3laNVBE?=
 =?utf-8?B?aXpiVVJSWFJhenlYMUxlcllBcnlqejdLM21xNnhiWkdnKzRmNzRRQktkcGha?=
 =?utf-8?B?UERyWVJUWkU1U1lHQWM5RmlBRk5VZ2k4M2RIN3JxSWlrQkpBdDhUMDY0TzND?=
 =?utf-8?B?WXRVR2FYRExXaHJEeEtGZFlYNXV3VVg0NzdsdUR3L1R0cDJjSnBCcUhScWlR?=
 =?utf-8?B?TnYraTIvR25yeGhGNFJDeFc4WEJIaGdFNzVVWTJlU1hDaGR5V3dYYlk4ZkpH?=
 =?utf-8?B?Ymt4UXNkNHdwSXlrbkxvL3NwSnI2ZWhjQmVLTUt3VFpCd2V3ZytyS01ZZ2U0?=
 =?utf-8?B?ditlZ0c2WFhvOGJlN0JENStXYmplYTFkTUVZa1Q4YitEQnFWeWJTVENXaHE1?=
 =?utf-8?B?Q0wwZERpMzdTa0tHMnl6UDk1QmdER2xKQlBnYmZrSFZuS1pzTlRBa3ZzRWZn?=
 =?utf-8?B?RzNMR2pPbTRmcFFtS0JlM3IwdDdLWUkxTkNHeXNlZ1RkWmpnenVVYnYrdXRx?=
 =?utf-8?B?dlBuc0Q3RENqdmNvM0Ztc1BlUkRIeEJGdGkzVkRFVGVXNmV3R01HTGo1Nm9l?=
 =?utf-8?B?d2hNaXRxTWxsc1pJc3dEQ0ladXZMbWhNTGpTSFV2cnlwRFBZTCtjUnRrWGFo?=
 =?utf-8?B?d2lIakhrTElIUjlnZEVHMjhERmQvd2FHc20vS3VVWHEyYjJzdlR5REFNYUlF?=
 =?utf-8?B?Z3h4eEdNaGpFdytCSWlWS0lzL0xPdm9SSUdDdFlMWFVLQ0x6VWtNTThTb1l3?=
 =?utf-8?B?b0RQd3d2aU1YbEpKQVhva0dBb0REanhzd1FJcHlVY3hXZzk3clkreDc2SVky?=
 =?utf-8?B?NGZuQXV2N1VPUEt0OWZRT3FzaTdPdUtSZGhpcVN3TVozVXJDSTM0amptNlN3?=
 =?utf-8?B?WURMV0ZyaWNUNUh2U01waUYxMnUxeDFFL2NEVXRnb1VZcmQyajlQeDVMOEFJ?=
 =?utf-8?B?K0RMWmw0ZGN5WndyRmk5d3pYTHllUnFjMjM2eEYxbmE2TSt1SHE0SDk2eUV1?=
 =?utf-8?B?RENBdFl0OFpucFlsQ2FMTkFON1c3TlFzZndhanN2ck9DanlPdldvOEFOREo3?=
 =?utf-8?B?aUlmUTBmRVBSSGVjcmpHUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUJaNzRLM2szanBCZjRMa2xrM2VWc2phRVNvTVFxVUxWaUN1ZHBPYWNoRTN2?=
 =?utf-8?B?V1BWQnVmSndadERySUtLSWp2bmJTalNhQjd3aGx1cko5RkU1Sm1xZ0htZmgy?=
 =?utf-8?B?Y3ZkL2p6NnRya29sNWtEdzIxeU1lekhGSTd3K1RkeVhaMWE2M0c3RFB4c2pG?=
 =?utf-8?B?WEk2UllPNVlIUVpjaklrMjRIbmFoaUJUWi83cXNnMSs0UUtGOHZIUTJFMnJW?=
 =?utf-8?B?ZE5aUnlBNVdybFJtaWtDdEh1MU1WZU1NVTNNMHk2SnJPd21hT3VNNWVpTTJq?=
 =?utf-8?B?aXk3N216MEg4Nkc0UXQ3bWE3cnBrTW03RXVtR1lPa211NVJPY3dkTzN4M2RU?=
 =?utf-8?B?V2VyZmJCRXZObThNcVExTG44cWZEVzRhcGlmU2hiZ2JCQlRIWis0RXdGYVMx?=
 =?utf-8?B?RUJ2RkJMRTBxVmRWemRxUFNHcjVobzhnTEdkanA5VFNpK0NsMlRWVUIxRk5x?=
 =?utf-8?B?Q3h5UWxITW9uZnh1ay9TM1lWN0dmREJaZjkxTE5DOGs3b1VEbmJlYjVxUDk0?=
 =?utf-8?B?UjMzeXJ3aXQwNHA0UDJCK252a1pkbS9GYzZhemptQUtzOTdsMTFWaWcrM0V6?=
 =?utf-8?B?Um16clN0ZFJaN3BtV3QvMTFya002NDliaG15bUd4d1hVZ2dCODY0WVNCY1Ez?=
 =?utf-8?B?a1l6dXB2TkhxKzVGcU5jVmdiQkRqdVMzTmRGMUllS3pmK0R2UFNXWXRYOTRR?=
 =?utf-8?B?N0lBa2YxVGhQRHQ4eEN4UFdqK2wrd1FsWWdHRXhGenpxQTNTeXVEcHhkZXFS?=
 =?utf-8?B?S2pyazJxYXNaVmNOakJOMTVlUFhBdmxXb0dSU3pSTDNVSUI0OXBReGNOaVBy?=
 =?utf-8?B?MzlCdTRwbWVZc0hLQlVsMWZKYjBCNStwUVd4aHJ0S2ZsZFhuZmtTaGNkUjRp?=
 =?utf-8?B?L2p2dlNYMUlKcmNLbVhOcHNmdUdYTXVNK2VtMTgzOHdndjYrWG01eFIrTy91?=
 =?utf-8?B?KzV2NGJoWmJQcVRnek91V1E1Q2J0Mzg4UStrdjliMWdCQ2FkNVhvZCt1T1hy?=
 =?utf-8?B?TTU5N2d2ZnVZOHRCNlpOMDl6a2FGTFhBenNHeVdEQktmMzRxaHl4TU5YWC91?=
 =?utf-8?B?SXNjM1pKWEZVUHRNTWJaOXcyN3BkL1k3VWs3SXFxN09YNGFjMWpNRDFBWUFV?=
 =?utf-8?B?S3hpdVg1SWN5U3k2UTZXWTIrekZZbUpVZmcxZVduYjQvcGNna0NSUFhMcURs?=
 =?utf-8?B?ZEFaY2RCUHlYdnZXa2NickQyQ3hPakxCUHVOMXBuVUJZZWI1L0c3SXgyS1J4?=
 =?utf-8?B?Nzk1c2F6b0QvVlMrWWQ1TVFtTnVCckFkbGY2dEJYWUhhSFZjYWNmTHpYOVdp?=
 =?utf-8?B?c1Zra09UbytIczV6MTFrS3MyNktUR2dlNFkzMTFLUzd2YTlrTWh2VFRWOFlR?=
 =?utf-8?B?eVVOU2xXTWRhdDFock11aC9mbm00dEVPNy9rRW13OTJIc29SbzJnUzM3R2FL?=
 =?utf-8?B?MGNzYk9Fb0NubS9GUmlSV1Y3dkVhRXNKQWUvR09uNk9oNks3dVNQZXlPbHU1?=
 =?utf-8?B?cllxZzJ0YjI2WHdZMEx1R2pPU0E4VHNMU0svemttcTkvT2tVRHh2VjJJSHpJ?=
 =?utf-8?B?bHV2UUF1WFIzMmovTllxWWRya1lVUHE2eTRJcll5azZHK3BhaDYyOENmajFJ?=
 =?utf-8?B?YzJYa1VQV3k4VUtCYjE2QWdIdWdMQmdWUHlBL2k0bmhjcmFOeCtSdU56cWpK?=
 =?utf-8?B?TG9pQkJpMmc5RlJUVlp1a1pKV1F1eWd1bFNnc2Z5cGxGRzN5RVdmRkFta1dp?=
 =?utf-8?B?YnVOZkJOaHJmdm42bEFJQTlndWV0eTRoOTFrdkJkWkRKQWtkdUQ5SHFYcTZH?=
 =?utf-8?B?dUxFcTBIOFpZZkU2d2ZhQTBuQ3g5aGpKZHh5bzNPNzlOa2h0OC9COStaNFNT?=
 =?utf-8?B?WEtWUHcyYzUvamlEZEpmK3l1c1pmNk1OMFBSam5GUloxcStRRDQ0OHROYmlu?=
 =?utf-8?B?YjNGbTMrRGhPZjRFcDVBc0Q4c2RuMTNLaTZWaFBTMFRyNFo1c2xQQVVtcUMv?=
 =?utf-8?B?MU9QeGNFZUlnOWpuZkZUTlo3VzRwSEtmVC81T2l4VDVhZ1ZyeVo5NnpydEFr?=
 =?utf-8?B?K1ZzVGVhSDFEV2lvZElWWDFzQUdTVUdKQ0NXU1FjZkFYaFpqZjZyZHY1VWhy?=
 =?utf-8?B?QVVQc1VTdm9VS0s2T1h0Sm5RbTZUSHNub3pNRy83ZVNXTVE1b1VqcWxVR05k?=
 =?utf-8?Q?r38+LQ5fpab3/WbILDGMd/dYUeEm7ygGoC7KK9U2NcS1?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37060b5-429c-41e5-9ec4-08dca7cb5ef8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB1906.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:18:29.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZisI5+C59vfLD46LT/2OSR1TBEpR1bGBOQsVZoDqjp454sxlIMl8wcXYDju4UHOYCWJBJbz9S1b4W1TsCvsag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB1770
X-TM-AS-ERS: 40.93.78.48-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1028-28538.004
X-TMASE-Result: 10--34.879000-4.000000
X-TMASE-MatchedRID: /77LoUQXvQ9TzAVQ78TKJRhvdi92BBAu8PHaxqpO3pi+cYeGav3bfxPO
	q1cdIHlXop7JXmja8bwJZ/A5am9JIsTWS8/I04YMyFDZkw29GneVmuhG06IIbUpAKho/DXsgxMs
	mWhLaTR2DU6AHFRntSHch4LMUsqX+LH/39ZFlthz6a0NEvI0IWjBIVxGdmKk9UlIbkKHClDnpcf
	T+N7qPcAXwsfI2fV35Zy9hZrfXCCDd3PtNp+DPY1mcWIT2GKzJzWee1Tq8TTRwxB3oL9LDFQgG3
	LXFYWBQszcwuy6HHUP/RMZ8U+YdKFvsA2Xg6UfRWNQ/tno5dvQS5Hzh70YD4moFPYQQDhzPq4oS
	REwsL1bKawGwgVaC7h91Q/en5t3gpSncAqKIovFzoxCmHXb7+qCfX1AcCU7MzNDP87/xT8ZZrcB
	BPAevqe7yBuNm0Hj+jTirkeRWYxpUMnGLJ8VtCgU/fEfRnflNyeo9RmNpZ2FIgZxsPm5gYPTRSq
	yCF4F8kNmtdn17ejOR29Cq900nisHNnPzReAZTpJgUXPcinGTJ+MXwxLqnFUFGZQj4DiD8hes1L
	7EqVuqxA7pVyH8J9tXNOAQ2MSi2muMpo5XKw29WPx536TZMQCNJD5fBf+OyEgr4awrAJkoWtOyz
	fwL8xlo7GmCOJYd1O50T9A74HCvgKP76fIb9PJRMZUCEHkRt
X-TMASE-XGENCLOUD: 28bb7161-c018-4795-a8ff-8cb764fda74f-0-0-200-0
X-TM-Deliver-Signature: DE346820DFC764C534D827D73EC2799F
X-TM-Addin-Auth: TGg6enkt/lSEf3V5NOrYrDTvStrssKcbXtGiKQnQF7azsHa4QKq/oMkPLW9
	eAE8rZ6SbIybBy5OiQ7h70PxviQCWpswgMMtMu/OnDPKgEs9SR4oIBdtQSOPoKisMfwN1/NB7cT
	pyvQIt8U+aj02jUiQ+4jaoPNQ/mmM2ENXJZB7Qce3Jlk4N1lDuCIc63GtT9PPqZMkFoAx6TaWWQ
	9Br/8Ykk5v3/dZsMUKo0nOtA+9DgjMzUaRJ0PYUbKy7UhHudR7QmO7j1889Bh2UkBCmirGKmVSb
	G+6Gv1q6MBxFi/A=.do/YryFcFycrMSIPGhEKwe0HESRv87oOOU6S6mFCy+kxDU7eX634haOoUo
	wy+sLhUL0HrERHhhSAzYzMZqmLw0tSPzcCmjKmv3NmJ4lBcX5Ii2RUQ6FkxdwpkpECygUYhNW58
	9Z49Bf9LuGcOqPLBNbGYR3HLW3f4dOyrYAJIwDTC4XGKyeWavyTDaU+H92/kyu9K6zBK+XBtMSM
	0CXXKbO5EQELh4ar+N5uUgaGg4G855UUvDKneJgSziD/ePmrKQKJQ08W44zP0p5caBLY7jXgpOB
	TgwHTYGB/lN4OKW60k7JZ0Ah7/ZGSQGmC4YpvGXAR5tb/Ce72uQA3aBp27g==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1721377111;
	bh=uRSOM1LjtdLKUPr7y9hGdKrCFTDUR2RazDhNcdW7SJI=; l=5172;
	h=Date:From:To;
	b=lP1VeXXHcvPkN9MxPC5nSn2zWruGSDCsIfCFoPwyRD7B3dVUqJ4fY3kKy48rjK+n3
	 QsAfcYJx/8XJOM1nevaO4sLZfPQ0bUs0kgLE4ONwFlenjNPlzLhFvSdDkpGfx1G2Su
	 nQc+rt+EK1o6Ftb/ZzBlE4wt1OzCMDaQ3g2hRKL7aXHoeXfztWnhc6Z4dE4MmElHjZ
	 Rlgary6Sf4ZxJWkUxsYV97DaW1In+wNMjgJXCwkQm48ybF0hISytKomTOqxGent8To
	 Sru1dX3mPi/UIVMHFnVdB1p5k04FBZpLuUiQvjMd3UN+uvtaJdr42N8LjeBu0/BDt0
	 cv0lKAB2TZmRw==

On 17.07.24 10:32, David Woodhouse wrote:
> On Tue, 2024-07-16 at 13:55 +0200, Peter Hilber wrote:
>> On 11.07.24 12:18, David Woodhouse wrote:
>>> Thanks for the continuing feedback, Peter. Since it's only changes to
>>> comments, I won't post a whole new version; I've pushed the following
>>> changes to the git tree.
>>>
>>> I believe I understood correctly that you're amenable to adding the
>>> VIRTIO_RTC_POST_ values? And I think the other part of the discussion
>>> about exposing ongoing smearing via this field does not affect its
>>> usage in SHM? 
>>
>> I will add the VIRTIO_RTC_POST_ values. But I think for the leap second
>> smearing case I would also add more values, like
>>
>> #define VIRTIO_RTC_LEAP_NONE            0x00
>> #define VIRTIO_RTC_LEAP_PRE_POS         0x01
>> #define VIRTIO_RTC_LEAP_PRE_NEG         0x02
>> #define VIRTIO_RTC_LEAP_POS             0x03
>> #define VIRTIO_RTC_LEAP_POST_POS        0x04
>> #define VIRTIO_RTC_LEAP_POST_NEG        0x05
>> #define VIRTIO_RTC_LEAP_SMEAR_PRE_POS   0x06
>> #define VIRTIO_RTC_LEAP_SMEAR_PRE_NEG   0x07
>> #define VIRTIO_RTC_LEAP_SMEAR_POS       0x08
>> #define VIRTIO_RTC_LEAP_SMEAR_NEG       0x09
>> #define VIRTIO_RTC_LEAP_SMEAR_POST_POS  0x0A
>> #define VIRTIO_RTC_LEAP_SMEAR_POST_NEG  0x0B
>>
>> So maybe the VIRTIO_RTC_LEAP_NEG definition could be removed from vmclock.
>> The other changes would not be relevant to vmclock.
> 
> Almost makes me want to suggest that the _SMEAR_ values should have
> constant offset of 0x8 from the corresponding values without the SMEAR,
> as if we're treating SMEAR as a *flag* bit.
> 
> That could be useful as it would indicate that the time returned by
> this mechanism is not actually UTC.
> 

Only VIRTIO_RTC_LEAP_SMEAR_POS and VIRTIO_RTC_LEAP_SMEAR_NEG would indicate
that the time is actually smeared, the rest is just pre-/post-announcement.

But if you think it's useful, I could still have all the
VIRTIO_RTC_LEAP_SMEAR_ indications have the 0x08 bit and offset.

>>>
>>> With this, I think we're at a point where I can seriously propose this
>>> be adopted into your virtio-rtc specification? Do you have that in a
>>> public git tree that I can work from to provide an actual patch?
>>>
>>
>> I am sorry, but I think I will not be able to publish a specification
>> update until I go on vacation. I will be back in the week of August 5th.
> 
> Have fun! I'm already on vacation this week, but I haven't yet seen any
> of my colleagues engage with this thread, so I'm having to do it
> myself.
> 
>>> We need it to be explicitly little-endian, of course, but I consider
>>> that an implementation detail. Likewise the signedness of the
>>> tai_offset field, which *can* be expressed (albeit creatively) within
>>> the constraints of the existing virtio definitions.
>>>
>>> It's versioned anyway, so as long as it looks *reasonable* I'd like to
>>> go ahead and submit the ACPI version of it to QEMU and the kernel (and
>>> obviously also ship it in the hypervisor that pays my bills), in the
>>> expectation that *if* it did need further revision before the final
>>> publication of the virtio-rtc specification, that should be feasible.
>>> But the *intent* is that it doesn't need to change, of course.
>>>
>>> Are you happy with that in concept?
>>
>> Some of the bit widths and defines do not match at the moment. I think it
>> might be worth to align those (from vmclock-abi.h):
>>
>> - counter_id vs u16
>> - VMCLOCK_COUNTER_INVALID
>> - time_type vs u16
> 
> Deployment timelines aside (I may or may not have used the current
> proposed version in an internal-only release for widespread full-stack
> testing...), I suppose I have no fundamental aversion to expanding
> those to 16-bit. Although we have about *three* possible values for
> each of them right now. I can't see how we'll ever get past about a
> dozen counters, and with smearing in a separate subtype I can't see how
> we get any more values of time_type either. A single byte really ought
> to suffice, surely? Can we stick with u8?

OK.

> 
> But we do have a couple of bytes of pad[] so if you feel strongly, we
> could use the two bytes after version for one of them, and the two
> bytes of pad[] for the other.
> 
> I quite liked keeping those as constant fields above the seq_count
> though.
> 
> I'd like to have VMCLOCK_COUNTER_INVALID added please; I meant to point
> that out explicitly. We need a way to indicate that there is *no* valid
> time being exposed through this structure and that it is *only* for
> indicating disruption (which is the most critical thing for now). And
> even if there's a separate flag for that, putting an explicit counter
> ID into the field would still seem wrong.
> 
> I'll be happiest if any changes we make do remain compatible, for
> "disruption only" mode, with an implementation which gives 0xFF and
> 0x00 in the current counter_id and time_type bytes. Maybe we make that
> counter_id and use 0x00FF as VMCLOCK_COUNTER_INVALID?
> 
> 

OK.
