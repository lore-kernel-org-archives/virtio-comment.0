Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F19BE58
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 01:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719364478; cv=fail; b=t0gvGNeDzGE+LUYMdKBrS8a1WKYhx+9fhrZzd8VjUX/CMTQ0jehLd7M7ldVsTFLtnBi2WFgPHcJpGhvvjORdvaQAa23mTppVEIUYiNReN6KxMmYegQi1SdGZl27jS+rbOtp+EhWhuWmTuF7jMNTxpx8Jfs7GoG4nYwos76I3kRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719364478; c=relaxed/simple;
	bh=No96j+0BFfxT3eJ6Esztwz9UdeMbLV1zstXQjBag6mo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ug416o4ope6KoEAqiBtwk+nlOWLqxINv4kaVFbG3kAuflQtIWQ5a9uVyD60Z15kfvmn+Lu1mUM4bHCDn5dRHuq8x/M2OI41DgaLDRA2AFBoY0oYrExX+dk6/RshvFZoiTgcnsJvuUu77DLfFyl0h9dh194Zv9uGoQ/DUJVIaqnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AO/XiPc1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ttI8mGVe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AO/XiPc1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ttI8mGVe"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PMBgbw003206;
	Wed, 26 Jun 2024 01:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=oKH1KPviWSFZtXLQPimt1vOReW9BedEgIgAqRhRFuIo=; b=
	AO/XiPc1s/r2NjJ7YFe/7jXT+tBSmXykNJrXhir30EPcgUb3m3SfTD5NJ1k1NdiV
	02G2nGnYUYI1kZs7sW3hH0t2wCz1L9K/ZKlvOI6lBCNosAJAP3WWgTyVGdUUxl/P
	d37gO6Cal4M9V4BCo30+sQUSCi6lvNsJkMlJi73HiT2XgRVt5T+InSWqrf331fLM
	9V89HLa7X/Abgj33dr1qyKOAn2iWAHb1KG2D9/fLakOPxeyUvdD+sWF58qoMzGgy
	QHFVcFM/L/wFiTDwZQUtLcQIiBorhIQtNCto22slnuq56o27AV2eHWOJIiJbX1Y6
	0DPZjr/47SbSctxVLk0wBw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywpg99tjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 01:14:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45PMgCJh023318;
	Wed, 26 Jun 2024 01:14:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2evbyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 01:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPBhv9WiPJzHqOgoMVs45YFESnlNfxxAsSDI0Ihz3im/o4gQh1slxcoD9y/s6r94GGsP1t+bvq2oi7dRDQygjGhrNsCTjz1s4p5i4exlq0RkErc+3+klcicxAKFkjcfvfsmxvWkiSTotGJ9ApYn55iacz94g/dga4B1PJu6XX4tZi6PDJpPJPOcgYQEsCvWtEo31dZ1G/1qgSeFU6KLsR+Rbzam1O+tdPK8sYAkijwpjh+oJc0pWxFCQ/on8xhQf4MwR3AiHWC/HohZ60k/7Gm3ZbNueVRFoF5tFO7/vz2Q8pmIijkLRTnQB3qaLo0Pxr3tqDon3OAmFoJwWIDkMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKH1KPviWSFZtXLQPimt1vOReW9BedEgIgAqRhRFuIo=;
 b=JDkXHFc3+CYnnmGgbj7ujP2EqoY9L7YH9rm2tZ0QsPCAil3LoXDsbXfc6ZzZXfW2ViA/iywkueRaGCzCvgU78a5hnDldAlfxix+oZgkXb6xvpiVUJZIVUWUQZRYgtZDaIcO8cLO20gCbUeG+xVj8N2RCV7GSd43urzmlXGkjOTW/ufJz9F7VPNumaghFcfQU/Hl1+rQsuUWm7ZJCg32ovgmbzdE/NBkt8D9xGFDn1dPJoS8qM+LhR5RfSS3bJZ0qfwU0ghl13wgcCx27WHxIX7YyTvNW0sYxBF3v+xQdNKNh3FKBUPhq78DdXoiksVflxvm3qqpFfyxwg8papvjgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKH1KPviWSFZtXLQPimt1vOReW9BedEgIgAqRhRFuIo=;
 b=ttI8mGVeBVzpxeutLvmracHbG+bPg2852J3HJG4S/gcwtbQny0IZMALP13jJMIwoLvKdl81EbnNp2NWbBPVKEGH0dK/9T3/yHRRJCYLjFm4lwHo6qhZfcgd4Z2HOmYnsb7BIj0YzONsF9O783K7WXvSamlOf95/La8UhRvEeux0=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by BL3PR10MB6017.namprd10.prod.outlook.com (2603:10b6:208:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38; Wed, 26 Jun
 2024 01:14:21 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 01:14:20 +0000
Message-ID: <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
Date: Tue, 25 Jun 2024 18:14:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
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
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:208:239::35) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|BL3PR10MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6e2f22-eeab-4ef7-e785-08dc957d4e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVVvZnRBM2hnRFNlVkxMemJWUUFGRENXaUtncExXVk9tQ3V2TndpTXpwc0xO?=
 =?utf-8?B?NXpsdUl3VTlRR3l4Z1IvT2wvUGJXdG9Cc1R6blJxdGZMajJWNnBqMkdJaU14?=
 =?utf-8?B?NTIrK2xsKzdkRDlrQ3RzNUhVS1ArRGhLV2J0a3VSR3RQRnQrM2JaQmh1dEVS?=
 =?utf-8?B?bnh5WkdpcUs5QkVwdzAvV0xBVmYyUWhkVEg5YjFrQWIyOEtRcTNGZFYxU1lR?=
 =?utf-8?B?TjhsNHBsK3ZrWTBNUGc3Q1VtcXpjdHdtbDFGNElFYXg3ZGpoRWNxRWQ0TFpz?=
 =?utf-8?B?cDE5VENpUHd5clIvOThVYzh0a1JLY3YwZVlTUTN3SnJNZmlCdUlCaVppSUxa?=
 =?utf-8?B?Ri80RHB2ZHVpVkFQcXFBMlhtUVE3V3RwYitES1lmVEU2dWRUT0RoOWdLK0do?=
 =?utf-8?B?M3lhVzg2RW84d1JOVlFqbm9URGVySnpHcWtiSEs3TXNqbE5RZWZtV3p0dmtL?=
 =?utf-8?B?eXgzWnh3aURsb3F3d1U3SzU0SzJ5VmJTTUp1ZThTRDVtOS9vUGlHWWpoZm9I?=
 =?utf-8?B?U01lVTd3T2xqN3BpQXN0K1FqdWhjUm1vV3dNN3M2Vlp0dVJWOFc5c3NyaTNk?=
 =?utf-8?B?U2FEbTJ2VmMrbDdWWEdZYVJmWXYxZTZOS2I1K2pPZEtvL0xucGlKeFdjSzdH?=
 =?utf-8?B?aEVCb2xXbm5KWmpGSTVOS05xWTdwZXQwOTNaSmFVRVJCUm5qck4xaTJwMGpm?=
 =?utf-8?B?L0FLY0o3RDhwYm5wV2JSaWJWNWxSRlRacEN2OVN3aUNNSE1xZmdsU2NWTnlS?=
 =?utf-8?B?RnlGTHlKVjk0OXkwTWhRSStvSU1NS3pVVlRFblU2Y1JYNGRDTDRCU2E0ZmND?=
 =?utf-8?B?eVR6cU5veHJkK1B6QWdIUHM2R0k4b3NXZ2doclRJUEgvNGQvcmNGZFQxc3pS?=
 =?utf-8?B?SElNY3BjUkcxd1VJWjdWL3Y1WEplRmtpUEhVMHhZN2JhOXRDQVNzS3JHdFJZ?=
 =?utf-8?B?U2UwK0oyM05URlZoVis3QjRsMmJXS3Z5UysvcnFsUWlvSGd3WXlJR3pwTS9T?=
 =?utf-8?B?UXNUZkdEVk00YSt3cFpnRkVlZExETHhDbDhQTy8zMm9PcUVjdTlGaDlvV0px?=
 =?utf-8?B?M1N4L3padDllamcxSS84YUhQc1RzUytmVEVlOVROelZmMXh2aExwKzVxTENt?=
 =?utf-8?B?Z2gxWS9sL01xTk03WGhvRVVUV1VCaDcySFl6S2JiRU1Jaktzd294eE1CcnMw?=
 =?utf-8?B?dUlvV0JwZ2ZmbEYrL2g2WXQrYllzeS91N0dTUXR4WGkyV01FbFdJVnVxK0tF?=
 =?utf-8?B?ZnNaVEpBaTMwMVBTZ3hOS3NWdGRBY2hqYzhQL05mYkxuOEtHaVhmb0c3cWVk?=
 =?utf-8?B?TFo3N3V4TTBxK0p6VnZtZGJhblRhby9tOU1rZGl5dEJzVmVVYktSUUZIVzcy?=
 =?utf-8?B?UWF6S2kwek5wTHVYTjRWSDMzTjhuQWdJR2QyOHFTdzU5S1NIODFLbG1NbXZT?=
 =?utf-8?B?K1kxajBBWFdabzEzVFdOVHNZZHRwNi9tZ0Q4aTRyNW55V0NtMkFBU1oxNHJR?=
 =?utf-8?B?bVl5YWVVdmM5Tnloc2NDTG5ONnFzUXhYZ1paRFlGUTZIT3o0czdiMy8rWnYy?=
 =?utf-8?B?N0t3UmwycitUYm11MnYwVEJySWI1YVlLSFNhUkpFd2ZBTVVhOVcxQUNEbnl5?=
 =?utf-8?B?WFJyZnIxN3ZENzBQM2ViTGx6MkpxWHA3S0s4emVMQklBaHVxUVVHMkYzdFBw?=
 =?utf-8?B?RW1JdUtSRyt2WUFSZ2Rza2RSYmZvTXYrelhHeW8wSE9odnlyb2RCRGR0QnJq?=
 =?utf-8?Q?yj1YO/H69Bxr1Q3bCNWcO/JIq2VM889vTzzj95+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(1800799022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2JISnp5MTdlWDZBS3pCckRhc1pwSHd2bUJzVXlIV2krNXhhckZEUitpdVFz?=
 =?utf-8?B?TkNYK3dzZWVWMUhxUlU1dXB2Wld6YWVybkdSVXo2Nm5DaXNOcFRnUHFpUy9O?=
 =?utf-8?B?Qk93RUVtN2s5MHgzZzdaK3BBM1E5bitNY0xadWdmTWd5WGdBNmxucHcvRWMx?=
 =?utf-8?B?WnRHeUxxTTRZUG1NK3d2RW9ZaDNSNThFR3N1L2Rza0h0dnRKU1lGZGlLVVBX?=
 =?utf-8?B?WndFUnJ6TER4MVlTV1RKOVl0YUpLN0VoajdOaVRzdUpOTjFvWHJ2UkZCYWI3?=
 =?utf-8?B?bFJqVGt5NmtibjBjaEVlckpGYkRTNzN0MW1EMHVqZXo5L1YrdE9kWHpjT09a?=
 =?utf-8?B?aWNLNEswZWp3R1F6Wkd5dTFVallkVG90RUgyOElrYzVJUk5nOGRFWXpraFhV?=
 =?utf-8?B?Z0dnSExyZEFiQWVKOWJRSTZNZXZFTGdhVHk2UFpPZUxTWUlhdHVxYmQ0MHhy?=
 =?utf-8?B?ZDgwVzYvd2Zmblo3U1JXRFhaVlAvcGVicTZyblpzVnhyMXF6SkhiQ3FGbmN4?=
 =?utf-8?B?eElZK0hWSXJjZ09ieThrcVFrV2dOU3NZa3dQTExVQ1pQdlE4VjRYcitHRGE4?=
 =?utf-8?B?MHRadTJaZUxWUkRFM0N4YzA3c3hoK2t6NmxPZEJCK0NzY0VjRGcwSytZRXhV?=
 =?utf-8?B?MmFtK1ZhUm1rUTN2KzFuazF3Mm9YM1ZiNmhXV0daU0N4NlgzVmJQemIxczU2?=
 =?utf-8?B?ZEJuS3c5bXZpcnhsTWVOZVVDOGpzZ1huU3NnM3FYdHAvSWtFbGpaVHgxK1Z0?=
 =?utf-8?B?d0RFMUptNlExTnVtWDFpYVdSZVdLRzlqVXJyR210RjBGNXozbHFGQ3JXU01j?=
 =?utf-8?B?NHBCUkZ4NDh5dXNBOS9ReGUxemNaVGxUL2kxMmNHUHFiZDVRWGN5dHhmNk1y?=
 =?utf-8?B?VG00UTB6ZEtXK2V6T0dNZlg0TVJPTUpnd1p0WG4wZjFQSVhGcUtPOFNYakln?=
 =?utf-8?B?dDgyTnEwN0NFQmlRRnFJekFUNzVnd0JEYTFrakpQalY5K3AzQUpqK3Z3Y2ha?=
 =?utf-8?B?d0ljbklFcnpQU0doWG8vR1hRMFV3TitkOXdaY01CRmI2QXoyNkphdm15azk3?=
 =?utf-8?B?OGU2bmNwWjdQZXZXSmpGbm1Za2VrZXpwSWEvZHV4QTcyT3pMMnNlMmNqY1la?=
 =?utf-8?B?QUlRNGxtbmpLOGw2NkZJeTdqYVpEMmROOGNpcDBWTzBocmdkck91WWxCdnBH?=
 =?utf-8?B?UldMbkVZa1Y5c2RyRUNYRDg4ckRFcEZsN0NSNjY3MkVVaVpQL3lSazBiY2tR?=
 =?utf-8?B?Z25PWlJNOUlyVFFRK2xaR1ZKTGNxYU8vVXA0S3BuOHoxbkJPTlVvRkxmeXZx?=
 =?utf-8?B?bjM1QXRCVUtWZkNkK0RHZWdldHdCdXN2cGloUXJwWkRRMG9PZXJTamxZM2Na?=
 =?utf-8?B?YXBVTUlOR3RlOTRYRzB1N2J3NExNRHhCdHZTTWdvTnRmdmlTK3RiRWxPZWtU?=
 =?utf-8?B?RlR6cGUrTmh1ZkUxTUxkZDN6Uy80NlBjTFNTclpFSENoWUxMRm5Ga3E4bktk?=
 =?utf-8?B?dWxkQVZSbXltaURFbnRrYW01ZnVEK2k2Tm95TUxVL1FwVGUwLzE3cU9OQ3FL?=
 =?utf-8?B?bzQyc2RrSkJSNTlHTnFnN3hJUFlCb2E5MlEyOGNVb3NNbFBVbnpIUzNHTFg2?=
 =?utf-8?B?Rk5QdFh3czlJRjI4TEY3MTdxYlV3V2RJU2UxaVZXcC9GcmhQOUhhRVpSa0U1?=
 =?utf-8?B?dDZRdXNsMFZ0N083V3lSY09lZGJjaDdzTldjZzRUUElpV3IwaW9JZmRZN29o?=
 =?utf-8?B?SFpZb2VkaG9aNFFGdHRwSHBnOE9DdERaSEFsVXltUkN5ZGsvZ2g0OE9GQ0lM?=
 =?utf-8?B?Ky9razl0Qmcvc09nOTlHYWp2ZjRBejAzZllZQ0dBTXh2QWRkUHhwR21yRUh0?=
 =?utf-8?B?VWcxYVdPZitUWmYycmFMRndlSVRhRmZGaHRqK1gyWjh1QkVIZGIzY1F0cFRK?=
 =?utf-8?B?UStvMjV4UFVsbktMWE9mRUV1WXdreDhmd092M0k1SlVyOUc3RFNFQXJGajNx?=
 =?utf-8?B?SzdDZHBwY0Z5ZFFKeVUxcFBwQTYreXBPd04vTisyTXR1cFAvNXF6M2RLeWdR?=
 =?utf-8?B?Y28rTHJPN3FtS3hMalZsbFRxTjZYNFBKaUVhYzRoMHVSNmlPalRsbm96cnho?=
 =?utf-8?Q?Ua0GmtRNigdlp3CVMJSuh3Sx6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	q978CqUuDytrJihdEOrXTQoakZDwco8I5Jg4Ig2RyRG/QrTS+gIGoYuPQWOrxz/TR23mbmvIMMhJpPxIqCgsZPr34SUFT7ezmoQccnZ1gmPPw0x7nGnDCl4lyTC/XcHN8ayIee7TIWkQajFF3EJepVrgPjfLHFAfxF9+Km4KYR0OSSyNt9M8qnp4znM7cQVrdlXu53nHxJ2x47AXHu05TdHFrDPhXqKs/onApNvj+cNqprfhwd0gUjSwUCeumQh78tMKFTw3zVq5xz+DmT1zbG7CQHqyziyUsmuX4JG3JZpWQra895aHV8ES4Ks9zKwtSngL3QuYzG72GDY6mv5+gx6VRBFlQVIBIp+yq3PSEqqJn39rC4tKNj0Xj3sEAIEHyL1BAlPbf0cZUnE7ApcEsui++YStkACGGPZQ5kufQdJ0aAfgb3YyRp+aZfVb1YLNsEcyQmP3o0WPDj2pAqBaYeCGC39iO+xp1gxd22c6KDVo6ASjMLsHCzsbUIJ1SlB7iPdnXw5ptO6U+Y+LIOhtX9l8dUBGpZPBt1OqyD0v5WGrhMsUaEKRrBvZVn0p2aBrG/gWBQXyICjmmaEXheyCCQV82goR9wO8Gc1FCX/Jyks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6e2f22-eeab-4ef7-e785-08dc957d4e95
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 01:14:20.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZDCIaC/+oPBQYJFPoSsmXzPPG9IrLTRk4Ozr0D8hMvMEKUCKmP+vG+hNSf+juyNh1b6gFbJGS45cFuRPIWzGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6017
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_19,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260008
X-Proofpoint-ORIG-GUID: guEgsZTxZjuKS3nFzBVS9sigfEttsm2a
X-Proofpoint-GUID: guEgsZTxZjuKS3nFzBVS9sigfEttsm2a



On 6/24/2024 10:56 PM, Parav Pandit wrote:
> Hi Si-Wei,
>
>> From: Si-Wei Liu <si-wei.liu@oracle.com>
>> Sent: Tuesday, June 25, 2024 10:22 AM
>>
>> On 6/21/2024 6:34 PM, Heng Qi wrote:
>>> On Fri, 21 Jun 2024 16:46:27 -0700, "Si-Wei Liu"<si-wei.liu@oracle.com>
>> wrote:
>>>> On 6/20/2024 8:24 PM, Heng Qi wrote:
>>>>> On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu"<si-wei.liu@oracle.com>
>> wrote:
>>>>>> On 6/20/2024 12:40 AM, Heng Qi wrote:
>>>>>>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu"<si-
>> wei.liu@oracle.com>  wrote:
>>>>>>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
>>>>>>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S.
>> Tsirkin"<mst@redhat.com>  wrote:
>>>>>>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
>>>>>>>>>>>> From: Michael S. Tsirkin<mst@redhat.com>
>>>>>>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM How we can we make
>>>>>>>>>>>> progress with the realease but sure we don't make backwards
>>>>>>>>>>>> compat a pain?
>>>>>>>>>>>>
>>>>>>>>>>>> Ideas?
>>>>>>>>>>>>
>>>>>>>>>>> There is no functional break with this relaxation.
>>>>>>>>>>> Device set some non-zero defaults and driver didn't modify
>> them....
>>>>>>>>>>> Anything broken? Unlikely.
>>>>>>>> Generally it's inappropriate to leave this decision making to the
>>>>>>>> device for what would be the best / most performant default
>>>>>>>> config, as the device is generally considered agnostic to the guest
>> load...
>>>>>>> Instead, the performance of the virtual machine and the driver
>>>>>>> depends heavily on how the device is implemented, just as we have
>>>>>>> proposed various ways to offload the data queue in the device to
>>>>>>> the hardware. The reason why most devices use software to simulate
>>>>>>> ctrlq instead of using hardware offload is that the driver has no
>>>>>>> requirements for the performance of ctrlq before, that is, the
>>>>>>> device implementation is responsible for and meets the driver's
>> performance requirements.
>>>>>> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
>>>>>> thought that it was for the debate why we need coalescing on
>>>>>> hardware offload device in the first place, instead of reusing
>>>>>> event index or similar s/w based notification suppression. I don't
>>>>>> doubt the value of coalescing, but how's it relevant to the default value
>> disposition?
>>>>>> Generally the default config disposition is not considered to be
>>>>>> part of device implementation, especially when it comes to the
>>>>>> situation where device can't easily figure out the specific
>>>>>> workload to occur in the guest, and there's no perfect single
>>>>>> default value that could meet every single performance metric
>>>>>> across the board. This is a typical tuning knob left up to the user
>>>>>> to adjust, why the device or driver needs to set or load the
>>>>>> initial value? The driver just needs to start with certain value,
>>>>>> be it 0 or non-zero, which guest user can override at any point of
>>>>>> time, depending on his/her need, and that's it! I guess I still
>>>>>> don't understand your user case here, why device / driver default is of
>> such importance.
>>>>> I've explained that, and I understand your argument is why default
>>>>> value is needed, and users should be able to adjust them, right?
>>>> Sounds about right. You'll soon realize that there's no perfect
>>>> default that could work with everyone - in that it's just a static
>>>> value to begin with, no matter whatever initial value the device
>>>> comes up with, one user or another will come over to you and complain
>>>> that what is loaded from the device doesn't match the workload they
>>>> have, so those users are still expected to adjust manually tweaking
>>>> for their own. As long as it's a tunable that guest user can control
>>>> and override anytime, I don't feel it too much different what initial
>>>> config the device would start with.
>>> When you have a large number of customers and they buy your machines,
>>> how many users do you think have experience adjusting this value? More
>> below.
>> This is not what this proposal alone could address, as it just shifts the sheer
>> pain to the device and host admin rather than provide any flexibility.
>> Technically I believe the right solution is to seek adaptive coalescing that
>> doesn't require user to tune anything. Noted adaptive coalescing /
>> suppression could be done from the guest or by the device. For e.g. the s/w
>> based event index based notification suppression could also work with
>> hardware if the event index is somehow propagated through a doorbell
>> register rather than load from host memory over the PCI transport.
>>
>>>>> The default value is working when the user doesn't adjust them.
>>>>> It's not practical to rely entirely on user adjustment,
>>>> That's where the adaptive interrupt moderation framework (e.g. DIM
>>>> for
>>>> Linux) could come to the play, I think?
>>> Last time, this work is only useful if DIM is not enabled. I don't
>>> want to explain it again, I've said it many times to different people
>>> in the history discussion, don't you want to check any history discussion?
>> I did before I replied. I thought both Halil and Michael tried hard to convey is
>> that what you claimed to work by just getting the initial config loaded from
>> device will not be sufficient to address all the performance requirements in
>> broad and general means other than satisfy the goal set by yourself. What I
>> saw is that you kept proving yourself by trying to reference your own use
>> case and design - this not just mixed different things up but also ended up
>> with circular argument that wasted everyone's time unfortunately.
>>
>>>>>     and for devices
>>>>> that serve hundreds of thousands of customers, the device
>>>>> implementation has to be comprehensive.
>>>> Would you mind elaborating the technical difficulty for why the
>>>> device implementation has to be comprehensive to serve hundreds or
>>>> thousands of customers (i.e. adaptive moderation in the device), and
>>>> is there better way to improve the current interface (ctrlq v.s.
>>>> doorbell/MMIO register) that is hardware offload implementation wise.
>>>> I feel people reading the thread without understanding the full
>>>> background would become even more confused as to why it's relevant to
>>>> your proposal, to me it's completely distinct use case or problem area that
>> we are talking about.
>>> Regardless of whether DIM can be enabled by default (it cannot
>>> accelerate all scenarios, right?), therefore, a considerable number of
>>> machines on the cloud vendors' line still have to rely on static
>>> values to provide boot-up performance.
>> Sorry, this is not a good excuse for people to accept a sub-optimal solution.
>> Please talk to the other hardware vendor or read my above reply carefully.
>>
>> -Siwei
>>
>>>    The vendors will also make optimizations to optimize scenarios like
>>> ping-pong, so the boot-up performance is very good.
>>>
>>> Thanks.
>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>> Thanks.
>>>>>
>>>>>>>> Unless the
>>>>>>>> device is specially hard wired to some fixed guest setup that
>>>>>>>> users couldn't change, it doesn't seem logical that the device
>>>>>>>> could derive the best or most performant config on driver's
>>>>>>>> behalf. What if the guest wants best latency for its load but the
>>>>>>>> device just blindlessly guess the guest might prefer throughput
>>>>>>>> friendly that it miserably uses latency impacting non-zero default?
>>>>>>> The device does not want to guess and cannot guess. This patch
>>>>>>> does not force the device to choose a non-zero value, but relaxes
>>>>>>> it to allow the device to choose 0 or non-zero, which is very
>>>>>>> friendly to virtual machines with different performance requirements,
>> right?
>>>>>> I don't understand the friendly part - do you imply your VM users
>>>>>> are on kinda fixed wired setup that they cannot change these
>>>>>> coalescing parameters after driver is loaded? Can the owner of the
>>>>>> VM in control apply certain initial config for the coalescing
>>>>>> parameters to the VM image? Or is it the problem of the guest
>>>>>> driver that doesn't yet expose coalescing parameters to the end
>>>>>> user? Otherwise I would think that guest user should be able to set
>>>>>> parameters accordingly that would best fit the specific performance
>>>>>> requirement of their own. How the device could even help here? I
>>>>>> don't feel there's a lot of value to grant the device or host admin
>>>>>> the flexibility to policy the *best* config on guest user's behalf,
>>>>>> to be honest. And you seem to admit the fact that the default doesn't
>> really matter, be it 0 or non-zero.
>>>>>>>> Could this device side change for the default config regress boot
>>>>>>>> time performance (which may need best latency over throughput)?
>>>>>>> Don't make these assumptions, what if the driver needs better
>> throughput?
>>>>>> There's a misconception here: what we think that driver may need in
>>>>>> terms on performance does actually reflect what guest user would
>>>>>> like to have. Driver cannot read guest user's mind to make the decision,
>> either.
>>>>>> In history there was drastic change in the Linux virtio-net driver
>>>>>> that ever changed the default disposition for XPS (and RPS as well)
>>>>>> from throughput and long-lived connection oriented to concurrency
>>>>>> and short-lived oriented, which regressed a lot of existing setups
>>>>>> that expects sustained throughput and packet rate after kernel
>> upgrade.
>>>>>> Although the occurrence of such drastic change for default
>>>>>> disposition is not so welcome (that is one of the reasons why I
>>>>>> valued consistent initial value and back compatible  behavior), I
>>>>>> don't see people yelling at virtio spec for less flexibility of
>>>>>> offering the default disposition, given that the guest user can
>>>>>> override the config any time with their own tooling or script,
>>>>>> there's no problem at all for them to just set the corresponding config
>> back explicitly to what it was before.
>>>>>>>>>>> And device/driver has better performance, is that a problem?
>> Unlikely.
>>>>>>>> Even for rare case with a hard wired setup, the way to tackle the
>>>>>>>> very problem using device's default is still quite questionable.
>>>>>>>> Usually the mgmt software or network config utility should be
>>>>>>>> equipped with some default value if need be. And we know the
>>>>>>>> guest has the best position to impose the best / most performant
>>>>>>>> config for its own load. What is the issue or use case that this
>>>>>>>> initial config couldn't be applied by the guest mgmt software
>>>>>>>> ahead but has to resort to the device to load some default (which
>>>>>>>> is odd and irrelevant to any guest load), before the interface is
>> brought up for operation i.e. performing I/O?
>>>>>>> Use cases are everywhere, Alibaba Cloud, MLX and all other modern
>>>>>>> network cards have a default value that is not 0.
>>>>>> You seems to be referencing your own setup basically, and the
>>>>>> question is still left answered - why the initial config can't be
>>>>>> done through the mgmt software or network config utility within the
>> guest?
>>>>>>> (0 is actually a kind of default value)
>>>>>>>
>>>>>>>>> Sorry, my vacation just ended.
>>>>>>>>>
>>>>>>>>>> Yes, it is possible. Driver can cache values it sets and never
>>>>>>>>>> query device with get.
>>>>>>>>> Don't we already have a lot of behaviors to drive queries from
>> devices?
>>>>>>>>> RSS context, device stats.
>>>>>>>>>
>>>>>>>>>> Before anything is set, driver will report incorrect values.
>>>>>>>>> Devices that are widely supported and supported by good
>>>>>>>>> practices should have any initialization value. Just reporting 0
>>>>>>>>> is incorrect value. Although the spec now says so.
>>>>>>>> I don't have an aligned view here, sorry. As I recall having 0 as
>>>>>>>> the default is just to keep device started in a state where
>>>>>>>> coalescing is disabled, so it's backward compatible and
>>>>>>>> consistent with a non-coalescing supporting driver - such that it
>>>>>>>> won't yield surprising effect (for e.g. regressed latency)
>>>>>>>> inadvertently after user's getting driver software upgraded.
>>>>>>>> Unlike the other virtio-net features that could 100% improve
>>>>>>>> performance in all aspect, this coalescing feature is more of a
>>>>>>>> performance tuning knob that may improve performance metrics
>>>>>>>> (such as cpu usage or throughput) of one dimension while demoting
>> the others (such as latency, jitter or connection rate) from the equation.
>>>>>>>> That said, there's not a single and fixed set of default config
>>>>>>>> that device could supply which is able to satisfy all kind of guest load.
>>>>>>>> Rather than rely on the device to offer a matching default for
>>>>>>>> driver (which I think it's technically wrong), I'd lean to having
>>>>>>>> guest software or network utility to apply the initial config for
>>>>>>>> the guest, where they should have best knowledge for the specific
>>>>>>>> guest workload than what device could do.
>>>>>>> Before this feature, a good device implementation should also
>>>>>>> support coalescing (of course we don't necessarily assume it has
>> coalescing).
>>>>>> Again, I don't doubt the value of supporting coalescing.
>>>>>>
>>>>>>>      In addition, virtual
>>>>>>> machines that tend to favor latency and throughput exist. If the
>>>>>>> device supported by the manufacturer needs to provide a
>>>>>>> low-latency virtual machine, please continue to keep the default value
>> of 0.
>>>>>> No, that's not what I was asking. There's no such requirement for
>>>>>> any vendor to provide a low-latency or high throughput VM. The more
>>>>>> general use case is - the setup for real world workload might just
>>>>>> be too complex that end users would prefer low-latency on some
>>>>>> virtual NIC or even some specific queues, while the other queues of
>>>>>> a virtual NIC, or reset virtual NIC might have very different
>>>>>> dispositions. Due to the needs and dynamics of workload scaling up
>>>>>> & down, they might have more or less queues or virtual NICs to
>>>>>> configure, so these disposition would need to be readjusted at any
>>>>>> point of time, for which there's no easy way for device to adapt to
>>>>>> easily. The guest user should have best knowledge for the specific
>>>>>> guest workload and setup than what device could/should offer.
>>>>>>
>>>>>>>>>> What will break as a result? Hard to predict.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Given the patch is big, I am inclined to say it just should use
>>>>>>>>>> a feature bit.
>>>>>>>>> This doesn't seem to break anything in my opinion, we just told
>>>>>>>>> the device that now you can set more values.
>>>>>>>> Another thing this could break is live migration between devices
>>>>>>>> with varied default. How do you make sure the guest doesn't rely
>>>>>>>> on some default from the source device, while on the destination
>>>>>>>> it just doesn't get the same default coalescingjjj value? To get
>>>>>>>> rid of this side effect the guest would still need to apply the
>>>>>>>> initial config for its own, anyway... Which eventually would
>>>>>>>> render this proposal with arbitrary default rather pointless.
>>>>>>> I don't quite understand why this would affect hot migration, the
>>>>>>> values would be migrated over.
>>>>>> Then I don't see this has been discussed (wouldn't the initial
>>>>>> value be part of virtio device state to migrate over?) in the
>>>>>> thread or described in the proposed text. And your proposed
>>>>>> per-queue coalescing parameters (default plus current value) would
>>>>>> have to be described too as part of virtio-net device state, so that
>> people don't misunderstand your proposal.
>>>>>> Thanks,
>>>>>> -Siwei
>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> -Siwei
>>>>>>>>> Using new feature bits does not seem necessary.
>>>>>>>>>
>>>>>>>>> Thanks.
>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> MST
>>>>>>>>>>
> I saw the need of this proposal slightly differently in the discussion with Heng in v4.
> The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
>
> Flow is:
> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
>
> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
>
> 4. the virtio-net driver even after negotiating VIRTIO_NET_F_VQ_NOTF_COAL, still kept the its dim disabled.
> vi->rq[queue].dim_enabled = false by default.
>
> 5. The virtio net driver enables dim only on user request via ethtool.
>
> So here, just because one is using a new driver and new device, it may get lower performance.
Impossible, older driver / device doesn't have coalescing advertise / 
enabled, and new device & new driver with coalescing negotiated starts 
safe with 0 with coalescing disabled effectively, how can it get lower 
performance?

>
> Do we agree to above problem description?
This narrative has two problems:

- The term "lower performance" is misleading and inaccurate, the fact or 
implication of coalescing is that it yields worse latency, causing 
additional delay and jitter that would hurt quite a lot of real world 
workload that is latency sensitive.  So, rather than say coalescing 
helps performance, it should clearly tell the truth that the coalescing 
parameter is no more than a tuning knob that has performance 
impact/implication, being positive or negative it is very subject to the 
guest workload. So the default disposition or initial parameters loaded 
from device just reflects the preference of the host admin/ device 
owner/ cloud vendor of one's own, for e.g. it is optimized for 
throughput oriented load versus latency oriented. Be noted, generally 
end users don't care what coalescing is about, they do not connect 
performance to "throughput" or "bandwidth" as that in your mind.

- The specific problem or use case is narrow scoped and specifically 
tailored (e.g. for a hard wired guest setup that is known to the device 
owner / host admin already), while for some reason the advantage of the 
proposed solution is overly exaggerated. For one hand, the ethtool 
interface is very Linux specific that exposed quite a lit lower level 
device implementation details to normal end users. In case of static and 
fixed configuration, it definitely requires dedicated knowledge of the 
user to fine tune for their load. For the other hand, if we are talking 
about normal users who don't have such knowledge AND don't care so much 
about performance, then whatever coalescing parameter will just work 
with them, and they don't really care about the default. However, For 
those normal users who care about performance but still care about 
getting the best or well balanced performance (N.B. I say performance in 
general, not limited to only throughput or latency in one dimension) for 
their load, what options do they have? IMHO what they really like is to 
lean on guest/driver/device to auto tune by itself rather than for them 
to take the deep learning curve to fiddle with the low level device 
parameters manually by themselves, right?

If you agree with the above, I guess we could proceed with unlocking the 
other good options, as listed below. To me, the question I got from the 
above problem statement but still left unanswered is that, what makes 
the cloud vendor think that they could have better posture to decide 
certain default values for guest users' behalf? Why it is a MUST to do 
so for every cloud vendor in general?

Thanks,
-Siwei

> If no, I likely missed something in the long discussion and need to read all of it. :(
>
> If yes, few solutions are:
> 1. A user intervention is must to avoid this regression. The user in the guest VM must enable DIM if the device supports it.
> Very hard to do this plumbing.
>
> 2. A net driver enables the DIM by default as long as VIRTIO_NET_F_VQ_NOTF_COAL is negotiated.
> (without ethtool setting)
>
> 3. A device relaxes the limitation and continue to apply the coalescing, until driver overrides it.
>
> In my humble opinion, Heng is solving it using option #3, that tends to work with existing and future drivers who may/may not enable the DIM.
>
>
>
>

