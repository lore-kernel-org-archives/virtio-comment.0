Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFE6F2E9
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603122; cv=fail; b=Qtc16IBwXClGogKY4WjG1DjgS3e6qorqLACicYN81aPXI7adCHcPbw25glTQSSeLielhy6jPcts7Bw5RK3NMnVhfSrJzshfC/njQUv1OvdD2xOKTYA0pMoeGKb1kJeC+kMc0zVOvmpFDH6BxItZ1XmbR2+CpeGuOCioHlAIXL2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603122; c=relaxed/simple;
	bh=gce077Ayx2ycOHF335Cw4Zk4FSrojuZuih2HpaiegZM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BhMfJJSh15mMSDbztasvQH8e37fers8YlTE5AcD6Lvb0nEI2kxfOcB2HXJp61yKGkEE5xfwOgB8c6BfqvAPRZqRuk3jmY3vTOZ1hhDqZ014j5H6/4Wg4MrQTPXrDzGRYwgzTiOlN0GNm00wnsA/g9/ZpbMHxcbiwVH/nbTR+tAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VSiObYB7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AF4o2yqH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VSiObYB7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AF4o2yqH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SGXptq032387;
	Fri, 28 Jun 2024 19:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=mWcBHFWZEf4hQroWv9xnm9Sj/wxzOZ6wuSUHlM8zYVw=; b=
	VSiObYB7Qu9D6Pwj1DmX2LkP+iwtSg60TAlUH5Ek7DIpApD2RySyHx5jsacyQ4qz
	pFPP+c6UWgV1JFD3F8ICQyAqsqAjmIGxyzvbm9kSH7daZv8TxU2W86MYmjtaOe4T
	cNQQXzm/4i0aEb9lVP5bhkOoe6vGaVzlXHLDvFbQIoKgCPXXPWM/Cd7+GjqsOTc+
	gkIhC8fnGaWKF0K+gN/bwJNQxZs/ZDxyshleSszpjnS0h7ZacooeAJghHPdKmk6u
	HJe5RraxI+TaLFL4yrIboorc/Q3sDYW/Mom/t6Kt/kkfG/T6CxwHa3ek2K8zxy9X
	s/I551aeiMGpykoTCbLZAg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttncm7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 19:31:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45SJUg2O023301;
	Fri, 28 Jun 2024 19:31:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2jq1fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 19:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLbkodQyhlyVF/bzHRTVcJErJuPrNtBYzcO6IWHiy/Rxct2oLS9m7Q7sqMRA/Uq/tP0je6nEjFxzQkQSBHNpCbcA50qeCaeRhc51x07pd5JjngcAGNRBAIDACvIS7HMqqoOcwKFNFgEtzW5eoccpSMkqG0Gn5QGHwhN4bPayotexCO6XZZXk2Ejkgs514/7MXGb/4G8TWoq7yWpWSG7vkpUJNkFzVIapLubMiKpUBVl4Sg/I/KoLRrYsYoPGlo0+oD1kOKq4R3a5zOMRlf2L4cUmBiKClIKynVamNIL2YjmrOIYnxcUVXmgwMNDW3yuwQSp0E7jYvW3DBtoNa9WdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWcBHFWZEf4hQroWv9xnm9Sj/wxzOZ6wuSUHlM8zYVw=;
 b=mpzlx7U2fajXcbZiOkCmsFQ8Y32p5ilGzL6imIcnCmh5K7UsJMsj3qIXLUtW+jLrkBTN9LU62bN13gLFrR0IR9eAe7fPMVdoyfBAJtAj2pl+jKfXmA+c1K5h94ItQrPh7dbrneFBl+ewq7FmfSSES2WuNLpX+rXwD4DZUPTrMRdomcYLIs/L46eqPaH0dd1Sc6kyB+GzPDRsXFKbGqtbImmJp5o+2ZhPaT7j8vjmCnT+oqy0pM/DlPHx9HuqknMPurjHHRCVeL/f+savlJSJmdGaihBM8qTA7HMWFjE64Y3qtyvUw9hKvHY2Vh0qkMDRjBqlVuWsnOe5RklxkJZ61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWcBHFWZEf4hQroWv9xnm9Sj/wxzOZ6wuSUHlM8zYVw=;
 b=AF4o2yqHgQZYBKIOD3fWEKVPPape74okLTGClAzOMAqUhWNdajQa0Fw9s9kQNF5ONW8PtWkjVOzHBQSeImnsZRe+jFT6aiaUgArHvotJUkQTFMyOwq21/5UzpR4EV60x8Ya1Xb5iPp37Zeo34VhRVvCN+N+bRlYXEmLy6qqyWh0=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by DS7PR10MB4862.namprd10.prod.outlook.com (2603:10b6:5:38c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:31:50 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 19:31:49 +0000
Message-ID: <67d0af06-8132-4f0c-afb2-3dbff77ccf10@oracle.com>
Date: Fri, 28 Jun 2024 12:31:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
        Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
 <20240627181635-mutt-send-email-mst@kernel.org>
 <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
 <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsxP0eKK2DbKVTig8MPW0J7z4o5xSSRtk4JAcOMoXmsPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:208:2d::15) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|DS7PR10MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fe382d-d5ec-45a6-4a79-08dc97a8f4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVJrRFVxTTFPVW4xUGw0TEFMQTl1WGFrV2ExUVhmTDRZQUo3bEZvNXZzb200?=
 =?utf-8?B?NXRCMHJkbi9jRXhjUnQyeFJ1VG84Y1ZYbnBkUHBaOWVvbzk3T2Fjb1lIR1gv?=
 =?utf-8?B?NDFEU2o2S1VRMTJxa0FzRzFxOGVIUzRRWUZJMDViOThoR3ZyUWlCclMyRzk1?=
 =?utf-8?B?RWtreXF6dnh5U1kxNnd0OHErSkNzQXhsbjFkRTUvZldCaEYrYTVDblpxdUpI?=
 =?utf-8?B?aklCMFZYWVlLamRGc1FQUnBTNlZPRFd5azg5aW16NmZ5UWE5clJ4YXY3emNP?=
 =?utf-8?B?M21GQUo5V3lZdC9JSDFQVzZaaVhsSG1oWXBSdktUNHVRUUk5VGZ0MU40KzBF?=
 =?utf-8?B?L08yKzN3NEFhL0c5aUFQbkpOQ3BqM2NSa1g5R2Vla291em9INmtscmdxQzhh?=
 =?utf-8?B?MVJGN1FVK3g0SmJJUThVWUNJeUdIamF4c0V6TWw5VFZRemowQWZheUl0NWZ5?=
 =?utf-8?B?U3NiMCtnNzFac3B2ZWxwZHdlcDZaNElFR3I0dnJuM0tjTXJJeHNHWXAzaUtF?=
 =?utf-8?B?WlN3eEFBWVBBT2UzcFlPTjlzcnBjWTAyVjZGNVhSMWxrSkdEa2dPTUdaM0Jp?=
 =?utf-8?B?WW9rMzdGZXQzT0JaV0pESGNEWmM4U2ExRlc5ZkNPb1kwcGJPVXUyQ01Ndk9N?=
 =?utf-8?B?eVNJMWllY3Zha1EyQmpBYUNNK0tXK0RQMzBubWU2MFFvbG1CWHV0ZVkrdGpk?=
 =?utf-8?B?WUhlUUd4SkhCNVVjaWUrd25RQUVoelRmaDBOOG9qMjV3dGFHZEcrdkFXVlVJ?=
 =?utf-8?B?RzRPS2QxVGZQeHIzRHlYcmg0ZThHYzU2Zm1qWHpUUDcvUUc4N044a1NrN2RI?=
 =?utf-8?B?MGtuTmVEejNCVDV1bVlvZVV5anBacmZYYmxlVW8xZ2hPRzBjaHFYeEUreHNF?=
 =?utf-8?B?YXlnZmJabjRlaHN3elB0eFQrK1NaaUVQUXdHMVVFTzZEcTdVa0hEUEhtaXpV?=
 =?utf-8?B?KzVBcnlMbzNCa1lpTnZ2SWd1WTJ5dlZ5MTlRbzJaQk4vbVNQanBZWm9LbDly?=
 =?utf-8?B?aTg3eHJVcTJqZGphREoyS2VtWFFBYmptSEVEVkVMbUhiUmd2ZmQvSklWWU54?=
 =?utf-8?B?OVk1YnBIS3k1dU1ybmhGNUlYTDFUeXBmWGZma0wxcFY1ZkJnblVJRjJvZlZw?=
 =?utf-8?B?YW9taXJ4ZUtnS2dTaGNxOG1GdkVEZmhMSXpSQm95SzFXK0xNUUF0by9LVWZR?=
 =?utf-8?B?NXBoc0tlbG92M2NyUWNxOG8wajhSUE1wQnRjZ3pVRzVOQmk0VlNZSFN1Z01i?=
 =?utf-8?B?aXFOdXZzclkxRDFBSmIwazNKNVFIekx3dFVBVjdXSjBaR3R0akI0UEpHdm5u?=
 =?utf-8?B?RWVGcFFhREV1NkpucE9raEI5TFlPbHNUK2FBUmZOY2hMK2hHUzNmcmVzaHVp?=
 =?utf-8?B?bzF4NGFWMVg0MHBZL1cwaFZpNVkrZmo2YjVFWnIxT2ZDRTBPRnJ2TWtFdzk0?=
 =?utf-8?B?STE1QW80a2dhc1Q3ZmVUOGcvalhCVmJBbi9HTUVOMFh1aDdmK0NxQUFSeGc4?=
 =?utf-8?B?NlZGSVEyZkhOdWtiaktpV0FnTFFUNk5pbGNFTm4wbjRuU1ZONGNxSy8vcVd0?=
 =?utf-8?B?ZDJYNHNuWlhZZEc1a2ZSMUpzOGRsZWZRM2xVQnBSREVtU0ZVY2x6MVdjamFW?=
 =?utf-8?B?SUkrb004WlJWSE9BNHhzRnlkNGJJTUtCYWwxNGxML3RNUUlzWmNBdVhGdmY5?=
 =?utf-8?B?bHU0b0Y5RGZzRnFEcThrZlB0MU0rNGhtWkN6MnJ1QlJMb0JCZHMrcDllVHdP?=
 =?utf-8?B?dnkveVRlYlpnWWtMS05DZ09TaCthZTdTRTMxTm9QWVFDbVFWdTZrdlRJOElk?=
 =?utf-8?B?WFBZOEs3VXlOdGNSK3Bsdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2R4aU9GajdFdmREbU9Dekl4RGhTKzZ5OXcyKzMyMzJ6czg3czVvVHAwZ1Jr?=
 =?utf-8?B?R2JXa2l4L1hkZ0YraU5IMlFMYk5sRU9ZRnBMQXQ1aGdQNlhEVmJ2eEMxbFRV?=
 =?utf-8?B?NGlUQlhma3M0WlV2bUpNdXJjTit6MGJwVmZ6alZpaHJBTWdSMU5xZENMZUY0?=
 =?utf-8?B?bjRuVG5tcVNnUUdGbUdrTjdtNHdsM1hmbEVFaGRYQUROWXJmaVhDS0EyVWdG?=
 =?utf-8?B?RENqczJEOW9zbTlrLy9Lb0paYmZudGtleEZyRkNhUWZoQTI1eEVWZTdpbFZv?=
 =?utf-8?B?RkgxWWxDdmZ0Z0lLdXhkLzdIZmx2RXZRelBVL3JCbUFaNnJJRjNRSWIxdzJK?=
 =?utf-8?B?ZGhzM29jcENhRkRkcmI0cnhXdFdqd08vVTRqZWhSSFI0QW1IcFRoejBTWmxq?=
 =?utf-8?B?UDBWN1JGQmU3Q202NytETmFLZmZXSGlWYnNhL0w4SktJeXFWMG9Ednd4UHkv?=
 =?utf-8?B?RHJYa2s2TFA5VGZid0tpcDFaNmZFU2RUVkJJUDYwYnlJSEVRVU9TVGtsbkNv?=
 =?utf-8?B?L0lDQkQ5aFdaS3p2bjdJRnhmYW5ybGprZWhmVTIwZkRqMzd4MkFncXZhOGdv?=
 =?utf-8?B?TDA0akcvcEZFTXRDWkkvLzVsTUd0ajlpeFRHL0xNUGVIMk5Rckk5R2pqaUtz?=
 =?utf-8?B?c2Jwd1orS1JITlp0MWFaUnd6a2N0QlBBbUNNNjNTcVFubXJoa2IxelgrcWlO?=
 =?utf-8?B?WnptdGZIQXJvVGp4YXRCc2pDTUJLMEZ4RHBzUklEWCswRVN1SlE4Yk40cDVC?=
 =?utf-8?B?ZXdxTlFySlppRU5Bb0dFbGJ2L3doa04yVUtIUTgzdEFrTUI5Tlh2enZpTHQ2?=
 =?utf-8?B?L0ZKOVJ0MmRxZ0JPWkQ1UUlMQ2JxUnZidmVpVXpiNjFUZ2g4RjhMQXJ6QmVT?=
 =?utf-8?B?Z3lZcDY5UVJycTYxaExDdUZSK1ROSndGQTNvTXM0VlRHTUl0OTRNNzlMbUVN?=
 =?utf-8?B?ZjJYR2h1MFAzV0d2Z3BzYkU4cEM3M1p1RlR0NlMxalhYeHRCMWwzWXpUVTlU?=
 =?utf-8?B?SVUwd0lVR2hrMEk2ZDBRcnZFZWxxeU5BTWQzclRKaC9kSXFyWDE0Um5NZnhK?=
 =?utf-8?B?Qk16SU5YMWZSZEZCMjd1Qm1wRU5NN1VzUmRHMHNiSWNQRHY0clhNTXRaMmNX?=
 =?utf-8?B?SlZSYXpFTVE0WUpTV1ZJMDBHNDAyZ3B4VWNqek0xcGRzdm14Q2srVE1TS0Rz?=
 =?utf-8?B?Ly9XSjJkUVRjNCs0blgwK0VHbzhwVENYTlY2NHlNd0RtRHBhTFVlVGNkb05i?=
 =?utf-8?B?WnUxYTJkcjVjQzc1bm9neDdWdjhkSFREemE3V1M2dzFSTXJvWjk4Y25lNkpG?=
 =?utf-8?B?SFpSd2dwSW5BWmdkMFRGeDZkcTAwYU9sZCtEVmhGVTBqdFJvZkJhbHdnLzFH?=
 =?utf-8?B?VmNjMUtyczB4TXBuY2QvcStQbHBEL0hwVWZJbkhYdFNnWTVFTUFrT045Nllh?=
 =?utf-8?B?a3BpOUZXSmluZExVems3Z01zWHA4dTkvNnpVcm1qQndUcEp0bWVjQm5SWitG?=
 =?utf-8?B?SDI1akFWdUl0SzhBeEFEQ2R2cldSS1BuUEdTUWF3YWFCVHBXSkM5YlY2dUNW?=
 =?utf-8?B?Y0p6VVRSSmZsSDkvK0NaWlBWczJCRlNNcDZWUzU3cnpyYzBISWhZYUlEUVV4?=
 =?utf-8?B?WWpxdE52ZXJnby91b0w2VG52WGIrRmJmMHhibUVyTFhuQXFDaE5LNHY0Vksw?=
 =?utf-8?B?RUZkVWV6QXYzcUF3TUt2em9MTVpEYks1Mk5MUG8yVE1BMURtU0FhRXlzWEk1?=
 =?utf-8?B?ZGlZNHBkM0J3a2d3TExnL0ViVEUySXFtZ0k2Y0JKOUxwUnZDOS9HS1g3WGhh?=
 =?utf-8?B?Vnk0OTBEeGtETGdKNWhISzdJWi9FSTNkaU1ESUFnbmpEdXlteTc3Yi95OGFE?=
 =?utf-8?B?NGxmQ2pidFJIN1ozUVg4T01Ib1BxckQ4YmF1MGhsWWFRNXF0dTNBZENiTUky?=
 =?utf-8?B?aWtNdktlMXdUcFQyV2FIdTVST1BKbnF4UHJkTlNPdmJaTmlkLzhwV096a09r?=
 =?utf-8?B?cTUzSU9BSFBuMVEwSU5DU3JtdEIxVXBncWhIN2p1Z3l2Nno1MU5RYUFNeFdP?=
 =?utf-8?B?Y2RkQThTd2JPbFNvdWRlWEpFVW9SZkNWZEFIYyt3N0lXQjNPMXZBeWxxODBz?=
 =?utf-8?Q?h/cFROx2Vn4/XdvHuCQdvcm7w?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Ddi1JfqX7qGNGlTh3B3i7oSVQccHUEiZ6rpXexfsTikF8PMqbioKc2OGPZ1gvv9plueAi7HbajW0U3YVAhRGRWGpQfI8+uJPG41sS5E6zlRJJxZMDvU/HomlTVKBGcbMqaBN1BbNg5AyaprprDDJdMX8gVWTSVbdv2HmFs057KeEARTgW4aHjS6gpNII05c58nNLpmKk6+DT/dgNs/5B/k+NK3ApLCQMS6MOd0JGOJx+rbY3BHhV4JbqdJEjPyEMDvM/eHyIo+ZP7jU3ju7qLXqKViIPOyShK41Q8nItSkENsshZcUc+wkwDYuzgefIfSno3npcefgeSkypjV/HSnJmK8DHW+io60g5txnnXJdLKPfoqJmKJGP93W/Y1zRexntqzuLnBDY+/qejaO2jPQxOpHVYBY8sPykp/p6vUXpgE/u+G2trPp17OU4POm9oz31RJ9EhtQR+xeTQq3Q73Pb8R5YvyOOe2kqOAxzGd8gG34FpQH8fHHwZVbdXTuW5q/fmGaUYeZr7pDaSoBELQhi/fxp+CQZsTPDLt/7JXXqc0POprZ8m1sztNu3TqLFVCo59K3iwaFOHipjQwEaydfie2V+fjkfikldVSo8mhwYs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fe382d-d5ec-45a6-4a79-08dc97a8f4a5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:31:49.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wPuLYOGkQmsT+OFrUR0Ob/oHsU/gNw0rXROEdqo+1NXn6oAZJt8jJ6qhzDrJNy6arh+U4pJL5yPHfQ+Z0Njng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4862
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280146
X-Proofpoint-GUID: -dNzSDSbwAV7_-mM3TqnMAwT7wWqvKz7
X-Proofpoint-ORIG-GUID: -dNzSDSbwAV7_-mM3TqnMAwT7wWqvKz7



On 6/28/2024 1:23 AM, Jason Wang wrote:
> On Fri, Jun 28, 2024 at 2:57 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 6/27/2024 3:18 PM, Michael S. Tsirkin wrote:
>>> On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
>>>> On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
>>>>> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
>>>>>> On Tue, 25 Jun 2024 18:14:15 -0700
>>>>>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>>
>>>>>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
>>>>>> [..]
>>>>>>>> I saw the need of this proposal slightly differently in the discussion with Heng in v4.
>>>>>>>> The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
>>>>>>>>
>>>>>>>> Flow is:
>>>>>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
>>>>>>>> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
>>>>>>>>
>>>>>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
>>>>>> I have certainly understood this differently. When
>>>>>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
>>>>>>
>>>>>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
>>>>>> to/MUST do the coalescing according to the parameters as described by
>>>>>> the virtio spec.
>>>>>>
>>>>>> Michael, Jason: Can you guys weigh in on this?
>>>>> I still don't understand why this change is needed.
>>>>> We have this text:
>>>>>
>>>>>      The device may generate notifications more or less frequently than
>>>>>      specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>>>>
>>>>> and
>>>>>
>>>>>      The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>>>>      the device MAY generate notifications more or less frequently than specified.
>>>>>
>>>>> So with no spec changes, devices already can do what this patch says they can do -
>>>>> send notifications less frequently.
>>>> Right. If I still recall it correctly, the above text was to accommodate the
>>>> interaction with existing used buffer notification mechanism, F_EVENT_IDX or
>>>> whatnot.
>>>> When coalescing is in place and effective, interrupt delivery is a
>>>> collaborative consideration based on the coalescing parameters specified
>>>> *AND * event index / NO_INTERRUPT flag as well.
>>> No, not really.
>>>
>>> For that we have the next sentence:
>>>
>>> A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>>>
>>>
>>> And of course event index never makes you send interrupts
>>> more frequently.
>> Hmmm, this next sentence you reference above was indeed for the
>> interaction between coalescing and used buffer suppression. Then what's
>> the best-effort part was about, really? Round-up or round down the set
>> value to the power of 2 to save space? How is it relevant to our
>> discussion? I think even with rounding it shouldn't be too off? (as
>> said, by best-effort v.s. give up)
> Would it help if we add something like below in the guidance?
>
> When the device wants to send a notification it needs:
>
> 1) check notification suppression, don't send interrupt if it is
> suppressed otherwise goto 2)
> 2) check event index, don't send interrupt if event index is not
> crossed otherwise goto 3)
> 3) check coalescing, don't send interrupt if the coalescing limit is
> not exceed, otherwise send the interrupt
>
> (Just to demonstrate the idea, needs tweaking for sure)
Yeah, this looks good to me, in principle. I recall there was detailed 
description like this in the early revisions from the first set of 
coalescing proposal, but those useful descriptions were gone for some 
reason. We should really come up with clear clarifications to help 
readers set expectation rather than being vague or worrying too much 
about verbosity. I was having a hard time in understanding what the 
best-effort part is about...

-Siwei
>
> THanks
>
>
>> -Siwei
>>
>>>>> Re-reading this spec text, maybe the confusion is that it mentions set
>>>>> commands specifically? And it's also stuck in the middle where it's easy
>>>>> to miss.
>>>>>
>>>>> So it would seem that the following should be sufficient, and it looks
>>>>> like a small clarification we could just apply and include in the
>>>>> vote for the csd. What do you guys think?
>>>> The revised text below looks good to me.
>>>>
>>>> Thanks,
>>>> -Siwei
>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>
>>>>> ----
>>>>>
>>>>>
>>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>>> index 76585b0..d6788df 100644
>>>>> --- a/device-types/net/description.tex
>>>>> +++ b/device-types/net/description.tex
>>>>> @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>                                             for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
>>>>>     \end{enumerate}
>>>>> -The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>>>> -
>>>>>     If coalescing parameters are being set, the device applies the last coalescing parameters set for a
>>>>>     virtqueue, regardless of the command used to set the parameters. Use the following command sequence
>>>>>     with two pairs of virtqueues as an example:
>>>>> @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>     \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
>>>>>     \end{itemize}
>>>>> +The device can generate notifications more or less frequently
>>>>> +than specified by the coalescing parameters.
>>>>> +
>>>>>     \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
>>>>>     The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
>>>>> @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>>     Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
>>>>>     to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
>>>>> -The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>>>> +The behavior of the device in response to specific coalescing parameters is best-effort:
>>>>>     the device MAY generate notifications more or less frequently than specified.
>>>>>     A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>>>>>

