Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E571C6A1
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719509247; cv=fail; b=WGN0k3SKFnfbX5bdPuzfpSa5axzx8asiAswEt/pO6LMKRPa4fOJapfXicND3rpBGD49jrPGoajP6QeYi3/dnXwhj6InuJiTOwe54PUn2Mca5uBjdTwKimOMMOnJWyCT1WZ1Lx1HmrhA9Yf7lG82K1y6z09mWG1N0nqrRjWt20Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719509247; c=relaxed/simple;
	bh=vCZZZ/IvV4Gz/i67OlXmOAI9TLX3FS3g6k0kktWdOos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gvyn+CKPodD978oz/Lsa3qXmQYbyUr8CBHxnCD7gfymHclG35CGxl/h8B7jrl7G+xsMZk4GNO/Lpbw2s43ggsAttyDzdlBEMRinP5o8hd2JA90rXRZcxlkATkb4xxLtNwc/FNEh7GOfVVTe0FAvINeifdZ+3jtR73zV+weaAtbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n9mfvtXi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AI7WMm4g; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n9mfvtXi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AI7WMm4g"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RFtTTC024703;
	Thu, 27 Jun 2024 17:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=SKR4yL0dSsaqoej4BmFFMy/K9h3zyqCtVFB9Dj/Ynh0=; b=
	n9mfvtXiAdlpn+wnwLQ3E50FVg9TpgdoVOqDK7mrl+9twir/uKz+Ia4HfOAcuGbe
	nav4759zeHYz2dEAfzpQBadcYL/cmoRztJG67tRAMNqfo4AkuXhSyVGI2zpAPG6k
	Cd5yI06kpBi3A7akcdtRe3a/0jHwRR4ZXoEC0S9vuxQ4vx4OD9z0yN3jeNBVnegi
	m2LkyLxakl1n3etnELuYs4M4L27wlgqAAvtN/LyujUTPb3VJiATyAVnP45EocAJY
	O9tTWQkByGvcQmPpnWh4hja4x9Vl8yIoqeLj7OZOYdUgSFx8V+qQNZ0spAqGnqLK
	0v//SoDENvoJ6moMtCpgZQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttna8hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:27:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45RH5lBu037105;
	Thu, 27 Jun 2024 17:27:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2bagt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxX+3GqQHX/+LEBzdnbUlNeoeJ51eAXVHNd33bTf06hOzu+EfiO10ZMJOe2eUtsqnJezJQ+RdMpH58U6HHYKpOMZGtkpVbYpyh2fUu/vSmPRqrwdtsXouVIMoH5zNPrVzma9xaBaWqv0OTE4/F8hIopITLN3nDUA8r6U8NeAH7QMKJMp6ZqwKEibH7SChfhgyyiioc+FvXb+saXiLrXjFUd83e7cub+ghF+OusEwQDZ4AOulZGogSkumzQQFDNpvdQ9hTREiRWoyxmceJY7ezNLFi9X8VmX0ZvKAzR6EHD3ti5MOUObDBu3S/7hWJPVbiUF4h8qY0IIEyiDhpdvI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKR4yL0dSsaqoej4BmFFMy/K9h3zyqCtVFB9Dj/Ynh0=;
 b=Q3qDG/C/Eu+l8189WIDcNRKvtAsLL5qi2UYAWcuOSf3V22o4elLbsr8IJzgLQZzo/Ympib4Ld4bUrVxZHRVCSMUMHVxTKAYp5w505tNI3riABrALLzKkNYonIoYyJ8eIT38TPdcUwb9UFIp9Ir0lj46vQ7LXsM1vYIexf+HJXztxxcTbaKEbbyj7+YxelW6xvC+9QgVicL0d1ZpuMrK7FRVeJBJIdRpwZDQQsdAmNREda40KGwi8MJtGgv3X/dVwCAWHiZ/hEfp/0LuOC7Xs2RFRfiinaQc1QZ+3GYQXkK4c+fiu63QI/bH7Mf6RwlblamfmzKnnlMAlOHeaLY7ckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKR4yL0dSsaqoej4BmFFMy/K9h3zyqCtVFB9Dj/Ynh0=;
 b=AI7WMm4ggFkYWaz4r44ZPxg4HfB4dfa4mcr4QoARogRVs0V9pWK4us+xGP+GMNE1MlAr+lRDgB+BhW2nNvYprUZARbYy1DGWLVnm8uPrxXmvIZUqQyubSs9NvBWXQWNncUe6HXG7adgslCSFvQUubaNoWSdqdg0duXeWOYCbsXM=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 17:27:12 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 17:27:12 +0000
Message-ID: <5b1e78a6-122f-4375-9e2b-4b3449553358@oracle.com>
Date: Thu, 27 Jun 2024 10:27:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Heng Qi <hengqi@linux.alibaba.com>,
        Cornelia Huck <cohuck@redhat.com>,
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
 <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240627084719-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240627084719-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|PH7PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: ca050fec-21c1-46b7-2786-08dc96ce6145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TENqSUNoQUJCU08vOGRLS0tpQ1FlR2l0V2xJeUtGbmgzOVRoQitqK3pqTXFZ?=
 =?utf-8?B?aTVYTmszUzU2MHl4anBQM2JkR0RWaWYvMDVwTGYvWEs4YkJ6dERhbEg4K1k3?=
 =?utf-8?B?RXdUSGhaSFhVUXdDa1FyMm1nWEMwM3JJQWlRWS9XL1FrcjAyNENFVkxjVS9F?=
 =?utf-8?B?bjY5YzkveU4wZTAvY3Q2ZE5Fb3IwZkFlZ0J6SVdhQ1lCcy9tUU5TeTJHSzdG?=
 =?utf-8?B?OWh2MVNqbEMya3RQMHJKd3dKUDU3azBMZEo4d2dndVV5cWpidU5aNTRZSnNS?=
 =?utf-8?B?YTl1NGdHWVdVYUZseGJzVVNTeCtlNHJTMEJtbkJKek5nZHk3WXVxZjVkVVdl?=
 =?utf-8?B?c2hib0NmaWY0V3g1U2taRjRxSkk3SVNyTUFKMVZteUtqNllCZVFwT2ZVdk40?=
 =?utf-8?B?S3cxR3RYWVpjTktpT2haRWZWRG5mZkJyWGhoN09mNU9KdlBId2dZWFNRbDBR?=
 =?utf-8?B?V0xmYlQ2RDRBTVMrOXp1bjlmbUlOQUdYZ0JQUEhOcGJFUzJoL1JDaVNEOVpp?=
 =?utf-8?B?OGFDTXhhdEF2MEQxeEhKeGRyYStnclZZWTNQVklBWUdsTTFmNWNGUkpHcm1m?=
 =?utf-8?B?RHpSbXVmZ09vV240b3A5MXc0aGV3WmY0UjlmV3FFeHNja1VoeXZFa3BKbnpY?=
 =?utf-8?B?K1NpTXIyN3JTTVBKcERSSU8xNmdYUE54MmZZUlNBTnc1Y0ExeG0xZ2hXNmd6?=
 =?utf-8?B?djRPcWhaczhOQURuZGlDbEs5YTdQbDZOZzFObm1BYVg2QXd4Mll0OHhwUXNq?=
 =?utf-8?B?RXp2S0tKaUtCVEZxOWNYRkRJZkpLb1ltU0ZMUWp1RFd0cjNEU3dPL1JCNFZj?=
 =?utf-8?B?TUMxRkxiQmdscUJUVVFYQm1jdGRlRGpHYjlDeVhod3lQRDcrS0JieVNobTNi?=
 =?utf-8?B?T09JbVNsUDRvNFlkeEVmZ3VUUGZQVXRhNFFmVE1rdjAxRkM2ZG5FeHh5MlE0?=
 =?utf-8?B?WngvT2lLTEZ5RHFWbTRRZ0ZSNHdEMzg5WmlWc09WWVd3cjB1eDhPaVUyNmpF?=
 =?utf-8?B?eExxOS9DMUd3ODkyNUQxbGI0V21tTkRkOS8zY2VpcHYwbnB1U083RjZFbU9X?=
 =?utf-8?B?WmF5ZWpCMjdUeHM5dU1IY3BseG1HbHN6ZW55UHdwNnZpbjdrK09qQmREaC9H?=
 =?utf-8?B?VEdNZEsxQ3RIdjYwbk51ZW9yUmRUS1l4ZExtQytJVzRUNlZjR2M1bmxTcDFa?=
 =?utf-8?B?UUh1SWpHSnEwSVFVQ2kyaTBhaTNnSDJHTkRxd2Z2TEovQnJRUmpINkNkVk0v?=
 =?utf-8?B?THYyakowMWErMmhTd3d1bi9yUFpwQnd4K0ovbjFHMFVoUUhOSTE4bU9jNHR5?=
 =?utf-8?B?ejhYTk9Nall2ckdsTldocGtPanJpcEVoaktPQkRhM05FMzJUc1ZIZjM1cWZy?=
 =?utf-8?B?TVplcENVMjFJUndpaDQwbHJ1WnUrRXg5U05RVUJENG4zYjZ2Q3BwMDYwdDMx?=
 =?utf-8?B?NnBleG1lemkxejVyd3owVWNFdWVMRVJMV3VGTXVwK242cTFxcGs5Q3pibHpY?=
 =?utf-8?B?M0tvc0E5SFBMekN3Z0VyZmtLbjgvSmFvSUpjTThBd2llUkdPVGZMNDZZaXl2?=
 =?utf-8?B?dUx0R1Y3MzcxWG41L1NTeXY2Qm5Hbm1ZVXZubFd1NnZmYUViSU9VeTFCdUNa?=
 =?utf-8?B?ZFljRXBNZENSZ0ltd2ZVNHZXYmJXYkQxU2lubDdFOTcxK3Z1WWdjRld4azNa?=
 =?utf-8?B?NlBGcHMvV1haQkZNNzE2bjFYUmVqRElwZk1ZZ2R3VjA1OGlhclZSRERzWVBz?=
 =?utf-8?B?dWx1UUlwRkhFZFJXVFd0clpZSURoZk52aGFjQ2VmRFVkK01VK3JwcitMNGJn?=
 =?utf-8?B?eUwydk5aaWNDVzBQbGJmQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SElKSW9BOTEwUlpnQ3dUMy9xV0dLbkFWcVc2b3Bhc1lsWkZWMzF6MVQwOW5C?=
 =?utf-8?B?RGxHRzQydXU5cWZZZXAvSDl0SldaTklGZC91UkxpYkNBYno3b1J4cURvTC9s?=
 =?utf-8?B?a0hHSnhWYXFMM0RscGpBcDNsU2c1REx6QUlOZUJycFd4ZGNySVFkaWRvMXpP?=
 =?utf-8?B?MFc0VXp0dVRWYjJhL3BWS2pET3RVbWVhZzJkbVRTL2VBLzRSM0gzOEFyczRF?=
 =?utf-8?B?b2ZKWVVTREVQSlRPbkwzN09mSkZNS1JjaGlVc3Avdnc1UTlRME0weVZpbGpW?=
 =?utf-8?B?bkV4TnpjeGxTSE1QYmViS3dWOWtwbk5nVGhEQ3o4aUZDd1NFaUM4V1JTR1FK?=
 =?utf-8?B?RW15emdNYXErcHl2RXNCUUUwaTB3QW1EWnVaV2R2SXJBSXNNYnltQ201Wlg0?=
 =?utf-8?B?U1hSZGxzTXpycFRxbnF5enpqcnlZK3pNb1kvUUxpK3ltL1dzOTFTdE4zWmZD?=
 =?utf-8?B?aC81WDZnMXJFQ2RXSGcxWHZxOFppd0oyWjRzcGlVeG13dlgvakNESlczVnlt?=
 =?utf-8?B?cmNnelU1c0gyUHpsb3RjeG5EVDZsd1BXWERWVEo5VjF1eDBPODlIYjlXcVVL?=
 =?utf-8?B?SFdpbEpxbkJKSTlUbWl0aUIwTFAxMXdVdHFUV3JrREg4ZmZScFp5WTZKSkVJ?=
 =?utf-8?B?aVdJc1UzNlBWclRKaFpWeTJyUkZSRDZyd1RGc0J3cUhmbDFZcExoeWx3dnpx?=
 =?utf-8?B?Snl0VkQ5TWlTRkpRYy9qbk9pS3AxMDgvcHcyWUkzQ3p1RVFRYjJ6VTNOOXAz?=
 =?utf-8?B?WkdXVyt6anNCVTUxUDB2MXQ2MEVZeHNDc0o2NjczUlhud2MrZjR4aDFHUUU3?=
 =?utf-8?B?cnkzUnFoTkxHcUI0NU5ya2RRbDlSL1c3S2FjMlhKNUhxWGRuTjQ4SDhtTVhu?=
 =?utf-8?B?MGxiN2pEaFRONHNPRTRsSisvV1NPam1CMk5vOFlSMW05cDFGZGtGUFVsRXEy?=
 =?utf-8?B?Q1JyNzRsOVA4by9yeWUwd0dhb1AxM21aaFQ1Y09BUTlxN2V6YzZwTllGdnNR?=
 =?utf-8?B?SnY4TWN2YkRmNmRkL0h3ZGMweEduTWJlTDlwcWJKMHJlT3NDdEx1VURxTW93?=
 =?utf-8?B?UEtEN3d3Mk1vRkoyQ21CZ2dhZHR0d0NIWEpPQ2N3dWR2KzZOUmJJeU02UXZi?=
 =?utf-8?B?QVJSY0h4TjBNRkd2Z2lpWUxHVURJUEYxRFF1RXpkd1pFQTNnK0VBNGpGUUNs?=
 =?utf-8?B?WFd3bXZmb0ZHb1B2TFBBYW8vQjlQQXFpckVITTE4QWgxNUU0K29lSzZRTzhq?=
 =?utf-8?B?WUV5WE1qRXBMWUQ4am4xWGZyWUY5R3lHb0JWSGtZbW8yYndmbVhGdkxhSFYy?=
 =?utf-8?B?eStiUXROWTNRWTlhZ3NncTU1TUk3SEdCdmUxeVlNTXRoWHBySHdjOU5vaEdp?=
 =?utf-8?B?ZmtiODZQeTVDSGZOT2tPcURoTXplS0pTRFVncnJoY2lhRk1VMEltdVNmWVpI?=
 =?utf-8?B?NzMwSTlmMmJTL1hjOE5Fd1VRbjRGSGdwVUtGWVR3eEFZWkh2K25BelBSS21a?=
 =?utf-8?B?cGpaa0hLQ2dXOHdFVFowNnBZbjhra2tSdUhkbzVXYzNPdUtlY0tmeVBGY2lu?=
 =?utf-8?B?VCtTYUIrY3h1VXFGQVpMNUxHUG9qbGhnNWVlMmwwOU9qVVRDOWVGTkU2K0JH?=
 =?utf-8?B?ZXZwZVlIamtXdm5DeTJSUFlnWW8xWE0zM2RnVjBOWmRvd05TZkQyUWF3cXBl?=
 =?utf-8?B?TC8zUFZGYmZ6cVArTDZBa2w4VG5qSmFXbHovTnpUZC9LVGtlazBQRkdrRS9H?=
 =?utf-8?B?M3FKQ1EraTdLN0sxZHRhZ3d1cGtvL0VSMHRoTllXOTExQzRIcUhYMG9UZEt4?=
 =?utf-8?B?ckV6Nm4yeW1ZdFhDQXJEWFdhc3ppRlRjK3E0cmx3cDExUXc4Y1UwVTJNSnBU?=
 =?utf-8?B?bndBZ0ZkMzJJNTJMNUVpZE1mOEdXdjFCWHlsQmdhbndESWVpcDZhUi9xMFdH?=
 =?utf-8?B?ZVMyU2szNEdOUENVNHNZOGRXM2V2MjVkc0NmRk5oMkdUdmt4cUR6dXZKa3R0?=
 =?utf-8?B?cEQwcE40R0tSaEpRZmJPeHNWNzE3WHdUbnk3UTh3TStUbDVnVVVldHpMMThS?=
 =?utf-8?B?MjlMSlZuLzBVUVZhTDBKMHprRzB6RjBGYkxqbUJ6RUdLbUd1WVRZRlFhYmFa?=
 =?utf-8?Q?35L73jXE0NjxFE7DBiY1XDiIi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AWw4VM8nZut6vIuOZrfQj64p1z5bS0KO/Zu7/nWukxKTBqP2gQD6dGND64i9lABoD0+4wM81IwFvZRsvddGxtNOPFiT1Ffd09VqolfO9n2ACq1i9rYpgtN5clFG9742IZkm7t1b1DWYRxcgkiZOtmrtAbD6AjYgxAEicT9GORenuHVfrhNHYIWL74dcrzWUEpUoFBC4Fx8qwIBtUtXnJdxRPV9fEKgjPeX9oqU0Z6m/Ziwq0glx2q9TBZEfVj7vrh5P1SPUWbEDrnXLitkg8NmuMEDEjifeax851aXQla06DH8oHV85aZi7z7acHvIM5Xlo9bl1EyjNpXG6XwQ7hYEYGmVTiKldxWYjCe9oZwtLij6oWUXrvpN/g4A+kvOLpeVGYn7jb703uFaG/XrfhuAlj9yTzpyROFVYCj7TfdaTztWV74mq21aH0+9tqdDxaDXx0npcx+3Qi+OmnYzfp1vqxkI0YG5yqGIGq/kFydoqrrbyVT1/FS0GJTI5Zkyqo3AuIVvmMR50CM7EMxRQbammOf6t0Df6Zo/esk0+4If+W0Nnc5PWlJO3ofntFjOH6BEq5QxeKRlDin5T9ZV0WIXLH676TZTCTkvV/DY/Fq/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca050fec-21c1-46b7-2786-08dc96ce6145
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:27:12.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OaECSnD6PPaa5Uk51hlDihcRLBsm3T0Y+GDtSDSq/bVtwG3NhqkVMQJMkue04PgHJTAEfn0Jgyya7UkZYGH2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270132
X-Proofpoint-GUID: S4eLxsQdc-6TB_YySW5PL5uDLyZq32TL
X-Proofpoint-ORIG-GUID: S4eLxsQdc-6TB_YySW5PL5uDLyZq32TL



On 6/27/2024 5:52 AM, Michael S. Tsirkin wrote:
> On Thu, Jun 27, 2024 at 12:45:49PM +0000, Parav Pandit wrote:
>> Hi Michael,
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Thursday, June 27, 2024 6:05 PM
>>>
>>> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
>>>> On Tue, 25 Jun 2024 18:14:15 -0700
>>>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
>>>> [..]
>>>>>> I saw the need of this proposal slightly differently in the discussion with
>>> Heng in v4.
>>>>>> The way I understood is, proposed relaxation enables below Linux driver
>>> flow to work as equally as without device offering
>>> VIRTIO_NET_F_VQ_NOTF_COAL.
>>>>>> Flow is:
>>>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL 2. The
>>>>>> virtio-net driver negotiated VIRTNET_FEATURES that has
>>>>>> VIRTIO_NET_F_VQ_NOTF_COAL
>>>>>>
>>>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not
>>> applying any coalescing on the VQ, in a good hope that driver will perform VQ
>>> notification coalescing.
>>>> I have certainly understood this differently. When
>>>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not
>>> supposed/allowed to do any interrupt coalescing (notification suppression
>>> may still apply).
>>>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
>>>> to/MUST do the coalescing according to the parameters as described by
>>>> the virtio spec.
>>>>
>>>> Michael, Jason: Can you guys weigh in on this?
>>> I still don't understand why this change is needed.
>>> We have this text:
>>>
>>> 	The device may generate notifications more or less frequently than
>>> 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL
>>> class.
>>>
>>> and
>>>
>>> 	The behavior of the device in response to set commands of the
>>> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>> 	the device MAY generate notifications more or less frequently than
>>> specified.
>>>
>>> So with no spec changes, devices already can do what this patch says they can
>>> do - send notifications less frequently.
>>>
>>> Re-reading this spec text, maybe the confusion is that it mentions set
>>> commands specifically? And it's also stuck in the middle where it's easy to
>>> miss.
>>>
>>> So it would seem that the following should be sufficient, and it looks like a
>>> small clarification we could just apply and include in the vote for the csd. What
>>> do you guys think?
>>>
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> ----
>>>
>>>
>>> diff --git a/device-types/net/description.tex b/device-
>>> types/net/description.tex
>>> index 76585b0..d6788df 100644
>>> --- a/device-types/net/description.tex
>>> +++ b/device-types/net/description.tex
>>> @@ -1711,8 +1711,6 @@ \subsubsection{Control
>>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>                                           for an enabled transmit/receive virtqueue whose index is
>>> \field{vq_index}.
>>>   \end{enumerate}
>>>
>>> -The device may generate notifications more or less frequently than specified
>>> by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>> -
>>>   If coalescing parameters are being set, the device applies the last coalescing
>>> parameters set for a  virtqueue, regardless of the command used to set the
>>> parameters. Use the following command sequence  with two pairs of
>>> virtqueues as an example:
>>> @@ -1726,6 +1724,9 @@ \subsubsection{Control
>>> Virtqueue}\label{sec:Device Types / Network Device / Devi  \item Command6:
>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device
>>> responds with coalescing parameters of index 1 set by command5.
>>>   \end{itemize}
>>>
>>> +The device can generate notifications more or less frequently than
>>> +specified by the coalescing parameters.
>>> +
>>>   \subparagraph{Operation}\label{sec:Device Types / Network Device / Device
>>> Operation / Control Virtqueue / Notifications Coalescing / Operation}
>>>
>>>   The device sends a used buffer notification once the notification conditions
>>> are met and if the notifications are not suppressed as explained in
>>> \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer
>>> Notification Suppression}.
>>> @@ -1798,7 +1799,7 @@ \subsubsection{Control
>>> Virtqueue}\label{sec:Device Types / Network Device / Devi  Upon disabling
>>> and re-enabling a receive virtqueue, the device MUST set the coalescing
>>> parameters of the virtqueue  to those configured through the
>>> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
>>> any RX coalescing parameters, to 0.
>>>
>>> -The behavior of the device in response to set commands of the
>>> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>>> +The behavior of the device in response to specific coalescing parameters is
>>> best-effort:
>>>   the device MAY generate notifications more or less frequently than specified.
>>>
>>>   A device SHOULD NOT send used buffer notifications to the driver if the
>>> notifications are suppressed, even if the notification conditions are met.
>>>
>> Your changes above are good and they are applicable when the specific coalescing parameters are set by the driver.
> What makes you say this?
> No they apply universally whenever parameters are specified by the spec:
> whether parameters are set by driver or by device.
> Is that unclear somehow?
> I suspect you are just reading the wrong part of the patch ...
>
>
>> The issue that is being resolved is, when these parameters are NOT set by the driver, when feature is negotiated.
>> What should device do?
>> The parameters are not specified...
> They are specified - set to 0.
>
>> The spec says " Upon reset, a device MUST initialize all coalescing parameters to 0.".
> yes. and device can then coalesce if it wants to.
Well, maybe coalesce here in this context is a little confusing but I 
guess I got what you're saying: setting 0 effectively disables the 
driver's control of coalescing, right. And device may have its own way 
to suppress notification...

>
>> And Heng attempt is to clarify that by adding a changing above line something like,
>>
>> "when driver does not set coalescing params, but have negotiated the feature, device may generate notifications more or less frequently than specified".
>
> Maybe that is the intention, but the proposed text is instead saying the
> parameters themselves are !0. Which is what triggered the whole
> mess with a misvote: commit log says it's a clarification when it is actually
> a behaviour change.
>

+1.

Whatever beautified wording there was, the proposed spec fundamentally 
leads to a behavior change.

-Siwei

