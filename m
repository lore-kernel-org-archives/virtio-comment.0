Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BC83CC1
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521261; cv=fail; b=FbWJvbf3qchBH/EGLIWozk/Zke2K486vGi+08JcVvoVroxJ0J0GKbAaEjzCM7RRQ8WNtjcOVA9kYUrcdYYMbnYWBWQC8BT/Gv63db0D+xkeKydHihJuD9h6kJR0LYssXtlbQnMMbJ8VJS6GnWYdNIllIHexinTAaKVGjcn8xS1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521261; c=relaxed/simple;
	bh=AnptFBo5/JCdFjBk0wcTFrz1pfs6DBOFbU29N3btZhQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EFfdXVaYyqeOw7pJhTc7mQAocV5WmWgxxGetgHujlKC4nnkVmr4nH+QMx2AifUTJ+qEUtXkUrPup+LNK+5oxGtmQdtYZqgNtncNW7LwiKTIcxaontdTYeKJ9D4591p2Iefd71ZiZV5BC7fX2Cp+hl5KRqEppB6eejf4PRM8MHPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mIDsZs12; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mIDsZs12"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFkGdaMVkwwkBckH/b+kSGzIXfNuDhM8CvXFjVToyUkMOXzYgmvfk43jiPpFwNbeyCmUvWzATc0ICChGSXcKVIX3BYvAswqBacSVgTvXLPrxhQcGOtlrYhqO116eVlEHX8vfqqbh5zg/dQyEryKHadXDBn4xz4Xa5vS/6bKwhAGl69XFW3+m+9BAU+/sAjGhZa2zzCEHcV/cmjGEx03KQKA4HdaxI1kBPP6qaEeXjUeiKtuzMAideY0aMtKTTxMs5DpP4nIMpaeCo9HLcVLaujEAkWdJUjDF7lOLPLGcw2W+nzYK5ymyHCytuFfakogmoFRtDFZ5qmPZtyVfENTmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnptFBo5/JCdFjBk0wcTFrz1pfs6DBOFbU29N3btZhQ=;
 b=aqg45KJdZpJ1CZ0V9XQY52kzaIiChOXFpZGbiWnRq1WvQ5TrzSO5jtCCe/h+xCQxDvp8cjntdT003pz7+ctS5GhLtsNZlFBdXAxlYXkLQLtxooHZO4xWq8mEAtye3n1dpkNGRwJoJ348eHOK9E539+TARcNhYx+x75WiS5ikEq+K2Jg26wplGJThBzTtQHg17s+YZR8s2X38z6sKDu+MGBsENRNDVU9gQhuljvUsZfe+GkP+yB/fmEmLGC0fWOs2KYOKvdgVApVbr8DAI0xF1n4zpOLlCWTgiyTyOB/NnZbLPTgA7PG6kB7+ez1ZrR3jSUailgoE3GRtVeDU5OB0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnptFBo5/JCdFjBk0wcTFrz1pfs6DBOFbU29N3btZhQ=;
 b=mIDsZs1222/6lnu2HR+fhgsvVjvrLQGDiYTceysRMKLJnJdpQUQXzFsW8xc3rsn3tnt4s12mzEOq8TvcJ7AumZB65D3kelLdDAroc2GfidtzBJ1qwsZprgpXqFZIB63xP9Jy0w5K3q8N8MDk/l5IJ7xdq6EeHssYO2RP03RvcKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 07:27:35 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:27:35 +0000
Message-ID: <67a32abf-daaa-4afc-9a74-3ea6b1e827a4@amd.com>
Date: Thu, 5 Sep 2024 15:27:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
 <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
 <20240903053418-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240903053418-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bf9bb3-2b4b-4ea5-6cb9-08dccd7c3682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGtLNFlPSFZDMjVFbUYxZ3Z1STFGS2VXKzJMOG01SDdzb3FmNXUvYWJDSkZI?=
 =?utf-8?B?Y1pPK0NXSmhpM1lZWEtIN3Q3RlBSTWJhSDV1ZEpPZVc2QnhZUmpqT3k1OThC?=
 =?utf-8?B?ZjdXQ3ltQWZJVHJVTXZCRjdTT1NXZTJpc2tDLzNZNlVLcGYwZm05QVh6ZDU4?=
 =?utf-8?B?UEZLQkhYWDBCV1hMS1RyS0VyT2ZYN0VCVUlHTnFPU250Q3ozYzVJT0Vwaksz?=
 =?utf-8?B?RVlnejQrQ3RNS0NqUStQSkhKd3VYNjVkSG5EdW1sRm1VSHRjRC91OUhRSlNS?=
 =?utf-8?B?MktWd2hnUGRYb3hrMW1Md1hKK0FtWVU1TnZvdVFHRFdLYjN4Z084OHRXWjJ0?=
 =?utf-8?B?Y0xaekR5RXV4MVJhZVhlWW1Fcnh3aVk3SzY3eTQvUWNZaTNEdG9TQnBiU1hG?=
 =?utf-8?B?OVBUdVl5TUhWK0NCUlBVVGFMTW5sR1hWNGNUc2tWSXBpOG5kRGRkcHFQSkVP?=
 =?utf-8?B?N2ZmcTB3NnR6QjV4d2cxRlBKTStYTExndUlVOC9ZN3JiZk5TYjNRSXZZb2xx?=
 =?utf-8?B?OGRtKzJjTDBGT0FtK0daaXIyNjhySzlRazNEZzZSaDhFV0dyVndwZURIclF0?=
 =?utf-8?B?NlQyck55ck95SXQvYmp0TDd5L0ZXV3FPSTFWWW9JWEg4ZkxUN3B2L3YrNVNa?=
 =?utf-8?B?eWt3d0RGODN3Y3VBZE15SUM4Z0twVklGTzgxQVpTUWVuQndhMm05QVBUdkNX?=
 =?utf-8?B?cEVpUXovdmhCdUJ4ZDBwMnRUTDArSHRUbU5QbW51TWhrS3dPSUk1c3NXZ1Q4?=
 =?utf-8?B?Nno1UXNTOUxlbzNSSlZ0UUlodzNDRVB6QytrTkNjSHpSb0k2clM4VWhkVXo5?=
 =?utf-8?B?Q3pTMG9LSkZCOElQNGwzNHJ1WE9PN0tpaVRvVm8wN3ZpWm5jenJzUkVvQTgv?=
 =?utf-8?B?aGcrb1FRK3JGUXVmYmpCbDc2b1hVbHNCbDNLZ2l3TWs4ZnlWSmVobGx2WkJu?=
 =?utf-8?B?QXc1UDJvM2ppeVlpbmZmMVEzUjkvcGNBWU1tZ3cvemNQcEpVQ0pSZm1xVTN1?=
 =?utf-8?B?S2xKcnFOWXJCUDFoTWVqY2VOU1ZlVFd4aW1tZk40cm5KakdrOExlbjJ6V1l3?=
 =?utf-8?B?MXRqTU50eSt1N0tXd3VVV1k4bmV2YlE5NURKYVd1Qmc3UUY1RTR4V0oxeWhv?=
 =?utf-8?B?YTVTbVpxdVROMHBkaThoVVAxYjR0UE1TRHhac2lUVVhXSzhtbW0wZTZIUnpv?=
 =?utf-8?B?ckV4TS8wZDZ4dlJaTFVhc29qbloydm1JNk95VFptNVhyRlc3ZndGZHpHaDNm?=
 =?utf-8?B?OU9FaVZCd0FtblJxcHViYTF3ZVZ4TnhEcG90MDRmYmxrWmY5ZnhQcTJwWm9F?=
 =?utf-8?B?MUNralcwNDBwRUh0cDlVMzg1UlQ3cVMxcGRPUTlwRDFqQ25EcFN4MlhleDNQ?=
 =?utf-8?B?ZG5NdGxxbmNQTXFZdnFzSzhpV1dTdHlsSFFtZzBuLy84eWZsak55Z09JQTRF?=
 =?utf-8?B?TzNjVFZPWXJ1RXFaazJYLysvYVpqbnN4ZWc0N2VTQ2M3L0YyT2Zib1VEdytx?=
 =?utf-8?B?dm4zdUVNeE9PemxwWlBHbGdEYVFjR0lIcmxEQTRzWHk0bnMzUGY5MThSMUMw?=
 =?utf-8?B?YkVCRkoyOGFZd3hhV3JacUZNUDlXOGNjV0tVTDUxMnZMN1RGV3J3dXVBY3JJ?=
 =?utf-8?B?aGIwVndzSmZ1QmphQmZSTkNiVFNiN1ArYUpEYkNQbG11cjU1QmxKMGNLZlR4?=
 =?utf-8?B?bjhVTWlYK3VGaXk2MUNGZGhYcHVLUXhpTUFHQVgxeFpYSTd3NWtQcEN1c3NW?=
 =?utf-8?B?V0FPazBtR09PcXBxOWtPTXVBbWpPTWJQOHpINVZFcmc2cHZsVEE0dGptZXdN?=
 =?utf-8?B?V05oZDc5NG5STUNuNVNQdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFRoMTlkVTNOQlJoZzY3VGc5MGhDdkV1K3l0NDVoWjhnR05KTndVOWd4SkZK?=
 =?utf-8?B?YXhadGZHaGVNOER1ZHRRRU40YW9qK25FWkI2UjI3VG5LQklCaVRLUjlna21K?=
 =?utf-8?B?aDk1QUQwYW5ac051T0FMK2VDd3NNTzJGQlVSNm5MZFh5RTQ0d0w1MFVyTFFX?=
 =?utf-8?B?OWxOTE9WS3hQNk5lVWpmOHJzNEJoSHJPRG1mQ1BZaG12OGd5VzRaUEdwTThD?=
 =?utf-8?B?V3FHaC9sSDFLaXlEQ0RYb3ZBM0FKMS9sU2QrUzRWYW5rWlBBLzdmQXRsUURs?=
 =?utf-8?B?VSsyYXdzVUltYjRzVXNRbzJCVi9ydUl3T1FLeG1pSWJSdE1VTmVISW1odUlp?=
 =?utf-8?B?cFV3TnBld25GMUx1SlNsQUlmZUFFenJWZGZtQ3k0UjVmZVd3UTZSMnhZeTh0?=
 =?utf-8?B?NjlKbU5lbjByaDArWTZsWWFGeFVXUUpHZHhYUERKeW11WFllSHcxYmwyWXFo?=
 =?utf-8?B?K3VSVlZseE11MzRNYVdUdEZ6b1hGbnRvYlRabEVycmZIWFcyVUtHOFllMmxj?=
 =?utf-8?B?N0gra04rNjZPcFZhY3hNTjBIMXdhMWNWS0dCa2ZwY2Z4d0tiS01pYXRSMzRz?=
 =?utf-8?B?QXJGb0RxS09qS2tEU01laFk4UEV5UXVnSzdZZUE2bzlQbFkwYnFiQVpBeXVi?=
 =?utf-8?B?a1B5ZzJVZnJNRXBWelZtSVVGaWVLZVBWekRIelNzK3d1dlhTREo5YlhLZjhZ?=
 =?utf-8?B?NEMrcVhXd2h0blNOQ2pGYWducVFleWZjVXpyRWNIOEVuQ1pkajdjT3JHZVox?=
 =?utf-8?B?dVlvblBRUEVzOEZKQlVDc3p5ZGJyQ2V2ekhValBOQTU3ZWpMb21aSm5EWnI5?=
 =?utf-8?B?Z25GM21UYkpDWXE5WHMrNlZHd0FwM0hkTU54YlNrTDhJcDBLUGJBaFNrRXhi?=
 =?utf-8?B?NUF3UkNacWF1d25LdVNlWGk0RnZZSkxUNTdnR0V0QXk0S3NuNlR6UjZVUElY?=
 =?utf-8?B?MGNhVTBWQmtEaTduM24zcUZMSUhVUHpyR3FySVBEMGJhdHhMVUx4dGxtblA4?=
 =?utf-8?B?V2QwZ2Ewb3VWOEtLcjk3VnFQemZEbG1VOUpTVHdoRlFEbVBXNklCeVZDTW9V?=
 =?utf-8?B?V0xlN0lndzN1azlqa1RqMWRDUlBrVzVSMTc4ejBYemFITEJURzdwNmF4Q2c4?=
 =?utf-8?B?SUE1elBYd25BSWs5SXBPVzdJRW1JcnZONEl3ZUJ5ZlYxRFlJU2RhSEhvOVY4?=
 =?utf-8?B?WnRuNy93S1B0R1lMcURTTkplS1VyQmRCdmdWZWZOR3F4aklrSThNcGVWZklE?=
 =?utf-8?B?a1prRWpRSVU5MFBuNE9rWmt0MFBrY2tGOFljWjRWeG9wMjE0aDROSU5vN0xJ?=
 =?utf-8?B?Z3A2ZktEOGVncHMzbHl3d2ZuNS9qYmZPanZjdmM2ckprNzdKcXFneUcxQVc3?=
 =?utf-8?B?TXk5dTlIRkF6c0twMndYY1AwVjRFYXpmSWhtYXJIY2xSVmxzaE5tOUd4VzVo?=
 =?utf-8?B?bGRBZW1GWHJHK2UrMGphVXk4OTRkZytxK256VzBROVlEaVVVeU4vM1ArSjJR?=
 =?utf-8?B?T3JxaWlzdFBqMTEzcjZWV201VzlLUDI5QTMzWGUweURXL3p1cjR2c0FKeG9H?=
 =?utf-8?B?K2ZuaGR6MmxCTkduQlM5TFkxdXRtRitqOTlhWE43RE53UWU2WU1SWElleUVi?=
 =?utf-8?B?Rm5lQU1GWmFwOUVjZnVtZ25TalhBTVBvRmhhenk4d2RsRzBoTGM2MlV5dThO?=
 =?utf-8?B?VGZxdWdmajVHQWU1QkxpZ2lqTS9sV0I0MjQwbEhaSnpyOUt1MXh4Y042bmxW?=
 =?utf-8?B?OVVRcjVram1veW9KZHZPWXd4MnBOOHBUeGt2NmdTT0tuK0QyVlJVQ1VKaFRM?=
 =?utf-8?B?NTlTbFUxanE2NFVIVFVXdjk3SVRjcE9rejExd2F4c09QS1VnVVRhWXhMNGxL?=
 =?utf-8?B?M2xkUFB0Y1lvdnNkUnczanp2UWJYK2pYcnJ0czMxemtzaTZxTFhPem5nQ05s?=
 =?utf-8?B?cWF1aERLTlFkc3ZhaGxqa3dha045VWRoQzRKZGNEVThFQVhwcjllMThkVDM4?=
 =?utf-8?B?blNLSHdVcFovYTMxODdxSi85ZlVLbWdlcWF5cFQ1RVlTTWJFMWZkdm5RRFdm?=
 =?utf-8?B?VCsyRVlxTXJlalI4bDcrQ1IzK1NkVFVXMzVYWFlzNDNCdWJRVTlPSk9ydlR2?=
 =?utf-8?Q?F/nL8jzBcpuqi+Swb/FF1z8SY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bf9bb3-2b4b-4ea5-6cb9-08dccd7c3682
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:27:35.6544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGOtwa1Li6cZV+ZefC7aixHAILWj+8C7i0XCgRREvCr3fOchlM0rdSDMvLiY3sHClJ7a0Q4mU+DM7+qtU+RYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861



On 9/3/2024 5:36 PM, Michael S. Tsirkin wrote:
> On Tue, Sep 03, 2024 at 04:51:18PM +0800, Zhu Lingshan wrote:
>>
>> On 8/30/2024 11:10 AM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Friday, August 30, 2024 8:07 AM
>>>>
>>>>
>>>> On 8/15/2024 11:07 PM, Michael S. Tsirkin wrote:
>>>>> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: Thursday, August 15, 2024 4:23 PM
>>>>>>>
>>>>>>> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
>>>>>>>> That means, PCI HW needs to return suspend=0, until the device is
>>>>>>>> not
>>>>>>> suspended.
>>>>>>>> In this example, the device cannot build special circuitry to
>>>>>>>> answer
>>>>>>> suspend=true within 50nsec, or in other words building special
>>>>>>> circuitry to return suspend=false is too complex for the slow operation.
>>>>>>>> If this understanding of burden is clear,
>>>>>>>>
>>>>>>>> The proposal is, can you please extend the interface such that,
>>>>>>>>
>>>>>>>> 1. driver writes suspend command.
>>>>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
>>>>>>>> This is
>>>>>>> the default value.
>>>>>>>> 3. When the device completes suspend, it changes the polarity of
>>>>>>> suspend_status=true.
>>>>>>>> This has two main benefits:
>>>>>>>> [A] This will enable software-based devices to write data to slow
>>>>>>>> files and
>>>>>>> does not have to force VM_EXITs.
>>>>>>>> [B] It also enables hw based devices to not build special circuitry
>>>>>>>> to answer
>>>>>>> within 50nsec, which can get very complicated for tens or hundreds
>>>>>>> of PCI PFs.
>>>>>>>
>>>>>>> I read this several times, and I don't understand what is proposed.
>>>>>>> A special register for suspend/resume? Is this the difference?
>>>>>>>
>>>>>> Yes, a command register for suspend/resume operation.
>>>>>> And device_status new bit that Lingshan defined returns the status of this
>>>> operation.
>>>>> Ugh, it's all quite messy IMHO.
>>>>> We have 4 states:
>>>>> - operational (resumed)
>>>>> - suspend in progress
>>>>> - suspended
>>>>> - resume in progress
>>>>>
>>>>> What I'd do then is a two bit register.
>>>>> To suspend:
>>>>> - write suspend in progress
>>>>> - re-read, waiting until suspended
>>>>> To resume
>>>>> - write resume in progress
>>>>> - re-read, waiting until operational (resumed)
>>>>>
>>>>> How does this sound?
>>>> This can work for sure. but is it a must?
>>>> I mean, the driver has its own knowledge of how it operate the device.
>>>> When device presents SUSPEND == 0, It know whether the device is in
>>>> normal operational state or in the progress of SUSPENDING.
>>>>
>>>> But if you think we should add a new register which applying for all
>>>> device_status transitions, NOT only for SUSPEND. we can surely do that.
>>>>
>>>> Thanks
>>> New register beyond suspend+resume can be useful too.
>>> For sure it will simplify the suspend + resume flow.
>> There should be no difference in how the driver handles SUSPEND
>> and other device status like RESET.
>>
>> If we want to add a new register, then it is not only for SUSPEND,
>> but for all status transitions. 
>> We need Michael to confirm we should implement this new register
>> that apply to all device_status transitions for common interests.
>>
>> Thanks
> There is a difference between SUSPEND and RESET.
> RESET is not a state. Thus a single bit is enough to
> signal "reset in progress".
>
> I don't really see any other transitions that can take
> a long time. We can start with just suspend, and
> extend it later if appropriate.
Yes, that is what I mean, the register should not only work for SUSPEND.
To be more specific, the definition should be:

// The device_status is still in a status transition
#define DEVICE_STATUS_TRANSITION_IN_PROGRESS     0
// device status transition is done
#define DEVICE_STATUS_TRANSITION_DONE                     1

They should not be defined as:
#define DEVICE_STATUS_SUSPEND_IN_PROGRESS     0

Thanks

>
>
>

