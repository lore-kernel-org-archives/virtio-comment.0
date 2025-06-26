Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350142AD11
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943209; cv=fail; b=GbSqO4o+2SlPuIBy9lfBnlrbFmRO2sFU/mRRkNEoeqlrD4+idgFNXGJDmDO1b/gMJ+jN4GqkWMVBQuw9nUzafzA6c2nn7MAXetKJN9RGqoXJX0HulEhXldHKAJOKLddGPmK+85QTlHAkia0fnQAT+wEHWLhsGIu4TR2uEJH1zjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943209; c=relaxed/simple;
	bh=cbJ5lMwLg/L6vobtApGJI12E8bGNZEBoPKD7oL7I6CA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XdHiYYGLrKRxcfddTjoKPKXaALeaTmsSaPZxP/P9KL3swiwtOerEB5qWwdlE/YXvbW6DksT/Ki/KTyBoorZ5DXy3QzcTRD7gyqylmTepTMxQo5zMlekA7TqO7ZP0oN/52ROl4o4gd/9v043+bjsUVxTOv2BR0HUJhZwHNJkoKPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=48I1yetH; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="48I1yetH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ274gEOzK91G4d/MXCTpZfKgCof3X+lM0DC9klEfP8TFg7O+1Zb4Za8BCQq+abgNI50xH06f0d30PCsvA5CreITRUqiZX4plhvHEjZpOFVDpXsWpaa7SpduGRfhlLG7nr2qGrA/vFtxkNVWGt5/eoqSP49ch3VLmT/K58eUko0yQ6MRw5+cKGBOAKYb434/8KHtdNC4JJIvPGugDZXFA6kmbuYarfd5kyngNl0M3uzgi13Jqa8q4FsoVOKbyhnh7KYtbMewnbfn1PsLJLAuXNaTgvX/FYyGcBoPybyYkLWH0gGD4myZBmghOR0YYHcNX6eqofANDy9X6LBMXBS9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzqADj1O6Z/2mkz4fvel7ngvgqYM8HWWUOb9wC5YZa4=;
 b=y/6SjaFz82rr5DRWWZuxXW4cRzd7haTw6PIBonVLAokrp/BjyN9egq1+XrTH+/Cy+hj5prIRamT7Q8khBRaub50rMuhVW4+OUHjFMcBIrDpducI7c1RwA+U2TCRJVgcSLyrRDfj96ha6EJcw/3yq9sPDfNaDc2C6EjVOkiaEYdZylthNWdtzRrQhPtCG/k5uC6EOBORv1uFHv6QBu8D56bjFXxWr43nQUEVr+PyQo/d43ijRcygudSsRnSROzewWmgvzhCN7ktEzPeuyvvyb2PJAZMmMlp4v5+yWFc6O4TOmnfQDBEIP21566WqUsd/CbunQgRJoKVhDMQiECJXRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzqADj1O6Z/2mkz4fvel7ngvgqYM8HWWUOb9wC5YZa4=;
 b=48I1yetHhU5ExlFDkyLYIUbpw5wo8GraFBJVfiKGfqp+91ksMixtv3osBR1DhDIBbT/gPogalrePCENPvyjSQlHJbbwbZnJCdYDf8fqrdNtvVhZv3lgU/KQ7cPoiJQa6VWTHifJwY7VatgkdzR+CtqK55/jhBqb+GqQ9DFCu/E4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 26 Jun
 2025 13:06:42 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 13:06:42 +0000
Message-ID: <7fdc3624-f2e7-444d-ab6c-81e31f960a60@amd.com>
Date: Thu, 26 Jun 2025 21:06:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] virtio: document feature bit 42
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-3-lingshan.zhu@amd.com>
 <CY8PR12MB71955662A5578EE0D5A8FC67DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB71955662A5578EE0D5A8FC67DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::20) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 775271e8-686f-4b17-bc8f-08ddb4b24bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTRURDVFUGxCVHd4T0M4K2R0Ni9YTGg0aThXK21YNjNtZ0w0Snd0NkEvbU1z?=
 =?utf-8?B?aVhSS0ZXV21uT0xLa2Q1S1FPUmlRNTM1RkJEajNya1dNWCtoSk9qZGNXSE5S?=
 =?utf-8?B?ZTdTU1JSL3hKTkM0MTdPdk02TGVXY0lVcTZYOGNDKzBQMVZNVGxQVW5EME9l?=
 =?utf-8?B?eWlJaFhYZHZ0UHBDcS9SblVEOXNxbU52dVFHaVF4ajFIUkNTRzczV1Y5a213?=
 =?utf-8?B?RndaSEQ2Wm13Qk9pL2NLMmRDUnV2aXd4WUZOL20zc0FWb3VhQXk3ZEFBSzlj?=
 =?utf-8?B?NVNhc0VqV0Y0YTZqZXNlODhVQ05EY28wRzI5dnBuYUpRU0tUcGRXd2NXeFFs?=
 =?utf-8?B?bnhDN1NQWGxycytUS3lJNnhoclUyNVQycU44QmV5TEw0YTRsVkJzSjl2Q0Ny?=
 =?utf-8?B?QUxWZndyTmp4ODhESWdvRHRDTUFoUzI0N2RSVVhxaDFVT1V6eFdFRzRWOVVD?=
 =?utf-8?B?TC9xRHF4SE04WGVZUEtuNFVDeC9mVzlKOVVCeEovUWRzZWZFSitSbFEyZFhL?=
 =?utf-8?B?Z2pwU0tDbDF6M0FVNFhtWFA2UGd5eGpHaWl3Y0k1RFl1OFJRZDE1QW5PZU0y?=
 =?utf-8?B?VVZGQlFkOHlvV0M2T2VhYmNWZGdtOUErRmFUaElzTHQzZ0R6VndSeVh1NG83?=
 =?utf-8?B?THNjQTNyR3kvL0dwSDM2L0JJR216cnhYaEF0Tk5MTzVRVUxTWTZQdVNuSmtH?=
 =?utf-8?B?TVY4ZXJxT0JrR285UU9kenhxcHl1V1F5Z3NCWWhGdVZ1bys4OVQ1S0prSEUx?=
 =?utf-8?B?R1RXajdnOGFaRjlkYlVpZTUydjYwNTREaWVGeW5jdWNqa1NqWk93eWFtVUhj?=
 =?utf-8?B?ZmVVTDJqdGc4V3hNczdSbTdDbjl6dnZ2UThabHhpM3BIYjZnSEZpQ0F6R0lE?=
 =?utf-8?B?U25yR0ZTQmlYeWYya2Q2WDg2SEFHTmxQMXNZRFpkdVA4NFk0WnJwc0EwcVow?=
 =?utf-8?B?VzRIQTlCcEtTcGN0M3hwQlNnUlVST3RoYmNJTFhaN2t3OTRScklvemQ2UDVE?=
 =?utf-8?B?L0FONjVOWXpzeXI0Kzk2ekZINDhmd2ZPQUl3NXBpMGhBUmphbG9TMC9Hek1k?=
 =?utf-8?B?SC9KZTFHbzcwWlRnZXFJQlBQZ0NJSkFMRlRVTjN5dUZaWDNmWUdpaW42Q3RI?=
 =?utf-8?B?SGQwYkIrNUI1T3QxQ2t6MWczTndYWFlqNVB6cW91Y09mSVg4Y2Vad0RlVjh2?=
 =?utf-8?B?ZkI1R1NoT2pIT3Y1aStzaXd1bFp5QVdEOWpLUkoyM2VkTFcwMGsrZjZDSXlE?=
 =?utf-8?B?S3VyTFFyV0UxUFZ6a09wVk9MY1VYd2NyY1ZVckdmaTNXZ0pDLzM1ZUREUmM1?=
 =?utf-8?B?UUFoeG9OQUhDT0pmUnFNTWszMklRWG43ZFRqMnlTNkVJNVRsNm9VVHd5WlBX?=
 =?utf-8?B?QWxaMXZvanVleXV1R2t6a216d3lWMjlCSWRFdXp2QjdRalFXQWc0RUhUYlhK?=
 =?utf-8?B?TDdQZ1gxUFlxVXhwd0NVTzFJYW5mTnFpZFRKczJXS3VncnAxTXFWdzZYVnpw?=
 =?utf-8?B?RkFiVkZjTEhaVHo0emZDdmt3N2V6a0FYZzQ0YXNvNUREVUc0dkdFUGwvZkhG?=
 =?utf-8?B?SkkvZHVEMmJ5RVpzYlRZMVByNk1HTDB3YXBoeU1YeE44aFdTV1JvaDY4ZUNB?=
 =?utf-8?B?a0U5cVdFQkU0TmlXTGJRNDJXQVJoc2pYR0w3WVBXaVI0N3dMbTg1N3pOWlpt?=
 =?utf-8?B?TS82enhzUGwzOHRSd3pmaUhRTXBEMHdCLzVPMjBqWllXTjNoWEd2VkpZa0Za?=
 =?utf-8?B?cnFteWs2YjBLR3RJNnVsWGV4OXRCbFpqTjhGSDZGZFBHODdtUlBxTHo0cFJl?=
 =?utf-8?B?bGxFYUJ1M2ZBOHpsM00wTWp3MlZqK0xjdzh5L256QmE1VzREYmowYjhIRDZ6?=
 =?utf-8?B?TjRaUFdDZitkVVVkMkk2a3RKYVAvM3Q1eVEvRmd5dzNMbkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBXRHhPUm5zY25KeEhkSHpIK1pxRG1PYklINVZ3K1dEZzlvaU8waFNob0x3?=
 =?utf-8?B?WnlZVXR0OTVUaE1jUHpYRGl4WHBBa1JOS3phSG80dFYreS9pTHZKVWNtOUlD?=
 =?utf-8?B?UjhjdXFTOUFjaUhWTUxYK3Zwak5nd1FjK1VGTkFld1pjYkh3c1RxRGMwYitN?=
 =?utf-8?B?TXpFalB2VExLTllsdEEzNkxHOUJKdmZYWHJ4ekdDbXI5TG90YnlWRzRlWDhF?=
 =?utf-8?B?TzgwZTFZM0FMWkFjQ2poaTVibjdFS1haTXptOU9ZZ2V1aXJmMFpzVmMrQTNP?=
 =?utf-8?B?TThyb2N4NzcwOVZQZmk5L2VjVjV0dHQ3aXRocTZXQ1VNYVFob1pTR3dReW1a?=
 =?utf-8?B?aTVKMHF5bnNzZ282SGkvUE9qbHVscTFPN0xzaDBEYUx0aVFOOC95ZHhldHQx?=
 =?utf-8?B?ZHU2OFVuUno3bjdDVzUxaDl3TDZUclVydTZBKzJVSDBVU3RJVmFXQjF0eVVi?=
 =?utf-8?B?Z2NXbVh3RGFibVlsK00xM1NYYjhMUkZRZWJ3N0FMU24zVlVxSGVpOHBIV1Z4?=
 =?utf-8?B?VFJNOTRjSmFEZkRnTmd2K0tLQUFzQ2lrUDEyYkU0TWZJSHNZS3VCVFZSRHdB?=
 =?utf-8?B?NjdGNUgvMzUzdGVyRjlDYk5XYzFNQ3NQK1BoUE1VUXBiWXFFT0RBa2hPNndP?=
 =?utf-8?B?UWtqd04yZnBwYWk1aUQyM05EeVl2MEU4SXZNZTZVMTN2TC9GNzdmYTEwNnBJ?=
 =?utf-8?B?YmFOZE5jUjhUUTNDSmxHWU5iaUNnZG1KbFlkRUVDd01sNm02VWp1NXM4MFlY?=
 =?utf-8?B?K2pKdGdHaEtFRGRTUEpRM1dydzQxZ1haVUFqMXZhOFZEZWEyRlFuQk4yNFNS?=
 =?utf-8?B?UFpPOEU0K2NZMVZpdGFhNHZiQS9XTjl0OWIxTnAvSEFtb1gveHIvTDBrNUNz?=
 =?utf-8?B?d1pqSlcvTFBIRXlsQWxBVHZlbzAxNlJ3SHVQcTh1YUFzc3RJSGY1WkFpRmhq?=
 =?utf-8?B?cEVUUW9RMGFjVnVQRi9JWE5uOGlFdHUxZzlPdDJiWXdmVTcrL3pTN2tkZllT?=
 =?utf-8?B?K05BT0NOdTFQYWdhcmsvSmhwU3k2RzZMbGQyWFR1S1JPY3hrNjBJajZoYVZk?=
 =?utf-8?B?SVVVN0ZOVXRJZ3ZzdkhKaStmRW5DSHRzRlU4cEVjc0treVUwRExZandSenFa?=
 =?utf-8?B?cHAvdkZJcXZxeFpSdGhJcUVNM1MvQWdkeFNSSXdFb3hKZ0dCNjZ5QUdpaHJl?=
 =?utf-8?B?UnU2WjZMQ2I4WSsxK2RZMXIwWEUyakg4bU54RnhkODdPMUsrc0t3NFBSNUdr?=
 =?utf-8?B?MHRJRXVZLzZiSkpJd0Q5Z3VSS3FUS1VERUpzSkU5b1FOTFFwMElOOUYvazEr?=
 =?utf-8?B?MXVuQ2JhYVRRakljU0QrR1doVnhxcDVLK3VBWU80S0szdENpMmFQTzJCTmt1?=
 =?utf-8?B?ckZsODY3VnRiV1RYendiaE5TNTUydStHZm5BZVVvNWorRzhVdG9UY1lKcGdp?=
 =?utf-8?B?dVlieWowNHNUSUxYZUkxblErOTV5Q2RmNlRMTVpLeDhCbysremExMmhXSDZU?=
 =?utf-8?B?N0pZV1VMbXYxOXgrVDAzanJNN3ROQXppVjRTMis4NU45NU4yV1RFdk9UWUFn?=
 =?utf-8?B?OE02UmNuTDhCYjhpdlkvLzh0TzVGSTlEbytaelBJalU5MXAxWE5rTVc1bTBD?=
 =?utf-8?B?Y256OWp4cndhWTlFQXg4Q01qM2RHNXJiWXpnNTlpcnFWeitiRERiWGFNVnNp?=
 =?utf-8?B?V1BUU29tNWU3RUV3RWVMaE1ZMWtobXJuRVpFcWx3RU5rR0RIUStkMkVrUEFy?=
 =?utf-8?B?c2tZdGpJVGpvMm83by9OQktMc1Z0S3k1K3RBbXE5a3Vlcm1YL3ZmbGJaU2cr?=
 =?utf-8?B?S25UQmxEMnZGc3JpbU9tbFpHVjcxbW9LUHBwL1M3dEZjSzliM29BQkgrUXU3?=
 =?utf-8?B?TEw4WHhHNXhTNlRPdldpQ0NwMTRqbms2QkM3SDdJMWpEWElQSTJvZDlObGp6?=
 =?utf-8?B?dmp3dGU5Qm9hZzAvVUFncys1eFJISGl2Q1ErNUxQQXAvYWhXU05QUUZNV1FP?=
 =?utf-8?B?V2dBR2xsdHY0RDJFRkd2RVpnb0t0K3Q4c3FZdTFEcGF1QVBlOE5TWHJibHFI?=
 =?utf-8?B?YmpsTFRHNW5uRS9jbnAwOUFDM21Qb2QzY2tQeGNFdHFkbE5BTjRYSSt3YURM?=
 =?utf-8?Q?7CYEGFrbaUCTxaTfEUGKCmkVc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775271e8-686f-4b17-bc8f-08ddb4b24bad
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:06:42.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SShQFN3/bOZ1Ap1MfrQTQeMCM8UOoD3jnBKmYLYf7lh3mDOHt7Ju11uVlNDhQNwZK6Hh/RqBYAyuXnW77SpaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468

On 6/26/2025 7:45 PM, Parav Pandit wrote:

>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: 23 June 2025 02:07 PM
>>
>> This commit documents feture bit 42
>> VIRTIO_NET_F_GUEST_RSC6
>>
>> Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>> ---
>>   content.tex | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 1efc2a5..2e8da46 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>> Virtio Device / Feature B  \begin{description}
>>   \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>>
> This does not look accurate.
> Bits 41 and 42 are used by the device specific type and not generic queue related mechanism.
> In this case it is used by the net device.
>
> So right documentation should be,
>
> 0 to 23, 41, 42 and 50 to 127 Feature bits for the specific device type
>
> 24 to 40 Feature bits reserved for extensions to the queue and feature negotiation mechanisms
>
> 43 to 49, and 128 and above Feature bits reserved for future extensions.
OK, this looks better
>
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>> +\item[43 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>   \end{description}
>>
>>   \begin{note}
>> --
>> 2.49.0
>>
