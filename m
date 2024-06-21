Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9274EB45
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 01:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718932880; cv=fail; b=KDPXdGcqodXSmkG6Df1KMGgyf4m863q4kWjNYXkq/FJnE6DZLoYXlTdgWYUXjG/24H1B9JlkFbh9rdnY/6G0dK/P9iJQKCUzlIKdOg8Cy4cqeCTSBYCzEooA3JO/RQCQh5Wh2xWfvB+K5Vq583QOjYuOU4IJModaFNqybOmF9Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718932880; c=relaxed/simple;
	bh=hZJFr4yu3NYiXHPXXokdrbrRjMNJO+rUbvOzJ2qSA4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ltWBweQOog/IhStILgWP451iPzDbuhzVowkxoQMoE7KcTvfxe+C+Q/fMdm95oMRN25TpYJ82vahyqVsoMii+q+EWD3pTNt/2LimvYppAFA4uyeBPIVG/n6VCdG0khffq72qx1kj+H1ZQzuV0Xu0bSGhSd9JjT3muLVUstaEzhO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BU/g5cYz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bwjV6/Yp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BU/g5cYz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bwjV6/Yp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KKtgLZ031159;
	Fri, 21 Jun 2024 01:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=kUj1H6NBFF9f/Syy7iLubyZ5xezulLfeMBf9r1pjkJQ=; b=
	BU/g5cYzEHzPmNqHkGm0T0v5EMm+L4zlLQGmpMIKJUgLdx529J1NaC53i0BwHqBW
	FJmG+Mz0y1u/TCZEtivEMCb5o3Ly/6FzgjQL07IKt+pY1ebDlrzqTh4qcsh1q54l
	4fCjS/yUmD6z17Yx0HziCp3xqDBkMGsks+2HfwTMgVSux16StG/20WnJJZsiGhm2
	NpoePoRqHJkPnwIobTO9HoQ4BxLclYutUeTwKra9y7iHtr5pRAUvnMhU+huQwHsa
	yAp//iVGMjgOn6BiI3oisVcpR9kh9S6cSQd775Sq8D/Xxr8qypRRmRQLvm9izpr2
	hqV1w6xLqb4E8EB6dXqR3Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkd0s5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 01:21:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45L0wN53019444;
	Fri, 21 Jun 2024 01:21:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn37v8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 01:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWskqscY23w819AnuOMREFmr/eM5zVp2LB1KMXTExclnKeRBwd/QlJRTBBnyarsvD9ECrj27XaEOIbR48Yz/Be33zKSQ26NRNVF+sL0rkh1OrIiJNj+oi5GYxtEuE87PNPZFOGLomEVerONhBK54uOJONy7u3aZg8n2/esM5JP5+cQVzGwJS5dqia22igXmsA3AQecJBTkpw4mZerXUkCJwesusR14gUkOCP7ZHZsD3/NAGyapTrKJ7goXPpkys2eSzu93QRV6ZhXBjuEh5GtLztOBjtopL4f8fFLmrgjsmubamgFyTMmSJ1jyiOgAX7FjLmMCVyaV46/T6d35YQyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUj1H6NBFF9f/Syy7iLubyZ5xezulLfeMBf9r1pjkJQ=;
 b=kYYgLqnh2G82cISI7LKII/VeQPzsTUdK3Qa+Q5axzF/BCdQxjAQAzaoG/bVJs87S6agIG31ZYmELFAQd36+yWLQ+W/lj2Dv6Smv5kob9d61sQaaxVU2LF/48wQ///SJKA0fM2t9CJTs7462+ZcDh702d57UgS3uOnO6BwkgLvD08YlWn9Jv9Jc5eHrLGscRjSw9JVvDpjZKwNMtDJqFiDrozysnhXZ1Uz9HNr+SqLlTBeb32nre90Ar5q8LEG6+oufra9hxnAZ7FCDCejuZhI809u2lPL9zkr4ZAHCPLrxrVgilKvU5S/SAKdOWJ9FfaYCt0OML0ueGE47DkXsKoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUj1H6NBFF9f/Syy7iLubyZ5xezulLfeMBf9r1pjkJQ=;
 b=bwjV6/YpXvdaaYjA4Q18EspTrtO9YLtBP7zPMMKBDGDY/4cpCzhoSPJ7iW0UGlnzkULSAtkgAOSUAHzsFn4K2MfYZGEhPq7YaGpbvTUqjdvHVom68ykQjdNGjWyTuPsj0AQ940+AbQ2USGTjILF+VQq9Jo/XI5GFEpEGsXsqgcE=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SA2PR10MB4410.namprd10.prod.outlook.com (2603:10b6:806:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 01:21:08 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 01:21:08 +0000
Message-ID: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
Date: Thu, 20 Jun 2024 18:21:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1718869209.8824844-6-hengqi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:c0::33) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA2PR10MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bce760-1df4-4cd7-b0da-08dc91906de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVpVUkhJYjBJcGhrWTZQMFNLK0kwR3lFYTFqMnd6TmFidnV0Rk5CWCt1QWlJ?=
 =?utf-8?B?QW9vU0huZWQ2Y2QwZHNyWkw5cTYvSFNId3hRbktnTkN5bzBoWkI1RWFjUnUr?=
 =?utf-8?B?Z2FlTE1wSDZnWlhvZ0s2Qy9PTlFsd2ZuRjRlTDZXQVBQV3NteEJoNkhJWlI4?=
 =?utf-8?B?LzlscTVsK3BqQTVNcXQ3SklUdVdlM05EL1kwK1JDRGhzeWNLREh5TjRiRGJ3?=
 =?utf-8?B?R1lpWG5PSlZoM1Nwc2U0TVYyQjFQRTQyeWpjTFJETFQzSVB6cHZBVndpLzRV?=
 =?utf-8?B?UlFjZXFIb0c1MGVJWW5mR1dUOXVVK1h4a0pUY3FtNjU3dmprcHZIUmNuK2Qr?=
 =?utf-8?B?Z3phYWZuckwwaUVINklBbkxoQVNCWmthNCtSUmJpTElOTnZNRnR5NnE5MExL?=
 =?utf-8?B?ZHc3QnFlcjJkdHNkL0JKMWdoMEdOcDRZTTFETDZNaFRzQzIyVm9JTkFBOVdu?=
 =?utf-8?B?a2Jva1pTdldDY05wR20wQytUeElidWhjdVU1YXNtaFZpcXF6V1pIZkNkcU9W?=
 =?utf-8?B?bEhpcHg3NFlVS3IrNWtPaWZmaVN5d3Yra3BhZjJQY20wYU9tOHIwdnY1ZTFF?=
 =?utf-8?B?a1BmYittV05zRU1hQythcmZhM0ZQRnBxd1dNTUM4dEtoNVB6QjNSTCtxWG9x?=
 =?utf-8?B?NTVxL1Nzd1Fuay92cktOU1dPUlhzMFFWcGFkSGhxZWhHQkwrUzdDMEtTbndr?=
 =?utf-8?B?eTZLMHNkeUpkL2ZRZEY2SWxiWnhXYW80VWhTcTg5WHJMd2ExcjVLT29HV1Q4?=
 =?utf-8?B?VU4rQXplSlYxckxFd0hhSXQyTXZvcjVUMDlnazF2RU12ZTdGeUNVMFlHQzds?=
 =?utf-8?B?RzFFcjRoNWRJd2xMYnBIMEdsRDV0NlA4SlFXUXZoa2FBRzNLSHF3UzF3Rmd6?=
 =?utf-8?B?MDJkNUFvcTQ0U0pVSmhIMEM0RFR5eFNWTXladHQ3bHpJZGM5RGxZeDR0UHNV?=
 =?utf-8?B?YmdqTUxldklKNkZUckswM2FjL21vUUc4K3R5TEZDN25Gcndqd3pzQUk2YTR3?=
 =?utf-8?B?dTM3NnlnOFg1R2dBUGhQS01oazRaVERPakxEdGIzSWY5S3Q1WTVZY3ZZbWdB?=
 =?utf-8?B?SjVTNDVxQ2xLdDdzdDFNd0Vxc05DL0ZFaGVzWXRJejdZam1jR3RDM3BVeG9F?=
 =?utf-8?B?amw4VjZsUHNnaU1pMjdJTFppdmJ5Sk5UMDU2VFc5aG44cGFZV0VaRnVEbXhw?=
 =?utf-8?B?VjZmM09hYWUyOU1ZbW1nRnpuV3RvbWpwTDhhcVo1MzlLYS9rVXNQMlltOEk4?=
 =?utf-8?B?NXkybTQ4ZmR1NGE1bkVsaEJNZFYwT0dZbEwzZVFxdk9JMWRZd2pBWC83aUwy?=
 =?utf-8?B?Mk1sY0FVMUc1VmQxVXRKeTJiMXdUbFlsOEhpSEZ1T1ZaUzR2RWsyMmFHMjBj?=
 =?utf-8?B?Y2pWN0hVTElRaTlua3VlTm92ZFdvZmNyWXhQY21FYy9wMU9Ga1NuckllWXND?=
 =?utf-8?B?cFhPamMxdGVQSS9SK0lJblVXZVZSaU54RVFyL2VJUWFQMFkxaDFaOStZb09Q?=
 =?utf-8?B?dVpYS05lY29NcEFvVUV4cGxSSzNVK0gvRDRrSVR3azkrM0dlUXpJNlk2MC9G?=
 =?utf-8?B?U1NRUnlzaHN3Q05JT1ZQOHoxeVdIMkVDWTJ2anMvcEdOdzErSC9aZE9sQWlP?=
 =?utf-8?B?MVBhWFZ3S21QTUlxYm0xWnpDdkRLbmxTY0pUc1NPSTV2dnkxVUpSOXVRT2x1?=
 =?utf-8?B?OE44R3NQZi9ENjJOZGdjUXcwb2R1Z3BTRXdYYndrRDZpZ2J1bHNyWWxGamZt?=
 =?utf-8?Q?N7+jiwuKc+9nNpsfUWIdrqgssWZnEhuZQrM5LaP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MC9DVHBtSXNCN3pRYzFjRFViZW4reWtUUVpoSXNteHpIeFF6amgydEtwTUZl?=
 =?utf-8?B?dHdKMWNQUWN6a0xEZjA4UEtlSFgvNThrYXFTWWoydS94STROQ0E2Y2hHWHA5?=
 =?utf-8?B?M2JVVlRvcXFUeTdCeUljOE5JbXgwOUR2UXhQcFZSZHlQZ2RZUHpUYmQrSmxI?=
 =?utf-8?B?T3hIQkh2SnZRNmtJeWVqRWM4UjA5WkJ4K2NVUWhWTUY0U2g0cFhhbTVQZnd5?=
 =?utf-8?B?WnAwN3JMeThoL0hxRE9UTzZKN0RJQUk1VjNOYXNsQkYrRzNpYUJyZE00UWNH?=
 =?utf-8?B?NmtkWXV5WlI4WCtUUlQ2ZllzRUM3eVUyNkJGK0ptUFRnZkFKWUxrODlQT293?=
 =?utf-8?B?QXR4TWtMMEk5QkxlMzdCb3FXQmtGVFZDb1JEMTBxN3E0L2JlSjRmNW5PVmI0?=
 =?utf-8?B?OFFvRlp6TjliL1g4M3llWDFoRUpsb1RUSm1ndS9mMjR2UjM5Tk4rdUFjaFAr?=
 =?utf-8?B?NTBOSFJuSjVGci9GaGhZWGVNMXQrU3VGMkdkeWhLUlZBQk1qd1dxUENEVU1V?=
 =?utf-8?B?d2VDY2Y1OE9jbWxDU2xreDViWEljZTV3bXBvdHN1NXg3blRGSW1qQmN3Tlha?=
 =?utf-8?B?UUlXMzlsV3Z0aXZJMjZvVVE2eVI5VG9KRDdoSVJkTTFkbG1DdFZmWU5SQTVv?=
 =?utf-8?B?aW9NblJRNm5yUE5uc3VNUWdJSkFxbnVLK1RuYjJ3Z2Y1Ni9Id2UwcWtWbTl5?=
 =?utf-8?B?c3g1NGhiLzRwVGhoN3lxL0NxaFBqVGI1eEhxUkN2TDlyY3RPZlhhNjV1aHps?=
 =?utf-8?B?dnE4SGlFV1U2R09pMFhGamphREdGb1lKODFBQmcwSVVsTzVUUWs5YzQzQ2lx?=
 =?utf-8?B?N2czbVBzU0oyKytDZTY5YldRWU1mb3pmQlJSU0ZHK2QyYjBlenBmMlVRUkRK?=
 =?utf-8?B?cUhNYnhiWmpmTlpyWlZRbUlnaFkraHJXOVRlU05BQnRiditGbnkyZC9WRTRV?=
 =?utf-8?B?SWdqN2tObmZLMXpBaDFlMFlucjZvaWlDelhRdHh4d1dqY2dnclFwQzR5TGt5?=
 =?utf-8?B?RjZiOVNrZ3lSczRKdG0xajRzY2VQM3ZMam9tQ2ZUcEZBSnBDZHlMT3lqWUV3?=
 =?utf-8?B?eEx1SWpVeG1heTJWRXNyV3lua014TzM1SnZNb1RMYkpmVE9MRGJzRjVYRm9W?=
 =?utf-8?B?c0dFMHVjWXR3K3I5TXQ5ejVObmxFdFF1QW5HUEVqaWxVRkorYkU5N0NqZUs4?=
 =?utf-8?B?L2hKUmxLWkFmWlVQbWpiVklxYmdJNlFBV2p4Q3ZwNTJIbS9GRHJteTFKdXFn?=
 =?utf-8?B?L0ZuMExQeVRKUjhVVElIN0RQem8rbXNqSU1rb3hKNDcyazBMVXd4RWFuemRT?=
 =?utf-8?B?aDBuajB6a21QMk1PKzdMM2h2NHF2RHZaWUYyRnEvVlFTU3JJQldmRmtwRGVQ?=
 =?utf-8?B?NWlJcTZhdG5LbUU2aUVvSHV1M1BDMVJIWUlzb2N5cnpXRzVoa1ppbFh6dHBi?=
 =?utf-8?B?bWFadE5CcGxGRSszYU5QR0RKODUvOWNaUnE3LzRaZzZicWU3SjJRc2FUalpY?=
 =?utf-8?B?bjNERzhqbGNVZnZpcE9UYWU1M1ZySkhXMDZEZm9pQTE5Sm50b1g1L1lQcWxS?=
 =?utf-8?B?UlpjVEpNL0d6TENjbS9QVXpWa0JsNzRSQmIxczhzcXpKMklPdFF4ZEhwTVIx?=
 =?utf-8?B?eENYQ1BIaGs5aWlrQStIV2pxMTIwdVQxWU5TSnNjTTR0NCtPVFBpQVpZUkN0?=
 =?utf-8?B?R0VhZklUTTZvWnpNemkyUU1Ba2pjVlRObkk5cmY3alI0d0EySno5bTlGdi9j?=
 =?utf-8?B?OWdsM0VIMkhhbHVVQlFVSWwyMnFyTEtwRk5oMjF3dEhCWVZBME10T2NZSzlI?=
 =?utf-8?B?S1FVcjFSVmhjaEZ0UzRrZEhkREJjQkgvcHRxaUdpM21oaTExYkF1Mi9EY283?=
 =?utf-8?B?d3EwVDdvNEdoRDBtc2VhL3JCUFlWRFU1dVZjUWxRRFNmS0JWYTZtVjFyOWcy?=
 =?utf-8?B?QWVYOWNDTGRZQThYaG92UHJnUzl0d1NDazYxZEpSTk5xb284VUxHYXVqQU4x?=
 =?utf-8?B?V2YzQUFyMmJ6YWtJMXF6QzRGZHgxTmwwRW1VcmFLTWZBbUo1VTNOSGZvaWVr?=
 =?utf-8?B?SllyTXVJMmdzdmFCSGxwM0NzMGE3cTloRDh4TXdVdmZ2VGtjTlRIZ0JPNVRZ?=
 =?utf-8?Q?HjU4GAxk++yDzXQaZZvRJxvdA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	gGEN7b6rpLyqygo/eawHfSFd4J8CirP0r0+BB4uylst+t6CjPhf1x0YaVnMLtgWT2YGX/N2VTxeDZedsCg6Gxp19vDO1GpEqTpnlz4aY44tfV/ygbQqcV9R4Ad5rCEtiGtkRMk/06/9IvlxsarQcF77FD8bM8O/ozCkjRwyh+VRtlUj3Qqp9jaAoghew20T1ENBq7spY5vfxhbZNeVAXg6ljvpbOtq7gM7immaOVEIssqjF+b0jHBVGq1nCVqbkEEk41O3HwygBVvADAn11xXeLwO7/lmyG3M/Kms7owuZFM5y+qiHP724fKrB4ZnCq29XuxdWtdOvyX8pig8WUq/R/cWTpsBQDr+7x88aKMNvnzwoLhxbSOM3ASKWSgsZSlEhX7S1AT9UXDOqSbfHtOwHc0bvItuClBJWQurkMr228N50O8bKS7SqApuzkjAM2DwW01yamQUZs22YMj0mR3mc+Nt52b2kvNC4W4N1gDAN06z94vXaNUx7PnPNkEB2SGea86MiY8/Kgqw0ImFzZM8QvmHPQ3uEBMlYvFB3Q1uqK0Dvul5Yf4OMZBYFIXCn/ilp0b+gdt3DHgLMZJqDyldw9SMMtzkXVoT4T817E/lcc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bce760-1df4-4cd7-b0da-08dc91906de9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 01:21:08.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWYRATX5/LyRpgRbbKhAmh9xTuxOndvXAcyIQyTHb5PMfI1qYea/Z2iPTfUegM3ON0SHR6PP7B4D6oSPFgZSKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4410
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406210008
X-Proofpoint-GUID: OyoyrvYFmOmUR1F897esTrS0on73CXQG
X-Proofpoint-ORIG-GUID: OyoyrvYFmOmUR1F897esTrS0on73CXQG



On 6/20/2024 12:40 AM, Heng Qi wrote:
> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
>>
>> On 6/16/2024 7:27 PM, Heng Qi wrote:
>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
>>>>>> How we can we make progress with
>>>>>> the realease but sure we don't make backwards compat a pain?
>>>>>>
>>>>>> Ideas?
>>>>>>
>>>>> There is no functional break with this relaxation.
>>>>> Device set some non-zero defaults and driver didn't modify them....
>>>>> Anything broken? Unlikely.
>> Generally it's inappropriate to leave this decision making to the device
>> for what would be the best / most performant default config, as the
>> device is generally considered agnostic to the guest load...
> Instead, the performance of the virtual machine and the driver depends heavily
> on how the device is implemented, just as we have proposed various ways to
> offload the data queue in the device to the hardware. The reason why most
> devices use software to simulate ctrlq instead of using hardware offload is
> that the driver has no requirements for the performance of ctrlq before, that is,
> the device implementation is responsible for and meets the driver's performance
> requirements.
I am not sure I follow the arguments of ctrlq being s/w or h/w, I 
thought that it was for the debate why we need coalescing on hardware 
offload device in the first place, instead of reusing event index or 
similar s/w based notification suppression. I don't doubt the value of 
coalescing, but how's it relevant to the default value disposition?  
Generally the default config disposition is not considered to be part of 
device implementation, especially when it comes to the situation where 
device can't easily figure out the specific workload to occur in the 
guest, and there's no perfect single default value that could meet every 
single performance metric across the board. This is a typical tuning 
knob left up to the user to adjust, why the device or driver needs to 
set or load the initial value? The driver just needs to start with 
certain value, be it 0 or non-zero, which guest user can override at any 
point of time, depending on his/her need, and that's it! I guess I still 
don't understand your user case here, why device / driver default is of 
such importance.

>> Unless the
>> device is specially hard wired to some fixed guest setup that users
>> couldn't change, it doesn't seem logical that the device could derive
>> the best or most performant config on driver's behalf. What if the guest
>> wants best latency for its load but the device just blindlessly guess
>> the guest might prefer throughput friendly that it miserably uses
>> latency impacting non-zero default?
> The device does not want to guess and cannot guess. This patch does not force
> the device to choose a non-zero value, but relaxes it to allow the device to
> choose 0 or non-zero, which is very friendly to virtual machines with different
> performance requirements, right?
I don't understand the friendly part - do you imply your VM users are on 
kinda fixed wired setup that they cannot change these coalescing 
parameters after driver is loaded? Can the owner of the VM in control 
apply certain initial config for the coalescing parameters to the VM 
image? Or is it the problem of the guest driver that doesn't yet expose 
coalescing parameters to the end user? Otherwise I would think that 
guest user should be able to set parameters accordingly that would best 
fit the specific performance requirement of their own. How the device 
could even help here? I don't feel there's a lot of value to grant the 
device or host admin the flexibility to policy the *best* config on 
guest user's behalf, to be honest. And you seem to admit the fact that 
the default doesn't really matter, be it 0 or non-zero.

>
>> Could this device side change for
>> the default config regress boot time performance (which may need best
>> latency over throughput)?
> Don't make these assumptions, what if the driver needs better throughput?
There's a misconception here: what we think that driver may need in 
terms on performance does actually reflect what guest user would like to 
have. Driver cannot read guest user's mind to make the decision, either.

In history there was drastic change in the Linux virtio-net driver that 
ever changed the default disposition for XPS (and RPS as well) from 
throughput and long-lived connection oriented to concurrency and 
short-lived oriented, which regressed a lot of existing setups that 
expects sustained throughput and packet rate after kernel upgrade. 
Although the occurrence of such drastic change for default disposition 
is not so welcome (that is one of the reasons why I valued consistent 
initial value and back compatible  behavior), I don't see people yelling 
at virtio spec for less flexibility of offering the default disposition, 
given that the guest user can override the config any time with their 
own tooling or script, there's no problem at all for them to just set 
the corresponding config back explicitly to what it was before.

>
>>>>> And device/driver has better performance, is that a problem? Unlikely.
>>>>>
>> Even for rare case with a hard wired setup, the way to tackle the very
>> problem using device's default is still quite questionable. Usually the
>> mgmt software or network config utility should be equipped with some
>> default value if need be. And we know the guest has the best position to
>> impose the best / most performant config for its own load. What is the
>> issue or use case that this initial config couldn't be applied by the
>> guest mgmt software ahead but has to resort to the device to load some
>> default (which is odd and irrelevant to any guest load), before the
>> interface is brought up for operation i.e. performing I/O?
> Use cases are everywhere, Alibaba Cloud, MLX and all other modern network cards
> have a default value that is not 0.
You seems to be referencing your own setup basically, and the question 
is still left answered - why the initial config can't be done through 
the mgmt software or network config utility within the guest?

> (0 is actually a kind of default value)
>
>>> Sorry, my vacation just ended.
>>>
>>>> Yes, it is possible. Driver can cache values it sets
>>>> and never query device with get.
>>> Don't we already have a lot of behaviors to drive queries from devices?
>>> RSS context, device stats.
>>>
>>>> Before anything is set, driver will report incorrect values.
>>> Devices that are widely supported and supported by good practices should have
>>> any initialization value. Just reporting 0 is incorrect value. Although the
>>> spec now says so.
>> I don't have an aligned view here, sorry. As I recall having 0 as the
>> default is just to keep device started in a state where coalescing is
>> disabled, so it's backward compatible and consistent with a
>> non-coalescing supporting driver - such that it won't yield surprising
>> effect (for e.g. regressed latency) inadvertently after user's getting
>> driver software upgraded. Unlike the other virtio-net features that
>> could 100% improve performance in all aspect, this coalescing feature is
>> more of a performance tuning knob that may improve performance metrics
>> (such as cpu usage or throughput) of one dimension while demoting the
>> others (such as latency, jitter or connection rate) from the equation.
>> That said, there's not a single and fixed set of default config that
>> device could supply which is able to satisfy all kind of guest load.
>> Rather than rely on the device to offer a matching default for driver
>> (which I think it's technically wrong), I'd lean to having guest
>> software or network utility to apply the initial config for the guest,
>> where they should have best knowledge for the specific guest workload
>> than what device could do.
> Before this feature, a good device implementation should also support coalescing
> (of course we don't necessarily assume it has coalescing).
Again, I don't doubt the value of supporting coalescing.

>   In addition, virtual
> machines that tend to favor latency and throughput exist. If the device supported
> by the manufacturer needs to provide a low-latency virtual machine, please
> continue to keep the default value of 0.
No, that's not what I was asking. There's no such requirement for any 
vendor to provide a low-latency or high throughput VM. The more general 
use case is - the setup for real world workload might just be too 
complex that end users would prefer low-latency on some virtual NIC or 
even some specific queues, while the other queues of a virtual NIC, or 
reset virtual NIC might have very different dispositions. Due to the 
needs and dynamics of workload scaling up & down, they might have more 
or less queues or virtual NICs to configure, so these disposition would 
need to be readjusted at any point of time, for which there's no easy 
way for device to adapt to easily. The guest user should have best 
knowledge for the specific guest workload and setup than what device 
could/should offer.

>
>>>> What will break as a result? Hard to predict.
>>>>
>>>>
>>>> Given the patch is big, I am inclined to say it just should use
>>>> a feature bit.
>>> This doesn't seem to break anything in my opinion, we just told the device that
>>> now you can set more values.
>> Another thing this could break is live migration between devices with
>> varied default. How do you make sure the guest doesn't rely on some
>> default from the source device, while on the destination it just doesn't
>> get the same default coalescingjjj value? To get rid of this side effect
>> the guest would still need to apply the initial config for its own,
>> anyway... Which eventually would render this proposal with arbitrary
>> default rather pointless.
> I don't quite understand why this would affect hot migration, the values
> would be migrated over.
Then I don't see this has been discussed (wouldn't the initial value be 
part of virtio device state to migrate over?) in the thread or described 
in the proposed text. And your proposed per-queue coalescing parameters 
(default plus current value) would have to be described too as part of 
virtio-net device state, so that people don't misunderstand your proposal.

Thanks,
-Siwei

> Thanks.
>
>>
>> Thanks,
>> -Siwei
>>> Using new feature bits does not seem necessary.
>>>
>>> Thanks.
>>>
>>>> -- 
>>>> MST
>>>>

