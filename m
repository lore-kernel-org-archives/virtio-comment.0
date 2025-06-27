Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47042F1FE1
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 01:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750988775; cv=fail; b=foorg8zdqgA9QHJXL7TkNhyfJAN6TUypQXFGSPYSftlUcmQuJteyI6tCkyvV4wojZ32x+eDn4Wwv1MK/RVDJeoezxQ9aCxu9nViny2ZcVRaaizTt1RbqInFB0wA5vjUCXyHQWjsOEr5/f1qESTZ2MXBcnqP2HPILQtoRqDntqcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750988775; c=relaxed/simple;
	bh=DwuHQszpIo72BhtmY7bRo96Qu0uEtcQMjguABBphu9Y=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=R9TnfydTK8DN3Cbc72jQzp17mspe9yWQTdbIOF3d7yFG4gNkS7bpm4cxbGP7cuneiGGX20E/eqwqYHCHFtqGnGUv6iJ/32gq9Igc3Dkq3bGPDVrbrgaL8nXR8O33qQuBPkjUKVBOsOQtr0avlCyfGWBUeRvXTsHJckF1dG8kL70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KOnxBMT1; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KOnxBMT1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri9dh9srGPH9w7kmPIoXurbusDTZSENKzvueMvilijFKnkGxaqEmajX/kB070SevXiyK+dnkt6U+B6la7Wng4Gnl5v9YsfYq5zXx4p82nNTUiM1/QF8okjlfKGBU//l2hAPx7QekXRi3hlqeldIEqfdDJgfNnGJZbrMrUkPN3Ow29JWykPswt6P7piATKmdHDd4HZXJO72FPPTzPQL8Lod7AsHKarnQK8cNF+pjGxsmnkG4x3ulLXYcpWfl5pUBT7Z1FDF+Q2pjDeJ05UEZjynsWW2hs0ADdD7XtndH6xDjMq3JipHMfxHFcIlDMyilMqmsV7+Ij4HJTZyDni9aabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/sOBCjhSJtZgOHEROGideOWJh/cVentXEGCfbyic2w=;
 b=Cs35FBAmsakmGv86qfoU/BkZsXAB0n5Eo3Wk8FbwyKffXJmotocjBFn7STppRpDW3Be5C3MkRJvBgVwq5hX0Zb8c1wNjVlGjM/0y6jqOhu022Wn5mzAva9vdmU5CUpDbx3GKBMenccNJ5GV1SVP63hKOQxZdS56/BEYYc/9sdhWK7p0c/6A1qxWSSklTXcs2dD5Vx4i8cIgmPd1ky9JR1No/+xfZCJ494STtnNyfaeBfKs0R6YVSO/m8g2Y5DDXPovsTxe84NVvHtxypZjlMxWp1qfavbOspWMPKuyaBWYHQ2mnDDsvCDeFDxGf0Eb1xACNC9R9yVhKCI1nHhrL0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/sOBCjhSJtZgOHEROGideOWJh/cVentXEGCfbyic2w=;
 b=KOnxBMT1f+OL3bgmAUdSA6xf9OAjHCzZoDx4TRB+X9WpxySpmHoXRVU8Bvix6zvdm51g5vk9ibp0wxGeheGhDhNyh51YPcn9UBiMhV/kKKWoLjCCHDUY9PTX9/DxZzYNEVTL47nY3ghcOLUeG/mw7PiENDQK8OfHn2FQuNwaQXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 01:46:11 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 01:46:11 +0000
Content-Type: multipart/alternative;
 boundary="------------QfK8CjuO495vvoHkD5Xh67Xl"
Message-ID: <e0115f0c-951f-4a76-8795-d34b6f088467@amd.com>
Date: Fri, 27 Jun 2025 09:46:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
To: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com> <87pleqh5l3.fsf@redhat.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <87pleqh5l3.fsf@redhat.com>
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 935ffcfd-62e8-4948-6b4a-08ddb51c64a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEZPRnZlZEkzME94TnBQR1psS2VRdXM1Vm8yYXk1R3gvNkhaVkRSNWwzUm0v?=
 =?utf-8?B?RmptUDRVM3cwVXNkMnBSamxWaU0rZWVqUmtNdlJRUUZWV2psNTQ1c01ORW0r?=
 =?utf-8?B?bEhvdXdWTmVyZmc4ckRPS2RiTEpJY2dyVk9IWkU3ZWZ1dWlMTlAwNk4xUmE1?=
 =?utf-8?B?RE0ya2ViRnplWm9KM010SzZWRHByUEdIM2dEM3YrVTQ1TC8zdmRzVmorcnhE?=
 =?utf-8?B?MHhIMWRYcGI1SUdYMGV2RmxmRENwSzFxWWJmaVF4QjRWSTVIS25xUThpTzdx?=
 =?utf-8?B?ZHhGWmVBVFA0Zk5kbDFoNkFhT20rUHNQRDB3NGRENjlOS0FsNWpWMkFGSGpK?=
 =?utf-8?B?bkQ4Y1hPei9BTFhWcHJUTHFqNHo4Sy9ubzFKSTFZYk8xbE1WamVyZmo1cS9L?=
 =?utf-8?B?SG0vSklBL3dXcUtwOVVHNzUvYXhkcUZ6NFFrRHZxOFhMbXl4Q2RtelAvTmc4?=
 =?utf-8?B?SURFQ1p3cFJmU0ROZ21TVHF1UVI0cGY4SmF6cG5qZkFULzE4c2VKVWgzNUR3?=
 =?utf-8?B?R1JqZkRtL3FSVUc1UkhvZldTSE9CWDdkLzVqdEhuM2M1aHV2TkxBT0JZdUZn?=
 =?utf-8?B?a2JmRWlLRFJRSHJVcWgzRUtsZmZJcU44VFM0Ni81U0RPcG54V0NROGlDZmEx?=
 =?utf-8?B?UEVBQldqeTMvYmpiTUJUeTJvOFBITktsLzdBMnYxbmF5alcwZnltanMydHZY?=
 =?utf-8?B?TEZ2aFFMNHJkN1JML0xONEZXMHJiMGNBRjYvbFRHb1lTWlNDQ1JvSzFPazk1?=
 =?utf-8?B?eXgrRXkwc2w4UzYrK0ZTalVOWENWMzNBVkVVTW1VYjkxL3RZcEVLY0xFT3FD?=
 =?utf-8?B?Z296amRjR0YveGpISk9MMzNVRE9TR0cxcmptQkM4WGJzWS9CaGFnUU5tS0x6?=
 =?utf-8?B?emlRU3FhNnV0QVMzMWpRV0ZvekJqeWdBMUl0QlR5YmlPV2Y4eml1Y2krc21W?=
 =?utf-8?B?M2dmV3dwRWlTYk04TkpxR1ZITGZOajJnZmRubFJQakFON3hJNm1MbDAxVU4v?=
 =?utf-8?B?R0NEeFBTNHZYQmpuVmc4Z0Fqd2hoNXNPRGtHVWZMOWNqNHM3R1Q3amZ3cEU4?=
 =?utf-8?B?UGpjTkFBcTNwV1d0eVVNQWhNbHA4azRpVkROV1A1WjBUbzh2WXpMQ0ZJK01U?=
 =?utf-8?B?L0xuS2FSbzZmU2NpaTY0bW1aN0JFME85a3hXTmxPZmtwMVhaYncvbDlIWXVi?=
 =?utf-8?B?Y1JMRVB3QXhrak9yODhFMDMyRExXZ0J4UlJlVWxxd2JaRzRxcmwwMlFQN29X?=
 =?utf-8?B?M1lnWmFVUURselhNdGdnbVJMWHJSVE9MTTM4dFJNaUNFdnE2eEJXUUdUSHE1?=
 =?utf-8?B?OE10K1pFK2Q3RUFnVnpnTUhNdkFPQjhTbTRIQmE0eHVOdm1RK0JiVjhyMHNz?=
 =?utf-8?B?L1cwNHRRNjRFbG82bWQ4V1dITEtvaUEvYjM4YVJUeUdaL3NNSVVyQTNsYXJh?=
 =?utf-8?B?RlpGYW9UV2pmSlgwSXhNSDByVDBtc3JyekE2eUtvcy9Qemh6L2t0LzdGb3BI?=
 =?utf-8?B?OE12SGZVUUJOdkZsQnZEMXBTbitZWmNmWXkxUmoyNTRZSFcvaU9sakNBNEJR?=
 =?utf-8?B?UURYbDJkQWtKVmtOVXNxeVRGeE43emNORXVOUFVZWHdIeDB1QTFnUENCYTNO?=
 =?utf-8?B?QUx4MGErRUdzWXk4QUZQaW44STRDUjhBbEwrOEk5eXU2cEJWN2dnQVU4MXNC?=
 =?utf-8?B?Z0RsblExQ1JQUk5rdGwrQVVIbDBhd2VVWTNObnhzaUoxQjNLdHlYRE5wYVNx?=
 =?utf-8?B?OXh3aUpJMFlTRTNINEpnVlA2U2ZBeEZVeExMR3NrejdpS3Y0U296TGpBL0dq?=
 =?utf-8?B?OWF3WmxIQ1NFenhobEhSVjVMZUxWMXFIN0xYek9NMmpQRERXVlJrSnZxYk9o?=
 =?utf-8?B?TzV2K0F6VksyalRrTVorMTl1aDFpL1JMQTdwL1hTWGtRNXpLRmxGZ3dYcVNW?=
 =?utf-8?Q?gdpCBF6Y/u4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFLbng0cEJsdXF6RXQ4bkk0RlcxMVJSamdpeDJDaGwyV3FrSjhKYzhqbE9X?=
 =?utf-8?B?cUc1USsxalFqSzdrc01lSklEdWdSdUNCbWVqYi8vM1Bxakwrb3Q5UmN4TWp4?=
 =?utf-8?B?dVZQVHBNdGIxemxxbGpnTkZxTURhYnRhM05TODJSMkt3UVVlWWVrcm03a01F?=
 =?utf-8?B?MGpuMXlSSUR2aVFJS3pPbXlmVmFlVDJuMU1CTmdHbE9IV1dXL1FHck9Pc0E1?=
 =?utf-8?B?Z3lEYWZBSTQ5ZUdlQVVITm0yVGxKeklHcUladG9LNzdVZVdXcXBrQWppZCta?=
 =?utf-8?B?b0JYY2oxN1crQ25vL3o5YjNmZ2d4aGtxUGMwQXFPUW9LNDY3ekllSHYza041?=
 =?utf-8?B?MFUzYnhwcVBFWnFtYUg2T29KWURvTENXVlUzMFV4YzliSCtxV3IyZ1M5bXB4?=
 =?utf-8?B?VENKM0RFQVZ5ZXB6OWxwSnRNcXlVNkxxUGo3OVpta2VKNDR6cUdGay93Mmtw?=
 =?utf-8?B?RzJ3eTNHdGdWbmlHdjRCa3NCb1NoZ3V1YlFpQzVVWG52U0I4elZ5YitMVjAz?=
 =?utf-8?B?a3hPclZ2TkJydGtnbmZVR2E1S2pFZndjM1U0bTJCNGF5VW5NbVFYTWl1R1V3?=
 =?utf-8?B?Y3NmQ0VpamszcWszTHl5QlJ6dFBOdmpMZnJaenh3c3hpS1FsNVZUbXhTSzZn?=
 =?utf-8?B?YncxU0lLOGg5anFlU2FIUjRRWmxFdVhhdi80U3pMSitrdFhmTFZNL0JrZWxh?=
 =?utf-8?B?VWNDWTNQUXJuUFRra3JLK3FsazhzVXZBYkdxZi9vOTQyZ3RmL1RBdUlNZmRK?=
 =?utf-8?B?aklLSVFsMTZxWkZLdGZCcURHU0xmYkxrc2Z5QXR4ekx4dUJaY1FTd2R4LzA3?=
 =?utf-8?B?TVMvWjVESU9aQXFSYzUrQXhJLzFIdTFJeE1MYUNGdHVrdm5DRWp3MzdiNEtp?=
 =?utf-8?B?TkpkWFVnY05vMER1OGNpbjdZYTdzUXdOb2dyc1RZeW02S2tLaWxXTVBZZkdx?=
 =?utf-8?B?anZ1L1dQQU5nRno5Y1ZsU3h5V3ZVVUQ2TndCamtuYlRoSVhya09nM0U0bzR1?=
 =?utf-8?B?dkVQdnFncVdLOGQ0OFVUOUlYNzVrLzFLT2o0Q2NhQzZJbmNWYnJXV3FCaGt1?=
 =?utf-8?B?S0xIUkNLVmRvYXA3eUcyd1FWSGN0YVNBY0p1ZFhwaW0yRTRoeitHYmZmMUc1?=
 =?utf-8?B?QUduVjZuMGNKM29RSlJ0VDc3Tk5RYnNadlh0QjM5QTNReGdob0hEWHN4OE9t?=
 =?utf-8?B?SFhMRHFNNkQ5c2ZxZWVLZWhkWmNyZUhHc3o0eHJmNE1iQ1BjaHgzMzlDTTlI?=
 =?utf-8?B?QWVQZmtKZ2NreE85ek5iMlV2QUpnUFg3L0tMdnl1RG45N0JQdm56MXNWRzNy?=
 =?utf-8?B?WlZrQ1EzUUpjVi96bFVZa2tuZVo0cVJjQXExSC9Nb1d2TDduUjRzV29sREZr?=
 =?utf-8?B?ZkJjQlFjZVo4SGcvQVdNa0prVWpNOWl3VGl1ZWZER2E3TmNXOTZJd3VkSWZ0?=
 =?utf-8?B?SlVmcWlhR3g0WGkzcXp2cVd2Mzh1a0pHb3VuYnBtanBMQVE2M1pXUEVqU2NH?=
 =?utf-8?B?ZVRWNFdRZjJUZlBzdnJEV0l1em1hMFdiUjlYYlByZ2FURHhoemZiZVdOdXVl?=
 =?utf-8?B?MzdXYnVUMGVlNEVUbVQ3ZlY0UjJ6TnZzZndyR05Kbm9vY0NxZHhrSUZvVWRn?=
 =?utf-8?B?TXZ1R0FxbmN3a0VaZjdpNGZMU1NBQ0pEMjdwV1lhaElmNHlIcHZReldJZXUv?=
 =?utf-8?B?bmtPSkhDTDh5NWNJWXIycHc0UXUrZXpoTmt2RklaeG1TNzVrTzIrQUp5TmtD?=
 =?utf-8?B?OTdYbDVsaEZTWWZ2MlNRTjEwazAwbnNVcFZXSG8vVkFYZ2pJaUd4d2hETG9w?=
 =?utf-8?B?WUNLdlA5Njdwdm1lbi8zd3FiNURLZjROQ0ppOElOdllnT3lPOWtFZDhJVWw5?=
 =?utf-8?B?K1c5NS9zM0R6LytETFkwY0MzeXl0QzVCRkUvandmRTdReEF1d1E5RXV5UDZa?=
 =?utf-8?B?cUR3azdrVmhoYkdyTGtscHFkaGdxYzZiemxEeEE1Ykt3THd4MFV3dDl3VUJ1?=
 =?utf-8?B?ZzVHU2NncGsxOGRPV01TTk1DNUhCcGdUaDRnVGcvM3JGVGlBNHk1SXFEYzRR?=
 =?utf-8?B?dXR4NTJZbnJwM3MwelBjWWR1NWZNUC9MbTZkbkYvT0M5WTJOYzRqVFJYWlpq?=
 =?utf-8?Q?fifE3NIj7ZqRYk18wedb1CJp1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935ffcfd-62e8-4948-6b4a-08ddb51c64a4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 01:46:11.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuRZY4zVFFIsew2YpxHRTBQoIASxwCjCYj4ygYBpexSxT7MvYcqQ1jFqx9A8CsCUjsQYGrgE3Ny4AlbNPGqn6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347

--------------QfK8CjuO495vvoHkD5Xh67Xl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/26/2025 11:42 PM, Cornelia Huck wrote:

> On Thu, Jun 26 2025, "Zhu, Lingshan"<lingshan.zhu@amd.com> wrote:
>
>> On 6/26/2025 7:59 PM, Parav Pandit wrote:
>>
>>>> From: Zhu Lingshan<lingshan.zhu@amd.com>
>>>> Sent: 23 June 2025 02:07 PM
>>>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>>>> Initialization And Device Operation /
>>>>
>>>>    Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>>>> removing exposed buffers.
>>>>
>>>> +\section{Device Suspend}\label{sec:General Initialization And Device
>>>> +Operation / Device Suspend}
>>>> +
>>>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>>>> device by setting the SUSPEND bit in \field{device status} to 1, and the device
>>>> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>>>> +
>>> You ignored the inputs.
>>> I do not agree to add the "SHOULD" normative wording in the general description area.
>>> The reasoning is explained already.
>>> Please adapt to the existing style of this spec to keep the normative in requirements section.
>>>
>>> If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>>> device by setting the SUSPEND bit in \field{device status} to 1, and the device
>>> sets the DRIVER_OK bit to 0 once it has been suspended.
>>>
>>> Is this really that hard to write above way?
>> I believe you totally ignored my replies in the last thread.
>> There are no rules forbid using "SHOULD" in any non-normative sections.
>> Now here I copy the reply here again:
>>
>> In the spec section 1.3 Terminology, it says:
>>
>> The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “NOT RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC2119] and [RFC8174] when, and only when, they appear in all capitals, as shown here.
>>
>> RFC 2119 says:
>>
>> SHOULD This word, or the adjective "RECOMMENDED", mean that there
>>      may exist valid reasons in particular circumstances to ignore a
>>      particular item, but the full implications must be understood and
>>      carefully weighed before choosing a different course.
>>
>>
>> Here this "SHOULD" exactly conforms to the definition.
>>
>> "SHOULD" has already been used in non-normative sections, for example:
>> 2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD read these fields multiple times until two reads generate a consistent result.
>>
>> The spec does not say: “SHOULD” can only be used in driver or device requirements section.
>>
>> @MST, we need your input
>>
> Not MST, but you can have my input.
>
> We refer to the RFC for the definitions of SHOULD and friends, it does
> not say where to use them.

exactly

>
> The intention is to use them in normative statements only, so that
> implementers have clear guidelines on the requirements. The legacy
> sections are arguably a special case (for implementers who want to
> support legacy implementations.) I don't think we want the all-caps key
> words leaking into other sections (any more than what might have
> happened already.)

so this is a new requirement, we need to document these guidance

>
--------------QfK8CjuO495vvoHkD5Xh67Xl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">On 6/26/2025 11:42 PM, Cornelia Huck
        wrote:</font></p>
    <blockquote type="cite" cite="mid:87pleqh5l3.fsf@redhat.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Jun 26 2025, &quot;Zhu, Lingshan&quot; <a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/26/2025 7:59 PM, Parav Pandit wrote:

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">From: Zhu Lingshan<a class="moz-txt-link-rfc2396E" href="mailto:lingshan.zhu@amd.com">&lt;lingshan.zhu@amd.com&gt;</a>
Sent: 23 June 2025 02:07 PM
@@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
Initialization And Device Operation /

  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
removing exposed buffers.

+\section{Device Suspend}\label{sec:General Initialization And Device
+Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
device by setting the SUSPEND bit in \field{device status} to 1, and the device
SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
+
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You ignored the inputs.
I do not agree to add the &quot;SHOULD&quot; normative wording in the general description area.
The reasoning is explained already.
Please adapt to the existing style of this spec to keep the normative in requirements section.

If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
device by setting the SUSPEND bit in \field{device status} to 1, and the device
sets the DRIVER_OK bit to 0 once it has been suspended.

Is this really that hard to write above way?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I believe you totally ignored my replies in the last thread.
There are no rules forbid using &quot;SHOULD&quot; in any non-normative sections.
Now here I copy the reply here again:

In the spec section 1.3 Terminology, it says:

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “NOT RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC2119] and [RFC8174] when, and only when, they appear in all capitals, as shown here.

RFC 2119 says:

SHOULD This word, or the adjective &quot;RECOMMENDED&quot;, mean that there
    may exist valid reasons in particular circumstances to ignore a
    particular item, but the full implications must be understood and
    carefully weighed before choosing a different course.


Here this &quot;SHOULD&quot; exactly conforms to the definition.

&quot;SHOULD&quot; has already been used in non-normative sections, for example:
2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD read these fields multiple times until two reads generate a consistent result.

The spec does not say: “SHOULD” can only be used in driver or device requirements section.

@MST, we need your input

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not MST, but you can have my input.

We refer to the RFC for the definitions of SHOULD and friends, it does
not say where to use them.</pre>
    </blockquote>
    <pre>exactly&nbsp;</pre>
    <blockquote type="cite" cite="mid:87pleqh5l3.fsf@redhat.com">
      <pre wrap="" class="moz-quote-pre">

The intention is to use them in normative statements only, so that
implementers have clear guidelines on the requirements. The legacy
sections are arguably a special case (for implementers who want to
support legacy implementations.) I don't think we want the all-caps key
words leaking into other sections (any more than what might have
happened already.)</pre>
    </blockquote>
    <pre>so this is a new requirement, we need to document these guidance</pre>
    <blockquote type="cite" cite="mid:87pleqh5l3.fsf@redhat.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
    </blockquote>
  </body>
</html>

--------------QfK8CjuO495vvoHkD5Xh67Xl--
