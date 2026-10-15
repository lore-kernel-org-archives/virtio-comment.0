Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA45326C0
	for <virtio-comment@lists.linux.dev>; Thu, 15 Oct 2026 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079365; cv=fail; b=VRd5f2xqKibBmc1OIkuRwFbi8PwUNK0Tw+B6QHHAwtwXqQmOqTobPKggD8rxQLBNtsYvP4QZGpFa8O5fW2iyrTt7UfwJ9omclsj7Cst1lX1RPFknXsxnoNxTp2NRvzIjNzwJq5d9YVISzmy3BxF+NEhZeAkhwdbGBTnlLWUbhfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079365; c=relaxed/simple;
	bh=l+OMvOGICYCeV2+b5+V5BcU0IOQ9puJp4d+eKtjT38k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GgwoClUFm6w+dWcnu97gTr+gi+TS6ZihHdXOinNtEkAOMOpX1qsx5Qk80VUSIsBsJ61axgDpvcIMMhYZ0dG+ij4aRNGSSGn4XxNrHXXLGNgRwcRH1XXl/tXvEkxigpuqmxxk60nhNqLJknCkt6r/yUJdPADHM0zYXF3XAg0mHdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q61XYgeX; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q61XYgeX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfZiCO2Dv7jUfuYia3nqbVkp0qlGqJjgYLdCkNNcHSIrlmUc1B/xTTI3521omi8aJQP1y2lmuXZvkC2B7wuyC6TAH48+cXXtdUx2/cdV4MjDQKU6X92/Nq/bU4s8JiVlnY28OUcrfdwUsdA5kwQTUWJWDS/bKhvRmtMKOrmqOPsGzXQFvP77uaMDiT0GrncNONNDszmWkyLat4qHJ+K9KcosuRp3oO3hsgDSdWzMSmYyIsKsuDxRUboFTOaekDxJxVkBCTG2SUOI+/wGOcpLucU8EN/CmUnGYjOFYChCvH92jzNO+5peN8OboMsd6fuGVJEeZjqf1YAEzUzhRAfaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jX1+nvOfEErF66vT0Rb8l2eX3ImyTkUzLWcPSKIjumg=;
 b=bVu79lrz/mSZkayvHLg8ZmHPeJVh4epBpD/FCDA0adhjtU3gNt8yMWJs7orb2Vyv9H8x43/HSGgM0HkgLYbFwcIw/b9XSZE2f+ZNscRHOzgDeXSBCcYLN5KpfhJALBoM5ghVZq2MeBvuxED0NLnbLiaJL37GqC2gQijsnaY52jB1+y8JAiKMzB12nPZ9rLTRa4kdWQ4lgZ/gxOpjCWWZqHDvNUE6CudfF7vtr5XFyqt6hkcj/72Rpus/bNC1j7Kavu87vWKDv6m3uC68gtJz2RzAr5mUokHLMLV038c5HKL8DYFIl3IkUuS628FxVdGS+KPDdeSm9vkMmJVjAEsFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jX1+nvOfEErF66vT0Rb8l2eX3ImyTkUzLWcPSKIjumg=;
 b=q61XYgeX+1RgL5u6jU1OHP+aLAtaoQV2V0WiWVsfe3VavVCd7ujFHe+1morvTX/RQPz2O0qq9c5hCu54hpEXjrdF0hLbiVv1MnXiH2apP6NLf7wcDQenJw3DwwpcnhTpmdblr9nNLDeSnvbTjgFePOjoVO7tdpVUZ+o9mKLd9Q31dOTYo6LO2T02b0dHCuvMxbmC2RrF78SSnyP4A3FaT2hmwdEvdg2kzbozkSMEfMsSmJE37kKh85dtU3WE31lPtPCY/7bTthXJgK2uCYLOp7nDqlMwScDcdzPlOUTTXKKsGfeBgAcHGdVIOsUt8Aoa0voBMaUTEekgHAMfpIi/fQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21)
 by MW4PR12MB7382.namprd12.prod.outlook.com (2603:10b6:303:222::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:48:59 +0000
Received: from DS0PR12MB7558.namprd12.prod.outlook.com
 ([fe80::96ea:b67a:4a5b:85e0]) by DS0PR12MB7558.namprd12.prod.outlook.com
 ([fe80::96ea:b67a:4a5b:85e0%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 15:48:59 +0000
Message-ID: <c49bf35e-72ce-470f-8c4f-553f719f98fa@nvidia.com>
Date: Thu, 15 Oct 2026 18:48:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] virtio-blk: Add inline encryption support
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-comment <virtio-comment@lists.linux.dev>
Cc: Parav Pandit <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "neeraj.soni@oss.qualcomm.com" <neeraj.soni@oss.qualcomm.com>
References: <20261008060644-mutt-send-email-mst@kernel.org>
 <d503aee0-9920-4c0b-b9a0-c08e505cc3ea@nvidia.com>
 <426abc9a-c7b4-4631-a5fe-3b2bba1d0414@oss.qualcomm.com>
 <SJ0PR12MB68060279EA2241FAEB2EDE8CDC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014032222-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E08103C7BC39C61EADF9DC9D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261014035225-mutt-send-email-mst@kernel.org>
 <13419c56-ef94-4dfd-ba44-a3dffe5f73f2@nvidia.com>
 <20261014044718-mutt-send-email-mst@kernel.org>
 <cdccdfc7-35aa-43da-86cf-1720794ee69a@nvidia.com>
 <20261014052937-mutt-send-email-mst@kernel.org>
 <1465a9e5-1a6b-4a88-8e78-9167a821a3d4@oss.qualcomm.com>
Content-Language: en-US
From: Max Gurtovoy <mgurtovoy@nvidia.com>
In-Reply-To: <1465a9e5-1a6b-4a88-8e78-9167a821a3d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7558:EE_|MW4PR12MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 586fca92-51f5-49df-6b11-08df2ad3d3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|3023799007|18002099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fuJkP5+5pmt/av/87rfN2TlO3OFMSH8dTAR2f6GIXs3sbdo1N8wa1FRhrryvYZTWOe/2iGOSXgYEbKPTOnieQNWWh3e5Ohmnp6CDJXsV06Sux1dVLF5m9nqMqU3hBMgDIVTFFDkOBLZJyok6czogcczhqiXO1hQ5PIhh4dQrT8fyDA+bEOa9qzms3eYGBhCPTRtb5WFCf4xPY4ivcXXQ+aK1s1VxdoFy4ejVBEwd+arDherSUPkK6YN2JQJupLGqPSjK6ItPvM6328b39B5cZeA2WN3X/POMvVV/vRzcS/vMdkPh/PHbQQib8os+qL6OavP4hosllqSBZQZGGG+9g4N2cz80IteqSb4JrSTYgndQz2ks+sy5GekGB/DPkffyGyImk3WTxTanNfz9JXbRzF3hyIyydrh4+lL6/ptAKGooG/Y7dw9XEdmzfvBq53V6m6T9rZSvIkEfKpALAoO6c5AsHF6uSInUh5kVWp1eTe+nTEmTYiAebL4cnV4PIks0BTm6B4/ITWyVvrqVnTBfKoL44ipGNKXCnLX8XfdKsy4+9YRranHBqtkSs0ZTjvtQ5XePE+LoCvHz/qtGt1wA0sg3p6liORuv4/pjhuncYAnoK/jNQgJm7+AO1YQMhD4sj8LN73UUq2m3FnkZwVwWriTIEJgvywBvgpXEbtUmaXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7558.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(3023799007)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wkkwazk0MDg4VzVuUDlpb0xKc0RxWllHdkxUb004NzlSVEdMSTQ3MlQ4UnVz?=
 =?utf-8?B?S0dBd0tJeVVFUEtqMWRrOEVNYmdSN3JDbTNZanJNSmtkLyt5NkRDVTFNY3dU?=
 =?utf-8?B?R1RaUWJROTZQYlYvTmg4UUN3ajJiY3dyalF2K0hyNXlUWUFVM1E2bCtDc0FI?=
 =?utf-8?B?TDNTc3hUcTErU1hEZDZyM0tBVlNOTmIrR2tIRkErc1NjRWxTNGJXZ2VPTkpV?=
 =?utf-8?B?Y05CbjN4dll4SmxGZlRLWE93QkNKMG8zWGFJczN6YmVQaTJwR1lMMUxBM0VF?=
 =?utf-8?B?c1RhMFQxd1BaRjkyZXdCSy95dkp0K0RmcUdSbCs1bEk5QzRkRGpoeUs3cDRt?=
 =?utf-8?B?Z2FHZDFvRnNuSndWYVZQNVRoTHlCakhxSWtCS0sxaHEzTE1Uak9UYm84cnV4?=
 =?utf-8?B?TFNhTFlPR2VOMUtob1RVR2FCYjZ6LzlwQms3Q0J6TkFpaVdKZExPQlNYK3hu?=
 =?utf-8?B?cGJOZGU1T2YrT3ZsMEs3ZWhwaDZrTWJMTVNYU0VuaVg0cHRvQWMxbkJnUzRl?=
 =?utf-8?B?WUk1cHlQdHhobWNkakhZbDRWMTNPL2Zlam9EY05VbytUK0VSWHhXOE1ObExt?=
 =?utf-8?B?ajQvaW9pcVVTTnRuWjhNNExpQVI1eVlJMFFvVHVOQkVCZjUyeFArM29jVVlm?=
 =?utf-8?B?R3YyOHROeXBWRE00UWIrZWZkVlNOZjI4aWtFUEVqVGdBSk1GSlVjb2JhRFNs?=
 =?utf-8?B?eU0yRVZ0V2MwUm1OK1NaclFtcklmS3ZwbHVWUU8vcFBRZ1l2WERvWnNndHdU?=
 =?utf-8?B?VUZPSWkzc2o2VEJRSXh4cUs2azNtK2ErdjJpWUM4QlNlc1p3YUNSKyt6RVNB?=
 =?utf-8?B?TnozV0ZrcFFEUzBSaFBIalVJN2FNOHlVRk1YL0hsNXUvT3Y4YUY3ZWplNTdD?=
 =?utf-8?B?bGZqdXlxQ0ZwL29sZklpcmNCWWsyb2VuRm52Y1ZlVEt2OHJ6aVZwUlFSMS9W?=
 =?utf-8?B?V3hFZUp4eUN0QUZqMzRjNlV6Tkt3RWpNajE1R0I1SnhtVTh0UlhRdDFxNWZ2?=
 =?utf-8?B?MGZYVlQ2STlsaXM0N3U4VzYxdGM1c1hOUVI0dFlZVXpNeWpXbHhpTE5vSS9h?=
 =?utf-8?B?ejJZa0tEQTYyaDFndUhSRGNFZGVCOFFwbHpHUHR3cHljdzZlbzhVRm5aTjRE?=
 =?utf-8?B?VGJqNm9razJOa2g4VVpUTUNYUzMrb2tCZkMyeHBFdHovNHRkSTJDRU10cmd1?=
 =?utf-8?B?YXg5enE5OCtnNElZVlVsWDd6aExzd1lLNi9jRklZQUVFNWhWVjFqejAvcVdX?=
 =?utf-8?B?eVUyTVZwRlIrOGI3ZE5SUUMyTkR3TjFqVnZ5a29VeXBrYjczTDFRN1A1NERP?=
 =?utf-8?B?VTNHcjlhUjMvSTZ0U3NaNmdDOE05YmdmVWNrUjFUbkVoOHRBWXNoTGI0REto?=
 =?utf-8?B?SVlVOUVwbkUrNkJSRUhzYVBBb2IxTkdWdURXUno0NktKWXhmMTN1U0dBSldx?=
 =?utf-8?B?cHA3UytDSGZXaUJtallaeW1FbXVOT1ZVR1RlS29uVUx1bjcrUHZYT2VJazBJ?=
 =?utf-8?B?WFJpMDdsVC9HQndGUXBMZmRyd3hiMnN6YzF5N2VlQ0JLc3Y2d0hWVjFsZTR1?=
 =?utf-8?B?c0QraFErYk9iMk5UZTFtR1l0YnQ3c1lQekR4WWE0UkNmZ1UvMndNMG0yajI0?=
 =?utf-8?B?eWdTekwvZ3lJeHBtRmQyUjZacDFSN2E5dnR6K0JmS01jZmJPbjRsQ203a3Fv?=
 =?utf-8?B?ZXY4ZGdoRXIzdkxJbXplUFJabVhreXdDMUNBUmwyV1lsQUpvRjJac3lvNXlp?=
 =?utf-8?B?emFCWUxxdGtra0lnNlk0ckl6M3B2TXVOLzRBcWJZUmtBcFVYYmFacDVhSHFZ?=
 =?utf-8?B?NVd2cnpUbEVaTTBaWDh2cFMwbUl1OWxENTVrZlVSbVdIUmhlaXFrcVZUMlN5?=
 =?utf-8?B?NlVtcEdEQ1VzVnpueGovc0Q1Qm9ybUw4ME5HMWxMRnlsT0pFSlpZVTVvWHA5?=
 =?utf-8?B?OGUxcmZCMWtDcXhHMmJTRVUzRUhBNkkyQ0EyMUpnczZOOTNjWFdZTDd4UUZO?=
 =?utf-8?B?RjkxdzdSR2l0ZGtJWTRKTzVyejlmNHZ2Y2pWcS93SjlueXBnbEVOeWorcUVW?=
 =?utf-8?B?ZkRPSHZBOVd4YjA2dFZxUUVWbGtvL0JQTzFhd2l6S3Z4NEgvTnBXMHdsb1Zs?=
 =?utf-8?B?cUpUZVlhNDlOSXEyTzc4dm5weWVZR1ZDZWFwN2c3SFJkeG5iMXRKQTQwUGRB?=
 =?utf-8?B?NUd5QTJxY1JCRVdydDNpbnJFRGQrUE9GU2JNR2daUXRJdG1FU3ZrU0xpc2Zx?=
 =?utf-8?B?VkdrcmJtRVdCVmxtYUduRDhlZEJONE5tbjVDSmszbEh2NkIwblBsQ2hMWklZ?=
 =?utf-8?B?NlVxTk5sTjZubWVnWmloTEhibnBXeXZOeExsRzFsdElSRHQwdVFtdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586fca92-51f5-49df-6b11-08df2ad3d3b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7558.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:58.9799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blEff5JDCbe9blUkFvlkbx+lwB9RgV7mCg+XmMvdK58FBgynVmr0Sd42FM3bjt3zl7XlV4SjCCeM/nVt6iWpVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7382


On 15/10/2026 16:42, Linlin Zhang wrote:
> + virtio-comment for real. (missed in previous email).
>
> On 10/14/2026 5:41 PM, Michael S. Tsirkin wrote:
>> On Wed, Oct 14, 2026 at 12:00:35PM +0300, Max Gurtovoy wrote:
>>> I think we agree the two activities are orthogonal and should be developed
>>> independently.
>> I agree to nothing of the kind. Device and transport features should
>> be orthogonal. If a contributor does that, it's fine by me.
>>
>> Different requests in different VQs is a pretty standard thing -
>> in fact, if anything, multiple queues accepting same kind of request
>> is a special case.
>>
>> So sorry, just adding another VQ will not burden the spec irreparably
>> into maintaining this mostrous overhead.
> Thanks for your comments!
>
> The keyslot management operations carried over the dedicated control VQ
> follow a model similar to what is already implemented for inline encryption
> in the Linux UFS and eMMC drivers.

In addition please follow similar SPECs implementation for TCG Storage 
protocol payload.

You can easily collapse the proposed commands into 2 new 
payload-internal operations of SECURITY_OUT/_IN on top of the AQ.

This buys you real interop with TCG tooling.


>
> Therefore, I believe the additional specification and maintenance burden of
> introducing this dedicated control VQ should be limited.
>
>> Using AQ would save us adding a VQ *if it was there*, why not. It's not
>> there and no one seems interested in making sure it is.
>>
>>> Who ends up doing the work matters less, IMO, than making sure both get done
>>> right.
>> Whoever does the work sets the direction in which he/she takes it.
>> In other words actually doing the work as opposed to talking the talk
>> matters.
>>
> Thanks everyone for all the comments and discussion!
>
> I understand that there are still different opinions on using the Admin VQ
> versus a dedicated control VQ.
>
> For the use case I'm working on, the feature needs to work with virtio-mmio
> as well as virtio-pci. Since Admin VQ is currently not available with virtio-mmio,
> I still believe a dedicated virtio-blk control VQ is the more practical approach
> for this feature.

See my email about adding AQ to mmio. It shouldn't be a problem adding 
it. I would explore this more.

Having a wrong spec and introducing new VQs will make it complicated for 
HW implementation and will not be usable.

> To move the discussion and implementation forward, would it be acceptable for
> me to continue with the dedicated control VQ approach in the next revision?
