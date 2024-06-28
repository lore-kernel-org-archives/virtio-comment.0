Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7A6A022
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 06:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719557829; cv=fail; b=g6X2cBHlRPeqZonkC3fNM8pePk8gj8+Y0LuZIc17Nsf4ImFm6/wnXECJ++BjXftcFlnWbBNayDPMsWqhl2YXk6sH4ZRh4qZliqCONrAtuQDSSaaBZDuFmpigTWfZs2GULGwx3Qo7PXGKdYb2BkgkVJ0QTRJDlh3wV7pqsH/m/NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719557829; c=relaxed/simple;
	bh=6dG+U8d8GTbMRYB09cAfcUiu91ESfw9e9kocEjqxHT8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=USKOA9WVfi3MvaCmTNExMNfmyI/UJR8nFNKxG8XiNtt8BbUtGZv+owlPtl/eJg0aThjVJPXqVr/8tGOLcM/tG3Mex04/oqpEC/AQHjhYT6sCRywWCfQ5YLRf8rrhai3lOrxUt9i4Orz2d5F1ETTyJom9WBQY103C/vj3SB7vXuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jnCEiuKp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QJbrzNjx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jnCEiuKp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QJbrzNjx"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBXDw016795;
	Fri, 28 Jun 2024 06:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=BcsWwpNlPYdHgRadVMZSes6EbSOoagEqUwT9jkapH6I=; b=
	jnCEiuKpNj7re77DDb/Vfobxud+RUgmFj5ZaWvu3eIRFDuWV3Okz2HSIpin+KloZ
	TMXoCZgB0qy/9Cn2tTihTGLs4DI9eTv1uV2oaCG5f65xl+sKmmBoPjiYgYgRSfX+
	5FBjblVgOtIjl3YKpbtXvXx1SS+tfGf3j6BIGSHmKZioWiWkZUvRgZ4pD8HwpTAT
	ZJiAncLDNIYwU1UvQ/M6h8JUQxC0lXws0DrSQEJrCdkHGaT6vAfZHqTybh1fk9XN
	9VwvaCApa8EIE9/u1WleBMxoP0qs/O+qFQO4DtMLqIznW9ZedWjc43kArdWPU7tC
	bwA/wk5kb9Epd9Si1CfyyA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywpg9f9bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 06:56:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45S5e5bP010744;
	Fri, 28 Jun 2024 06:56:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2hx547-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 06:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAKKvzJHWEKo16mlrQB4/xhSV4+IWpqZlfGLGzEE+DmIIxojhizhAtpYLIBHljCBHOo8r4wDcmi5W1VsBNxeUmOJiz6BHV/RQAx0a9HSuvcH04bTrtnoAVD6cSckIeD1ZypFxdUtceLHrbJgYqjJ80Jh9VVbDHxo+bIIqgEIqLUvDMQY0WzeM7RPgtSQVkmawRSNG6Pg1sNEY++IhtdUyaLoANxeMOpLPktyrxqG8Zv+s7sxBJhIv+vfUqv8yR5HpCjGdcoti2wIBuOkXEhpmQHq0ccavViJ5mys5INXAiUkM3PQbRZJQGVY+W2YJ5vdYYA732fhBh3TF3p1wd+pCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcsWwpNlPYdHgRadVMZSes6EbSOoagEqUwT9jkapH6I=;
 b=YZUR0z0JNbxlDL0OzGaXqFEJKUwdIbgFXIugBAVjXRYupcyj7Q2HsKierJS+rLKo6TUrf34aeZThSaExkl9XZmiY5Mpsj3ese+Bruf2fsLJbX/qhlUaRNWpdFzo79alHs+IfnHMn5t+j5nO88OcU4YQbNc1X9W9pREUmGJDW1cysuJeJAW8VX2MqMf+dqQGlPvjGIzQqxG8ygniT5HVxM6tDEEQHfK6mWsR4klXoRom0zt3GKgQL99TWlqdouR+OfRXGgaVqg5reh19rTirgZXX6jvWLqPZAe3z9D5kbxavzEYAmRpMMr7Roai6OORVBBuonEDsY90dW2m6JX4f+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcsWwpNlPYdHgRadVMZSes6EbSOoagEqUwT9jkapH6I=;
 b=QJbrzNjxj6gJEz8cuL2fV3oXDsd0VCJ8ZKgvPkpY+J9LoqAn8m11YBwleeKuAg22CDqfs7emGY2sG2+gea2eyc9/KeL+OCTnpAbxAOPU/DfM7B+qgXKvv6M9FiQU7tIlw/M6OexR4k94Qo4vIUFMr6Ol0k9dyoaHNFCpOXfGLgY=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by DM4PR10MB6791.namprd10.prod.outlook.com (2603:10b6:8:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.37; Fri, 28 Jun
 2024 06:56:50 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 06:56:50 +0000
Message-ID: <3297e270-e9a5-404e-92eb-55fbe6c3f78c@oracle.com>
Date: Thu, 27 Jun 2024 23:56:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Parav Pandit <parav@nvidia.com>,
        Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
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
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240627181635-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|DM4PR10MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3339b90b-93fc-4457-85e3-08dc973f7c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UU1IbExwdmdGSGxrMkk2WEtXMFROaTNraDdqRTZ5Q0pEdllpTC90Vko1S0Mv?=
 =?utf-8?B?UG5SdTVRVEhDQms1UXVWdHh0enhGWlU5TUZWV25oWWZ5TG04UTdzQzIyR1d4?=
 =?utf-8?B?elBnN1ZPeUZ1VVJRMFVkZEV0d3J5eTlyVlRKcXBKUHNSeVJYQ2VVVXU1M05y?=
 =?utf-8?B?Y2tZSzcrbkFmSXRZdFh5MFcvMm5kN2RqY21TR1RPYXJsdmFVR0kyTjZxdWFI?=
 =?utf-8?B?NDFEZEpVb0QwU0hzYUlwbUcrc0gwSERnWWhEUXlYQVNGTDZ2NXVLS2dibEhU?=
 =?utf-8?B?anhCVkhZdWhEVlNHMHEyTGkzTGE0cDdRcjRXZEo0c1N6SUVlZ3FDekQ0T1lk?=
 =?utf-8?B?SEdqc01taXJUd2xyNzNBT2p4WWV2dkJKSEdJYTB5UFcxTWYxRWlHMlJtblYx?=
 =?utf-8?B?SkpaRC80VzQ5Uk9ObE1vVDFtUitmbG40MjZEdmZnYjVvV2w4YlcyaTdMb3NV?=
 =?utf-8?B?WEpKWE5RL1U1R3duczRPeDg1R0ZjaStXV05NTHRjK21CV1JBeGlIaFNrc0xa?=
 =?utf-8?B?NE1nMmpqWXB2aWVOWldSanZudUJYWFZTYXhIZUsvL3JhemI3aklwZ1hWRUha?=
 =?utf-8?B?bWozVUZodXpQSzBuaUQzSUZuV2FNYlhwb2RWZmlHUDZnRmZKREFrQTZNWkl5?=
 =?utf-8?B?bHUzRjE1cGJNZldWNzNXbnUrcHFaT3ZOMVowa1NHMkk4YnArZ1JBZmlTb2ha?=
 =?utf-8?B?Si9YRll4ZUNsMzd4Y3JGRE04blB4MHJQNGU2Y0FUek5CZmVlb2RDZjNLVjRw?=
 =?utf-8?B?WnZ0bTQzTVBZaVFHOHg1SUtNVW5xTHF4YW5lS0JpTDJkcEh2dHJaT09LWEIx?=
 =?utf-8?B?NG5aWkhYb2NWd0l2U3BZYXdyWkxaQ2ZOckZ2ZERZNXFsaXF6WFZIR0JIQlF1?=
 =?utf-8?B?ZFR0TndkS0NPUG5kcytyYzRieVhYeHVyVXpBSUxhUnBiVmh0VFNQRGtuWWlH?=
 =?utf-8?B?UG5pN0hoYlVlRXRtc05mTzRqdlNMeVlEeTJMcGNnRHNTdVVhWlZpUEVJQVZO?=
 =?utf-8?B?bWNxYy9MSk9aaXZNVG95ck9hWmFhTEFJemk3RDBIeCt6V2hPMlozSWd1S0l1?=
 =?utf-8?B?V2JUSHZncGJYV3BlcGtYeUZvRDNnMzN4VGZRcTVjZHJubkVJSkRSUSs2ZzVj?=
 =?utf-8?B?c2g0VWx1S1A0UkNMenBaLzNKdTlZVFJjWEx6NmVyYTZPN013RDUram9XRld0?=
 =?utf-8?B?am82dEZlVU5jMGdvVDBPdjdram5abkozOFZFcUVLK0U2Z2hsUTlhMGE0ZVNH?=
 =?utf-8?B?SGFRaWN1VDc3c1RwaXVzaFdyeDlQZjNWeWlmaVFCOTE4N3Y5Nm9YbEp5STNh?=
 =?utf-8?B?SHIwcDVUcXVxNmsrY1lhM0RqMFprNUJDUENwaXoyb01oTE1uVExiakJyZ24y?=
 =?utf-8?B?eDJPaVRub0pyenVod05MUGVVRjFta2dtbFNzY0FUVFZIcFRkbGdZenhyWEQ0?=
 =?utf-8?B?eUh0dm5acXFhK3BSd21KbUpFdkJzODVkcTYrWWRjQlNNaVJvVGE2UG54aVN6?=
 =?utf-8?B?K21EMVRDUGNKWUxQN0g4N0lDWTBrbUpXd1ZhNlZDeTlFaGEwS1N2Ry9sYWhk?=
 =?utf-8?B?K2xuNWxDbUZOL3V1cUYyc2NCRE43Z3J1bWxTMGxlN25MdThibWFTN1RMT3VW?=
 =?utf-8?B?Q3d0UDFHOTJqTGhxU2pMYStUWlUzTFZOZmlyWjdoV2RMWUh2RVZzNmdzbmIy?=
 =?utf-8?B?Nm1zamRYNDR2R1U3M1F4UDhDTVhPYlQxam01QzlnUTgyU1p3QzFQazFuQWRT?=
 =?utf-8?B?Y1E3NXZZKzRmR003Y1hFQ3hhTUZwWFdmYURlckFLN1d6eTZ3bU8zRWdEOGF3?=
 =?utf-8?B?S2orcEI2alU0dGJWM3ZSUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnFqMmRlVHBFOWlRQUxjNHM4VURpSkVGUjJMTFFaQlE1SGFYRFYxaUNPckpU?=
 =?utf-8?B?Mnl3dWZaT1hTczlmQlpNUkFnbVFVYXgwMnZScGcrRmFISkdCeW1ycEEzYi9T?=
 =?utf-8?B?ZWhHWkpnM05OcXE1QmdLaVVBYVcyRlNMZk9ZQVp1Sy8wbjlhRXFhajh6VEJt?=
 =?utf-8?B?bnJnaTkvNWVwQlhkZmlkdWs5aWNJODJXYjRaVGNzSVcrdzFYUGFocklwRkpl?=
 =?utf-8?B?bml2dGxLNmNyblZKODhJTSt6T1VZMGVQelFZekpvMnpwWURaNVphajRKb0VT?=
 =?utf-8?B?N2tQWEFpTG9ZR1lOb1NqdjNPNU1BdUxrV3oyMGZYaE9HcW8yVjIxcjI0dXNy?=
 =?utf-8?B?RkNyZDZGTWhaalJSOEFWS1N3L1hucTVuSStaZWt1NHlYNHo1UFBDT0hrZHN2?=
 =?utf-8?B?a0wrUG9mMFYyVENpbkZMbk5IR1gwcGU3SUlBM0pRejJxUDRnVVZKSUhIWmd2?=
 =?utf-8?B?dXR6Q0luWXZtWkI1Z0pDeUNFc25NUjhXcEI2blVXUDNXM1FLaHlkVnRjVEJD?=
 =?utf-8?B?bjFwOXRnanlzQnF4T0tSSTZSRXVjT0hUemFiTHQ4V21jeWw5WElsenBvNVR0?=
 =?utf-8?B?c1JreFpsRi9mZjg3TW9FeFVnZG1OWXdaMS83bFJ3U2ZTMkxQU0paZkZZK0RB?=
 =?utf-8?B?N0NlNEx1azhXbEVTU3JvdURPSXhwRTdpTjNhajBUUmJFK0JHZlJXMyt6cmRq?=
 =?utf-8?B?bm9FOFFYTHgzcWthWFFiZ0lCb3dkMUR2ckdzQWFuYlJDQzlTUU80bXBMWG9P?=
 =?utf-8?B?WkI2Y1dQL21qUXZ2bmF6aTJpOFUxc1ZJTjNQdzRvajQ0c0JGZ0NncllCMFNi?=
 =?utf-8?B?NFdtQk96TThTU1FQYW1COUt3aU5tOE5nODBObzBhbDQ1KzBMSUYyaGJMTGpF?=
 =?utf-8?B?Y0U0VzJ5YUQzR200d1VPZ1pUdTRFZXNGeGV6blhkZjI1QTVsMlhkVjBUSjl5?=
 =?utf-8?B?c3NkMjFSbkJzUG9JY1M1cHdmVXM0akdDc01YU0NwbTNQZ3FMN21PbFVpcmlp?=
 =?utf-8?B?amR1SkxUWWhGYmhLSDYvNTFLMXZVdUxDSXJuQlEzZnBxbnQ3S2oraklDWEcx?=
 =?utf-8?B?eGtRMEVlbEtSWkd3cFZaTDMvRkQxV3krTFphYVZwRk8wcjNLTmVOY0p4NWFN?=
 =?utf-8?B?aVJjcEhJaWhvcjkvQUZJbzlnZlNNRDB0M1Z3N2VGTVVRUlkrUGxLTlVxZjQ5?=
 =?utf-8?B?TklUYW9vQU9IVWlkSUVvTGkrOHdGc3BGTVc4Ylp6YlEyZ25LMC9mUGY0YnRl?=
 =?utf-8?B?WXh2Y2NsbE54eUxVcGIyNkpzaU9DVXJ3Y3VyU1lrR1VrVkhsd3BBWU9mZ1lW?=
 =?utf-8?B?bG5TbGlZa0tSaVNYMkRxcDFhYXpPSzFPVmYzU3VRelNUd1U4QnZzcFY5SThS?=
 =?utf-8?B?WENWeFA4SnorRVZkYXZ4WVdtREVBVWdPNFFHSEVnNmtzVzhHSUEzdWdFNEtW?=
 =?utf-8?B?akNEeTZmTHU0cjN2TXY4bHR5QWxsREh6R1FreDExYWs0eGRibGh2UFRUWWZw?=
 =?utf-8?B?M3ZOY0JNUTZTRXhBclp0WmRNSFpPRURaNzVlYnZpclg2YXdxTVJvM1VLYTRE?=
 =?utf-8?B?RnpTalRRdG84c0VWTTJNNDJpVW43WjIzSC9uVkRVNHFPYkJFbkVtNHVYa1dX?=
 =?utf-8?B?c1JEcGdzSnEzZHBxb0UrTXZHUnUzQlhnUDd1K2x4amdidU1WZUFhU2xvT0tv?=
 =?utf-8?B?NzBJdFUyMTZPMTZOYWlFNFYrYTg0b2h1MGtmUXZMNVdoZE5qbTBwbkxGWEJs?=
 =?utf-8?B?amE5d0xMak9nK1VVNDRPODAvYThEeFVCY1ltUE4wbFhKNE8zWUc1dFlQSlhs?=
 =?utf-8?B?bmZsWnpLdUZiUGVuR0c2S0hyMGpqYlFBVlNRZTV5Zy8vcmRkOU9uNVJwUkVX?=
 =?utf-8?B?NnQ4WmFyQ3lCdHBRYnpnMHpPZ3dvUmNKTGwyNWxOa0ExK2FXTDFpZHNTald3?=
 =?utf-8?B?Q1VsM1BFTE1IbEtlMTJ3L2dQYTFhdjNrdlRCdkQ2Q3RTczBrWFNsWjBOMTFW?=
 =?utf-8?B?bjVlSUdtQkE4aHhnSVBudkxsS21oaW5TMzFoTTUxOHJvOS9qZXZCK1lYNmdu?=
 =?utf-8?B?bXRVeVlQWnZpTWx0WnorRW53cDZaYmI3cEN5RmtiKzZhR2M2QnFqV1UvSnZU?=
 =?utf-8?Q?sUq3654YAXnS8T6oSH5AYECRK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	s0cuuY05YTvYFsbtMI59sVDWVSuMWovhfD6YkbwGCNtSGGqpX3D6PVdBAwzH7DFfwhBaaUHWVPG+WhnM9y+ID/rY+G4Cf7yH4nd7wpQFQ3yoIjV6Xvd8HUUBJDtTccUVS8Ddyojb7gSraoTHZISh+M0aRLJYKQIuuRhJNN0v1GowuHPYiJ0WNPTkq4K3IVOdudWtI46H8xeAG+CIDr/iMh3xCA3vS9Ddb6IMGeQ5n6K3GHTEFk2+pNISl8kAtvBvcMtoGFtzKqFN50q76WjcNtX9jKiuXByh7RQKXlh4NEUX17x7IGsf5L4X/FMc6y9pF8T5+6O6+wz6snGWE/Of3ekE1UJYBlVsZUjxV6KhBLvRXDRQ5WClIZ20kZswsBSgz0zZ1xXpLgdKScJ+wd1MdWSDd82IZV55it7SSz+3ukdHXVxG1VhlKKGW3Dms8nMrQb+duW2fouyFrncihQvwjq+5S9ubPOoQu7wOGuoWmMLnRkQGP8Kyp1YdJN8T1edntRvYXVCxS+zEdJW3e+sWFWzRQYIW70YkxMg+I70xLMuT/cejosbyCPC3XDgfdHwJzZ3x3Kq6iwNBWKIeNecN7KhsbGj0xuArkpOYAl4dgQc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3339b90b-93fc-4457-85e3-08dc973f7c49
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 06:56:50.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TujkgZWPAUQfc+XIjzL0Tz1r7w8hYNY5PCSeIRVRd6wIRU3qqLavqZd5iDJquKy0LKCPkPEDg0qDJVQhuwJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_02,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406280049
X-Proofpoint-ORIG-GUID: tObfnjlfn6kCtYvwoBQqLyGzdnoeQHbF
X-Proofpoint-GUID: tObfnjlfn6kCtYvwoBQqLyGzdnoeQHbF



On 6/27/2024 3:18 PM, Michael S. Tsirkin wrote:
> On Thu, Jun 27, 2024 at 10:14:49AM -0700, Si-Wei Liu wrote:
>>
>> On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
>>> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
>>>> On Tue, 25 Jun 2024 18:14:15 -0700
>>>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
>>>> [..]
>>>>>> I saw the need of this proposal slightly differently in the discussion with Heng in v4.
>>>>>> The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
>>>>>>
>>>>>> Flow is:
>>>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
>>>>>> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
>>>>>>
>>>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
>>>> I have certainly understood this differently. When
>>>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
>>>>
>>>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
>>>> to/MUST do the coalescing according to the parameters as described by
>>>> the virtio spec.
>>>>
>>>> Michael, Jason: Can you guys weigh in on this?
>>> I still don't understand why this change is needed.
>>> We have this text:
>>>
>>> 	The device may generate notifications more or less frequently than
>>> 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>>
>>> and
>>>
>>> 	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>> 	the device MAY generate notifications more or less frequently than specified.
>>>
>>> So with no spec changes, devices already can do what this patch says they can do -
>>> send notifications less frequently.
>> Right. If I still recall it correctly, the above text was to accommodate the
>> interaction with existing used buffer notification mechanism, F_EVENT_IDX or
>> whatnot.
>> When coalescing is in place and effective, interrupt delivery is a
>> collaborative consideration based on the coalescing parameters specified
>> *AND * event index / NO_INTERRUPT flag as well.
> No, not really.
>
> For that we have the next sentence:
>
> A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>
>
> And of course event index never makes you send interrupts
> more frequently.
Hmmm, this next sentence you reference above was indeed for the 
interaction between coalescing and used buffer suppression. Then what's 
the best-effort part was about, really? Round-up or round down the set 
value to the power of 2 to save space? How is it relevant to our 
discussion? I think even with rounding it shouldn't be too off? (as 
said, by best-effort v.s. give up)

-Siwei

>
>>> Re-reading this spec text, maybe the confusion is that it mentions set
>>> commands specifically? And it's also stuck in the middle where it's easy
>>> to miss.
>>>
>>> So it would seem that the following should be sufficient, and it looks
>>> like a small clarification we could just apply and include in the
>>> vote for the csd. What do you guys think?
>> The revised text below looks good to me.
>>
>> Thanks,
>> -Siwei
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> ----
>>>
>>>
>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>> index 76585b0..d6788df 100644
>>> --- a/device-types/net/description.tex
>>> +++ b/device-types/net/description.tex
>>> @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>                                            for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
>>>    \end{enumerate}
>>> -The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>> -
>>>    If coalescing parameters are being set, the device applies the last coalescing parameters set for a
>>>    virtqueue, regardless of the command used to set the parameters. Use the following command sequence
>>>    with two pairs of virtqueues as an example:
>>> @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>    \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
>>>    \end{itemize}
>>> +The device can generate notifications more or less frequently
>>> +than specified by the coalescing parameters.
>>> +
>>>    \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
>>>    The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
>>> @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>    Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
>>>    to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
>>> -The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>> +The behavior of the device in response to specific coalescing parameters is best-effort:
>>>    the device MAY generate notifications more or less frequently than specified.
>>>    A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>>>

