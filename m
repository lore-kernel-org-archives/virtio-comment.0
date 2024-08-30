Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B47D07D
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 02:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724984428; cv=fail; b=ERzP7K8eGIDZOvrEu2mcv+x/hqAO2vMkkvAX6E17Oe/UGdNtQ78Cw3n4yD03efooW4FjsPjXVulHY2qut6Gok45Vt7i0KvhAAn1I3lZJp9WMrne3FAGHsNv6+mDfan8+/5JV/k6nswyZwtXT0VYrH4tQ1a7RecXvu8yKiWRSoQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724984428; c=relaxed/simple;
	bh=M2JSjx/uYjTPER+51JdzdLG9Y6IR97qwhcgGMpnQPIQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K1CIXrUW0EbTZZ+u0girwfNES0zoKZsbtqx8nXW29o3wh8Vro0LFPSOOlp9l2pugAKkwtHj/AFt97sEEJtZbZ35yENbdSDs4x47C9yhvWpOv83hNu+wJjnh9YEtJLW3g6fIlrnYYz0M6tTtk2wgdIwW43vLbA47RLJxsd5H+obU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iRA7/OFM; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iRA7/OFM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqxECK+D6o26I24EoXMfulOv1+Br2uB83qw2pM/SNx+vrYSK4mXP2NK49JK710+T8Zf/ROhiPwxfXa2/v/nR7PEvIqn9G6wMihlBpqUR//Vo513+XuLU0+8eOtNEMS7LVc2M/pbreA5CoYvvBhYFduvLBPasXir3/iR7/epuRt4FVteTJra6x/M79uvHhf57WeWjPzjwUoMKljEBdvw8t/OXy4H/6yOnh97TdVgRXKhA1g+QAQMJlwatma3XoTkKWbqmbsyk8iEUGVzG2rDFk1LHpX1swOtxdYZ+mARcnldcO8KZ72AlgilgAZTf3QiYsflrtGjQHUMwEHT8vbwIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3puiNiG9Py21P7BzA34K/Mj8pKcZ824HxTtB8hYUqOc=;
 b=AoqPctxlunw95zBNq2K9MWYcu2ztYaH3Ft0A+BMN9Pmz8elApwuGs70YRkeDrqHPmA0KO2+C8T3ihxIsRO4Qc+rGErFugtM83x7QD2JrwrMTEiPpSOOyjlE8w57z24zUEKT3CRaRE2OQ19B1G6A1azuK/T1vpOMPk+KA80YRfXnaDiqetLdVmZXRx7vRXSjrYhHs4HyMPUb05FoARutvdxXACU96Q+o+YUfaZnyZnZtuYWWeJhe+5uZEvD02vX5IZ0rmE21Qmx+mr61wWZDoqzgS4PHiOnrzH/CeQ1L5ucYzsHZL0vKKNy+UnaT6q79etuwlUCCRc6WOb1lCyDW4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3puiNiG9Py21P7BzA34K/Mj8pKcZ824HxTtB8hYUqOc=;
 b=iRA7/OFMjiP3K0Iqz9yyBSyj2paTzpUzoYFdlbcJg3k/2WNoExZ4FM112vUBzhVBeB60NqcCz9DAEx0RZ3PC5JG+V4NihXMgLlqQbHah0eDG24PyT/omPRpIDbByI9DDWk9AS126mcdkHVVwnI4GDVxV6rkUzGKqj91XaQKOHNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 02:20:23 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 02:20:23 +0000
Message-ID: <c4d5eed3-774b-4d35-a007-f9dff28ce884@amd.com>
Date: Fri, 30 Aug 2024 10:20:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <20240813035358-mutt-send-email-mst@kernel.org>
 <513de01f-92ac-4067-b005-54dfa4fe85f2@amd.com>
 <20240815064619-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240815064619-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5a::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5b5ea6-da0f-444b-237f-08dcc89a4d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1kzNFZKRUtDcE5lTndwV1REMVl4TXFOTS9IZzhFUDV0Q0lwaEFMRlE2M0Uv?=
 =?utf-8?B?SU9tazQyOUE0UFEwbFF4NUNnWFZLY3V5UlBrdE50RDRVd1ZDeHY1azA0ek5K?=
 =?utf-8?B?VDJiaXlyd2RtVU9yVERGdytJUFpDQTlFSFVXUDgwOVIwazdUaTV5YzR0RUtr?=
 =?utf-8?B?U0RvU0FxbStQaVdkYUFUUHJyd0ZZU2dPNEhSaDgzUnV5YUFhenhBTFhjKy96?=
 =?utf-8?B?dkxyZ0NLQW5OZDJna0lEM2ZyOW5rczlYY1NBdHhvbkF1TXFidWZIRWhPTnIx?=
 =?utf-8?B?Rlc0cGoxODZZMFliWGhkd3YyQ2FBRGo3NEQwUUZMdGNVSXpKcWZRSG1weS8z?=
 =?utf-8?B?OW92SzBQc1BhWDNHV1BuT0hMZ2szOUZUaUxnL1JmcXRMekp6WTZQMnBIQStz?=
 =?utf-8?B?WDVzVFoxbjFDQjd6MFpINzZIcGVEYk1SK3RhT2hVMUs4Q20ycFlOd0dmQ0c1?=
 =?utf-8?B?dm5MRGVrTi9WUy9iNTRYckNqdGdldExidHFmR2hBd3U0Y0RtcU51SXJQckh1?=
 =?utf-8?B?UnlIZWtwOVJiWHprb3ZEUlJ2OWVPQ3djSzVJaXo0eHBaR1pIWnZmMmpLZ3Zi?=
 =?utf-8?B?a2svVHVJd29mZWRxMXIxd3N6Rmd5WndHeXRyVk0rNnkyYUlsejV2WGh3MXVH?=
 =?utf-8?B?TitheElxdFR1THJsd1VON1Q4b3JZRi94Z2RhbWdYdnlnWThxY3craVpGb25W?=
 =?utf-8?B?NEFaN2dJUVpGNTVlQlZMdXM5UURzc3FOR3prN3J5Ulk4RFVsa2wrNE4ra3A1?=
 =?utf-8?B?eFVtckdFQ1dFc01RckhreHlwVytzL1ZSRkczV2hRQ21hY2gvNDA4M1F6MmJG?=
 =?utf-8?B?elZuN2d5UXNnQ3JVSG85Mlg2ZW41S1ZxUXJzRHNLS3NDWEFrdUxoeEs0bC9B?=
 =?utf-8?B?SldtdVduclVucWR1SEh5ZUxkMGRuVldNWWVvb2E4SnBIWk1QVTNXNjBwZW80?=
 =?utf-8?B?d3NqbUJqVmlzMFl0WE5ESnZUbEwrNElsM0MxN0JXNUEwNmw3Nkpwb1dzb2RR?=
 =?utf-8?B?QmRwYUJLcmU2aGF6QlVBV0V1eE12U29pU1JlbVloZWYrT2dlVVc1RjEwTE5N?=
 =?utf-8?B?MVRKbi9NMm4waXRER2lDNmt2UVBydzlaS2RmeEkwOWdNT3JhSTdoeG56VjVu?=
 =?utf-8?B?MVNaZm1raTgwYTlOTmFxend1UVpGRFNaanNDOUh4c085TmhraVkyWEZ3WUM0?=
 =?utf-8?B?MWhGanE0d0VXWFJRdjFCU09vdlFEMGlyV1hjQjJjYi9lcnI2aXJsUVo4QjFE?=
 =?utf-8?B?T1dpTG5jYlp0ZEVaaFRtajdibXNuOXdNNmNoV2RCOW9xRS9tU0dhRGhNOGph?=
 =?utf-8?B?YXNsTHY3cld6cHRZM2FKWVRiem1ybVFvYTUyRFR4aTN4SldIYXRiWXAzbXVT?=
 =?utf-8?B?NnhUdUV3ZFBIb0I0L0crV0VJVWRieXVlV1M1cE9CaUhycTM0dTNOMFhpeEJo?=
 =?utf-8?B?Mk5qZnBlS0hyOTR1Q0hvY2NBV01vY2RhenB4TG85MFJZdklxU1EvZms3Q1p5?=
 =?utf-8?B?L2d0Z3VjeEwxL2RvYlBIa1NNbzFlNmhlY1lWTmpnUWpQNk5iSXpMeG9KZWFr?=
 =?utf-8?B?OFNJYTZqRnZ5NHFmMXI3dWdFZU9vamNUNjhJMjAvN09kYndQYWh2bWNBTXFX?=
 =?utf-8?B?UkZib0xIVmJrajBXbXMxdHpROVpQMGRJNmhaUVpqZ0JTMVVKbmV2N3lqbkVM?=
 =?utf-8?B?RDFJc0s5VVB0d3VobEhtNEErbGFnbDFvUld3Z1RjdVJlaU1VQ2NNc2lvaHor?=
 =?utf-8?B?YkhybFR4Tm8wQlQ3MEs3NXFEdC9QdHFUNytMUEkxc05jRmtoZFB1NHk5elk3?=
 =?utf-8?B?TDhoeThMdGt5Nk0rQVl2Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzAyMjlXSjd1bnhyNjJVajUwcnppNnkya1djM05MRlNnSXJvb0xaNnpPbE5Q?=
 =?utf-8?B?blk0SG83TFNxZHdjYW96SHBqdjlCbVVyZ0RWWGNPZCtzNEdLYk9TWHk0SDR4?=
 =?utf-8?B?bVRDK0dna3p5M0FQbVBENFNWTmFaMDFVQTFHZ0FSdVBlK1QwNGU3WUlEaENo?=
 =?utf-8?B?eVpvZVorWk00THloTXNpczRpaE9XemZoSjRLSURvZ3Y3cVBQLzN2UE1ZVnh3?=
 =?utf-8?B?UnlaN1g1N3poTERwWWxqRXplTHErbmJtK3loeTFBZlB0emYzUktMcFVrTTdW?=
 =?utf-8?B?VDNxQ3FFUGtoQnRtaGZ6b1BDNzJoQmtKS1FWRGRkT2VsUDZsZVIrR3QwVFpi?=
 =?utf-8?B?SHFQN1VSTkk4bzVxRzExTUJXZzNiZWxoZWZkbVhaWkhxZVJNbEVNQUloUVI5?=
 =?utf-8?B?Vy9qUEJrNWFxS1hVLzh3anZtWTl3TFhOaERYR1YwTVlHY3Z4dHZjWkNSbE41?=
 =?utf-8?B?WVpSY0hIQldoNHQ1OUVsSnRxajk2L3oyL3lhaTlib0ZCOUdRNGlJQmFoU01t?=
 =?utf-8?B?YXRYTld5NEpDdFZ0cm5XSDhLVEdXSEswK1pIaXJxc2VkZzdrb3VZMnZzelBS?=
 =?utf-8?B?djhRUEFmUjFqK2FhWG9PZ0FpbUFuQTU2dWxpL0JtcmF2Ri8vcURyZDhMYXFY?=
 =?utf-8?B?TWpjdEJIQ3Nxb0krR0h4a1hMVzZxY1cybnAzdE9QaTlvbVFqNTQxcXpZWk50?=
 =?utf-8?B?a2hPMHI5LzBFd2h5S0tvQXpZRUZyMm1iUFgrRnpaR045Z2NqWm9xeDhEcU9x?=
 =?utf-8?B?S2lzNzJ5Qk9KSmdqbWd4WGp2djZ2QVZHZWRIMlV6NVhldldmVTVaK0doOWIr?=
 =?utf-8?B?V3VPbkVpZW5CTmZUNUpSYkJLS2NGNFBqWmFHVEVnRWIrOXRhRGt1WUlWdEVt?=
 =?utf-8?B?OWR0N3V4ZWVZTmZmNURUT3hBVGFzUDVhdmtPK01Hd25VZ25BRVl5c3Q1Nzht?=
 =?utf-8?B?S1cxWlFwMTU2ejhpV0JzYVZQVXNTTGsvdWdBWVhpN1g2REFmTHdNWWtuaWRC?=
 =?utf-8?B?UFcrTEZYNEI4S0UyOVlrWEhweG5lWW9WeENPdTBPS3BnV3NKSkEyZmpieUFR?=
 =?utf-8?B?aFFaYUNtelFKb01nSWtQdmJtWTUzTFZBMUlkSy9Ca1FSR2VVMVpvc0F1MkJh?=
 =?utf-8?B?bEtoUkRKQ25VUjFjYVlxU1VaamlnTHlna01QR2tjZDZQVEtYWnBMem9iSVNq?=
 =?utf-8?B?cGt0ZXRNR3BzcjVZYituNjVGZC9KblNrUDBXdERwMXF1a1VmeStIWnR2dWU2?=
 =?utf-8?B?WTg2aDhCRjFINEV1RkFyMWVFZk5jd1RnRE43dGpyUlRSUU5lOE5qeVBkZWVh?=
 =?utf-8?B?TlV5blFiOFMwVFJxcVY0ZnpLOElJM1JSNVJwSXFaSWdLV3dZcXVzL08rUG1Q?=
 =?utf-8?B?NXlrR2FjRkVRcllubytPZ1BSVGxVczNKbnNoV09heWwwZGxKM3pUTGdMaWp4?=
 =?utf-8?B?NGZyY2lXdi9ha2NTYk9sSmFHMUE3Y3VBUkJ2cU1TUW9lM2lvVFZPM0NiQWNV?=
 =?utf-8?B?ams0eDFmMkkzalY1MHlmRFZ6RFM4ZVV6WGtGaXJWT3d1SDdkcVdBWkx4TWFN?=
 =?utf-8?B?ekQ1eEdJS2wrSzE1bjRjVGgrSGFQUlgrTHlhNlVWc1V2ZUQ5eWVmS1ArTSt5?=
 =?utf-8?B?YXU5MnFyN2QvakVsb3JXN2UzcDl5YWszVlg3ZTJJSXk2SlVzdFQvNzJKWjRw?=
 =?utf-8?B?NktDdU5NMEd2TG5vOWpFTmxVOU9EOXllRDlFMThWeUtQMXo2a3lrTlFiRUJM?=
 =?utf-8?B?cDg3WDlKSnRzK25WdnRvRjYzWUwxcnF6WThOdnJxOVNsZUYxRkI3azVVOTd5?=
 =?utf-8?B?dnlhRVNhMjlsdU05bGRzbGg5WXNJbHFINmNTWTI5WEhGMVNKMmtBd2NEUGtU?=
 =?utf-8?B?bzc3bXNVeDVEa0NteHhZbnljYTZVOGZnS3ptTmY1bTR1Lzc3Q3h2ZFl0OEF4?=
 =?utf-8?B?OE52dDZQUmw3eUlwUURIMHcxbnlsbFhXVERzaXBaS0N6bUEwUU5WcmRjSnZW?=
 =?utf-8?B?VXVDTkpYRndRdHgrcnNUdFp3eit2TzVYbG4wOUM0YWpGQnQycFRuY3lqYTFj?=
 =?utf-8?B?OGc0YTZLMkJhMkw2SmE2cTNZSTFlcWNkZG1NdllSdUFYcDFYTjBteW1uRTdP?=
 =?utf-8?Q?rtBiGBFWXSugaGe6M3WlS8Lml?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5b5ea6-da0f-444b-237f-08dcc89a4d58
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 02:20:23.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4KX1fvQxMz7v7hNX3Y8zGyEtnRxn5kNUHf18vzuqLa93792wolbc7cJ+Gc9NL+9QIsl8EDquXQHtewYKo9dIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342



On 8/15/2024 6:50 PM, Michael S. Tsirkin wrote:
> On Thu, Aug 15, 2024 at 05:12:23PM +0800, Zhu Lingshan wrote:
>>
>> On 8/13/2024 4:01 PM, Michael S. Tsirkin wrote:
>>> On Thu, Aug 01, 2024 at 07:35:16PM +0800, Zhu Lingshan wrote:
>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>> Actually, it has no effect before DRIVER_OK, no? I would forbid that
>>> then.
>> There can be two cases:
>> 1) debugging the device before DRIVER_OK
>> 2) VM migration right after boot, and before DRIVER_OK. So it needs to migrate the device before DRIVER_OK
>
> Sorry I don't understand. The only effect of SUSPEND as you specified
> it is not consuming buffers. Buffers are not consumed before DRIVER_OK,
> thus there is no point to set SUSPEND before DRIVER_OK.
Sorry for the late reply, I am very busy these two weeks.

There can be other operations except buffers before DRIVER_OK, like config interrupts.
And the hypervisor may migrate VMs right after creating them, at that moment DRIVER_OK
may not be set yet, we should not block this use case.
>
>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>> +\begin{itemize}
>>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>>> This is still vague, I commented on this several times.
>>> I think what you mean is that until it reads status with
>>> SUSPEND as 1, it does not consider SUSPEND set.
>>>
>>>
>>> But, what happens if driver clears SUSPEND before it reads it as set?
>>> It would seem that should cancel suspend (which is a useful thing to
>>> support)? But this creates a problem as it breaks read/modify/write that
>>> some hypervisors assumed to be safe. I guess we need an extra
>>> SUSPEND_IN_PROGRESS bit then? A little too much for status, at this
>>> stage - maybe we need an extra register for this.
>> if the driver reads SUSPEND bit == 0, with the knowledge of its own operations,
>> it knows the device is either in a) normal operation 2). suspending in progress
>>
>> Cancelling a SUSPEND right after setting SUSPEND is actually a RESUME.
>> The ideal case is the driver waits until SUSPEND == 1, then clear it.
>> But there are various drivers, not all drivers follow our expectation,
>> so there can be a corner case that how the driver know whether
>> the device is resumed after clearing the SUSPEND bit or not finish suspending.
>>
>> I think adding a new resister can surely fix this issue, however as you
>> said, add a new status bit is overkill and where to place this new register
>> is a new question.
> Place it after existing registers.
I am still confused, SUSPEND and RESUME are both device state transition, just like RESET,
FEATURES_OK and DRIVER_OK. I see current virtio works fine for these existing status
without an extra register. And we can not assume SUSPEND / RESUME takes longer time
than any other states.

So, do you want a new register for all state transitions? Apply to all device states, not only SUSPEND.
>
>
>> So, to make things easier, how about suspend & resume the device sequentially:
>>
>> If the driver has suspended the device by setting the SUSPEND bit to 1, it MUST NOT
>> clear the SUSPEND bit before the device presenting the SUSPEND bit set as 1.
>
> I'm worried that it's fragile - one can no longer deduce
> the device state by reading the status.
It is the driver reads / sets device status, it has the knowledge of the device status I think.
For example, if it sets SUSPEND and reads SUSPEND == 0, means SUSPEND in progress.

so I even fell this is actually not necessary .
>
>>>
>>>> +\item The driver MUST NOT make any more buffers available to the device.
>>>> +\item The driver MUST NOT access any virtqueues or send notifications for any virtqueues.
>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>> +\end{itemize}
>>>> +
>>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +The device MUST ignore all access to its Configuration Space while
>>>> +suspended, except for \field{device status} if it is part of the Configuration Space.
>>>> +
>>>> +A device MUST NOT send any notifications for any virtqeuues,
>>>> +access any virtqueues, or modify any fields in
>>>> +its Configuration Space while suspended.
>>>> +
>>>> +If changes occur in the Configuration Space while the SUSPEND bit is set,
>>>> +the device MUST NOT send any configuration change notifications.
>>>> +Instead, the device MUST send the notification after the SUSPEND bit has been cleared.
>>>> +
>>>> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
>>>> +
>>>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
>>>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
>>>> +
>>>> +When the driver sets SUSPEND,
>>>> +the device SHOULD perform the following actions before presenting that the SUSPEND bit is set to 1 in the \field{device status}:
>>> what does "before presenting" mean? does it return SUSPEND as 0
>>> after driver wrote 1 there and before it completed these
>>> actions?
>> Yes, it should return 0 if the suspending  operation is still in progress,
>> It should not change SUSPEND bit value before finish.
>> Do you suggest we add:
>> The device MUST present SUSPEND bit set to 1 in \field{device status} once it has been suspended
>>
>> It says: presenting that the SUSPEND bit is set to 1.
>> Not a native speaker, but this looks clear to me.
> I don't think this is sufficient, you need to document all assumptions
> on both device and driver.
Would you please help me understanding what assumptions should be addressed here?
IMHO, the driver knows what it is doing I think.
>
>
>>>> +
>>>> +\begin{itemize}
>>>> +\item Stop processing more buffers of any virtqueues
>>>> +\item Wait until all buffers that are being processed have been used.
>>>> +\item Send used buffer notifications to the driver.
>>>> +\end{itemize}
>>>> +
>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>>>  
>>>>  Virtio can use various different buses, thus the standard is split
>>>> @@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>>>>  	handling features reserved for future use.
>>>>  
>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>>>> +   trigger suspending the device via the SUSPEND flag
>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>> +
>>>>  \end{description}
>>>>  
>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>>>> -- 
>>>> 2.45.2

