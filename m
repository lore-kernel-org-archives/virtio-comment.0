Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769B36AF8
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719013604; cv=fail; b=uxGv1MR2LOg3Fp3HVrhKY4oWNynTUQjPajMnHXSAr/O1wk+MgZrdcvkIvp1gWEjKSJQNOXuTq509iFecEXgQ+1gxXzBqNNrThGcH45fNT74dLvVNGl/LxzywOBbK/2Qd9MkwBYN4mSi5PQRi5l7Tvbtbsyy85MFyy5Vc4FV2baY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719013604; c=relaxed/simple;
	bh=5DsMCMs1MZA/cyzxKDeefos5nr9CdzoLaeu9bTdAfHs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oTk22AuLAvL4noFQFRq2BqWnQhh/7SZpD9unuTzZXitnpqjEB0Mew03yWC6ZXt7SyecdPc1DShaK8klsTgEKnAu/l0TYCyKxn7X7n8neb+QX5rtUNxF05mvgn9oW8RVH5TN/0O+M62E5IecxH6PO4X02e/pB/QAyybL3FSeZ//E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fRTMpysP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EBkPLAZ8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fRTMpysP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EBkPLAZ8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEXcdN007742;
	Fri, 21 Jun 2024 23:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=8ukdJqFt225C0jUxT9b0H0H/lUIIjMffDqMsa43Dpcs=; b=
	fRTMpysP182aUEvj/pn/LUMmK9gIt0RAGJuE6TIqtOwvt6g44msVlJfvexMQEiMT
	jegMZlAaHmxlzizhdMksZ8UtX07aHKwYr/LkGUmexZ2ZxrQKWfC/iiLBQ9r7++4p
	akUAEhT88R6Vinav3Gpgx0+2td+/Faim/7ZrtLHckMwj0A+2VDD2cRDGXQHVWuE2
	Rxb8sB9x9yBQlew42I5hKPT0Dn4CpnRTJFDfeBmoQB8okPdGOEi26gm7GWk+Gm7i
	CDtsZ4tXZWhkVyE///3UB8kuZnVvwyAsovh8l8sx4NrmBzML+obL2e/nS2Emqb4u
	Lb5nFqXtpx5IpTiATybucg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkd2p16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 23:46:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45LLKmGx025226;
	Fri, 21 Jun 2024 23:46:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn6q9tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 23:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioI/18xuuMZYB6xl4s2BL3Gb0/NhgPgeO29ocdsqK0ilCfv6sklDXFD3n5tMfFnx9oibdsi5LfUj/QgB47yitHs4y7cwCv9LkrCbJosV3nHTWuLIp7zbE1Ej+bNbLUuVfMHqftObdDd7QvB+o9nGMURIvwrmderUHSscT5BDBCIWQLwHXltrETisrDyBJatWr1jFcVtE4PU9WHM0dh+3Q2vzaiAoH8vrKp3QpC3Nm5E/un1XzaVnm4/b527nr67g1h+eCzSV0/8NR4fofNd92n6zvfxtUJz4E67SdtjaHfaWICv9hWkZJgBA0tatY5nyFmEKitERgAw0EYDTxAm4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ukdJqFt225C0jUxT9b0H0H/lUIIjMffDqMsa43Dpcs=;
 b=XCTJJI2kYNdjjQGaBeB2PlrScpd3DepgVFiSKa1w0xN8kJfnetptEjL1UGD7Nhafyt0eUpcz2O736b3k53zpGfEBNjYMAmRcfpr2BIotohy/V2WCGoXfkia1MQB1qAjKSwM6/NnYCvCKjz/Z22p9MUO4GIkXLslLEETF8/ZFYhvqy1zid7P/zLnj4HC3GAM/uco6YtdA245QG6LazlGqQO6BUa863HgiLwEdagkzUGDHoYkgV6MZPADQm9ErrElg6DUPH3sQneiMX+VNfKm1fNxiRfSUKxr+42c1WTOJKPQtkqTqmibhgzPG/4/x+lqKwPHI+RtrKfFbOAaLxoeuZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ukdJqFt225C0jUxT9b0H0H/lUIIjMffDqMsa43Dpcs=;
 b=EBkPLAZ8EdpOAly0EI6iOm2HUYXmkAvNBxMTYLttzMpJ9ii2NwcxsZunC6awcbR6ODtuZ1cyiKNpGuuj48vzmMw3Mtg8Ez0r4rqaGmDwmhEKFp3rFak5EAgk9NdkVwxhGkZi66nlWwijXZbN8Ah29UoCDGNZ0tyHvG7nCEK/zPI=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CO6PR10MB5650.namprd10.prod.outlook.com (2603:10b6:303:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.20; Fri, 21 Jun
 2024 23:46:32 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 23:46:31 +0000
Message-ID: <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
Date: Fri, 21 Jun 2024 16:46:27 -0700
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
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1718940245.6932242-13-hengqi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CO6PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e73db4-d746-4196-c723-08dc924c606b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rm9pUHlZOWluMFRwcGFmNXV4c1RtbTZPakJ3dU5WcExsemV3dlBzQ1M5U2FF?=
 =?utf-8?B?Rm1ZYnV6bzZEMnNoZTJ1MlpJZFAzOWhjR2ZCUHZ5bU12b2syZytrSFlYSlJB?=
 =?utf-8?B?UkpCYnNPVERVSlJOTVBJa2JnclpQYjRuWi9nR2orRkpobi9IMzBMNWZ0TVlF?=
 =?utf-8?B?U05SUFBqN0MwL3JwblFHTHZNSWlKTVcxRE8xUHpWNWNveFM3dmZyK29wSnRT?=
 =?utf-8?B?cC9Ic3dlTDVDN1BoK1EyelZ3SjB1ZTVBall6ZVZjSlkrdEEzUS9iaUFvM01K?=
 =?utf-8?B?RW1mUjJkbEZwWjRXaTFZejI3NE1CRHVqeUZPcnVoNE9Db0JxVHRtcWR3K3pE?=
 =?utf-8?B?N2NMMThFZzAvc04ydDV3UnJtNzBsa1loUEg0cGliYzJYNC9hb0hCcjNWalNC?=
 =?utf-8?B?RFJOSHR5cGlRWUQ1YUh0TDBEYmo0VHlBMXdQc1dzNDN6SXo0bVZMbW9SMFhm?=
 =?utf-8?B?RDFFVTY0dkpOdWovc1ZwYjJpRlZuQkw3SVRpaHIxN0pMOGNRY0tOVGJ1SUoz?=
 =?utf-8?B?YjZ2UVc1MUNIRUZwNCsrdmtZMzlmamFqcmtsZVBIZWhSWUFmZnlOZ1JaYlJ6?=
 =?utf-8?B?SGdVTWRiNDhpWWJUSU9qNHg2dVZJcWppVVNZTTU3K2NiWHhPNDZRZTg5clJ6?=
 =?utf-8?B?bmdxdWhlNmF2VzBZaU55V1pIYTBWT3p3NU5WeHFxcmhtWWFhajlpMC9rTEVL?=
 =?utf-8?B?ZTJ3dFp6TldXdEoyRUFZb3BVMHU2K043eWV6WS9PVDd3KzVRTmJCeXBKMEVo?=
 =?utf-8?B?eXMrNXFCVEo1dTgxbjF5b1FBQ2RsMVF0RXN5MlRQZDhudVlXQVNjR21yOHZK?=
 =?utf-8?B?SlJsVU9ocHN6Um8rWS8xQmJqaTZyMC9KdTBxQytubi9RY3ZacFNzRkIzS2xs?=
 =?utf-8?B?eW5xY1FvMDZESyt6cmVKOE14UENYQW9CU20wMWM1dHJnbklqU1EyWmJ5cnht?=
 =?utf-8?B?TnRwWGdHVVRvbmxkd2UyRFpJZWlGR3lxak9ubjVEYVFiSUN0R01GRE1Dbjll?=
 =?utf-8?B?djBBNTNxTStoekJvUzFwSWtwMFZOY2dKaVh0d2FZb25uTHBsd0hrT0xJUlNi?=
 =?utf-8?B?WVBzSS9sZFBhOVdtcXBDc1ozYTJsUjQvbDhuL3BIMWd4K1lRZUtBRDB4NmMw?=
 =?utf-8?B?QTJxbFNpOWdYNWFId1ViWWpCMTdYYUlMSmhoOEx0c3RVRWNmRndqNVc1ZlhC?=
 =?utf-8?B?WEY3R0lTaHRKMjVSNFk5TkFSQ0hlVEZxQmQ3YUtnLzkxVHV3RFNLOFVHQ0lK?=
 =?utf-8?B?RkMwV0N5VjZ3UURsWjVWdlNjWUg3N0ZNZlpmMU8yanliY2FKMEI3TFR5TCsr?=
 =?utf-8?B?RFRXSS9xa0VlSzdXQVZKbGVzVE5oTjVhd1ZsUmVBaHh6M09sR0Y4eU9UcVhL?=
 =?utf-8?B?NUxkY2FqdCsxZGhqVmUrNjJBNVJFZEpjL0ZkS2xCdjVqYmZkRC9XWUI3a201?=
 =?utf-8?B?SkNhL3UzMWZSUU5kQUN0SmZHekZwOXpqcE50N1MrK0NWRUtqY0MrOHFlQ1l2?=
 =?utf-8?B?NHl5bjhQQVBzNXRkSlRIYVRQckRWcVF4T29WcVkvY3hTcjN6L0ZuSlYvSHpl?=
 =?utf-8?B?c05tZTlZT2dHSi83TUhYVGQrUml5bnZEVFcxQ3FIVG1qcExVSnNsam1HMEtL?=
 =?utf-8?B?YmxMdWg1SmdxTGxsUjZoWW1rN25HRnc1bERMaDlkVHBPeC9NZmJhQnRQd2RJ?=
 =?utf-8?B?SHJNTEY3bGdqUFFxR3hRUG1KeHRPcWJaaHlnd3I5SjVZNXlZU05ic25UVHVi?=
 =?utf-8?Q?O5N6ydSHvVc0Pis4RAmu6JAXyGQpuLMAzxR8oVp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3pmdzFqU294ZVAwUW4vL0ZZWEdRQ3NSV1ZRQ3QxMXhCL1RzelM2NWFvbktJ?=
 =?utf-8?B?RDg5S0tUalRNZGRRL0NjcW1vYk9rRCtBd3dlWHZ4L3dWakZDUkw4QkM2MGNq?=
 =?utf-8?B?ckxDM2krcHZNWUI1aHN3SGJ4ZnJSZDNkSTJ6OElIdENTYXg2RmE5N3hEekxl?=
 =?utf-8?B?M2IzWG9USU9qaTY4WEhMQVBpcVRBY2FKK1hBYWV6N0wvTzcwU0pLWGZ1ZEN6?=
 =?utf-8?B?VFhaNmhlQndiQmdNNytCUEhMakd5TXcyN2tDNGFvNm9QekpxTE15TVQ0NnF0?=
 =?utf-8?B?NzdpV2taQmQyT3ZBWncvMkFWM1BaZEhEMnBrSG13V1pleHoyeU4zOHRLOHM1?=
 =?utf-8?B?MEgxM3BBSU5yL0lsRU5ES3VPS2NBTjRLN2tlcHc3WHhUa1dISnl3RzVld05m?=
 =?utf-8?B?U2hrNFRpSlhIak1TcGlrZFNPZTRRbzR2TFhZcjJLT293a0EwVS8vSzRvWXRq?=
 =?utf-8?B?VGlKNUVlWnRpd3RPK3ljdENVR1luR1lsYlBjZTA3RXl6ZXQvQnd4UUF0WlAx?=
 =?utf-8?B?K0p1VTc2YU9Tb0xFOGhvTWZCVmpRNHNJRERoQTV3RVFYaHM5WXo4Q2c1My9B?=
 =?utf-8?B?Szl0N3R1em5MNTZFNTdvWmRQaFduVzRQQUZET05YWTJheHJLVmJDcGdMZHdj?=
 =?utf-8?B?UnQyd2hsMGc0VWtldHJ5anBURVRzQW1OcEVwV3dwdXUvcXZPbW1kUW1KbXRB?=
 =?utf-8?B?TXQ5UVRyK3IwbFppYWpmRVA0WnRVK3B0cHhJb1l0NWVaMzdZOGg4ODJXMnBU?=
 =?utf-8?B?UStXU1ZTZ29IZWtHYUtjUkpQL1ZNWlRTUmJGQzY1NmIvc1VnUWtneTJ2dy8w?=
 =?utf-8?B?SVlmaUZTTWVmOUY1NmNraXNxenBya2s5KzIvVU9EeUh3TmRJVHFYNzVWNzZC?=
 =?utf-8?B?NEZGQ2JlNFIrVGV6c0swQkdLQytRaWQ5OVI5NmlMS3BHMithRWNXbm9VSXNr?=
 =?utf-8?B?VlBDUEtoS09KRUwxSW92cTZmWUFOR3FiZHBWZndOcmxZL2JEMlV5d1hKM0FG?=
 =?utf-8?B?d3pUL0I1bTVQam1OamtvZmtsNUZLNDdUUWpMcjlPSUoxMDRiY3lPYmVzYzRB?=
 =?utf-8?B?ZUZEcFVqMlFxcGxuTzNvelN3bXd1UGxRdkxzb29zR3JjQ2Y1WFM3cHc4UzNC?=
 =?utf-8?B?N1F6QkVza25jdWVZWmJTVld6bU5Nb0tnTmtzcWM2T0NNN1ZkQ1NPVHYxbzRw?=
 =?utf-8?B?K1Y5bnQ2QXBFVXlyMURldUNSUE03QTFIbkZlaFBpb2lHWEc1T2JIMzN3MUIx?=
 =?utf-8?B?ZllOcmJtYXBjeG5KdCtSN3lGWGRtQVd1UGRpVXowNDBYYm1MSnVlcDFHcUUx?=
 =?utf-8?B?NFUvelEvd2FxZWlmeWY4REVFbzZaMElEZlIrM3pTODl2TEtWUXh1bitJbU5o?=
 =?utf-8?B?clpsYTkwZGVhTkpIRDVQcmd2NlZES1pLVmxCSWZiY3Bwc2VSdVNyVkxZTVpH?=
 =?utf-8?B?TityZStRc0dhQ2J3Uk9NSE04aHJxS0c5Tzc3VGJjMHB0Q3N1bjBsVmRDUUFO?=
 =?utf-8?B?NzFISVJBVjlRRjV0eWJYTDBVZ3MyZGU0Q2V1U1Y5ei92ZGlNWnNMN3FSVHVI?=
 =?utf-8?B?MzczMklvekNIYVpsMDhXNFlZd2wzVjJRSFZiY0M1YXRBS1lEVW40cVpNTExF?=
 =?utf-8?B?U1RwL3YrckRsUlhLNkg2b3pxMEs5ME5kdVI1S2lKSmcwaVovb3hsZUZiOWE3?=
 =?utf-8?B?V3R0dDhLQktuR04zZ1d2MzJIU2RCcDNIb3FQbGtaYVNwaVR2aGExWkFDRnVD?=
 =?utf-8?B?VFRmM0NOZ2dxMkt6aFBXZXVVMERZTHpCVmk1eUh2OTJ5S0VCdDluVUtPT21u?=
 =?utf-8?B?K2txNWRyRndyZDl0alZRaC9HRUFkbG9VdlRRdXdVYUdORTJyaExVcWZvalhN?=
 =?utf-8?B?Smd2K2t4R0dJdXo4cnQyU1pLcTN2QkYxMWR3bVUzekUrRG5ldElRUUJUUTIv?=
 =?utf-8?B?Si9LV3NSa0dlZWVwOCtaSWkzbXVBaHN1SlVoNjJ0dGpOYUEyNlgxa2hMallq?=
 =?utf-8?B?d28rRERNL1NQbGQxTjB0TnY3QmRoRGYvZ0lyc3phQjV1V24yS1BVbVdDeFpm?=
 =?utf-8?B?aGRkSVlpeTZWZHdhbEN5QTZxdncxczNXNUIwaUdFbDlYUHRoNlBDRmpjM3FP?=
 =?utf-8?Q?NVD+ewHbuzeQDXbC+G6eeu4SJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KhDXpe10czfCFN1mV7777ZMuj9Y2mpSHqUnGYVV6QvD2HkHF/B2u66ng4kjagsjQV+ItsFDX69xxocfWim2aMK2Chltg72sg5PnvTlus7gj8MIw0LS6tDbj9B1XbKaFwcs2LYCp+6le3x+iakFygRh60ywHw1jikLgCq/M/zTGt68ttxWuDE1gvCqlnmTfsTrD0pf7zzT/C6t3IxGl65sBfGayGoy4DS/kVbBhXa214qOpdcTE9Q23yObF4lSQaNQpLfn0isQ5KrYKgWSE8iPWKTwUGmA4w6Xh2zqLzNUT4rHIgCwI9VusRVP5wIqeRWOLomGE9JKcVOMIj7a4VBOnAOOb5ryrxVsDoC7HXbX4fnsp2sE38osXqqX69aJbX6Ml6FocEu4NUG5upKMtYHvZYsDmc/I5yTs8UivBdJJrF2e3+oYtVhiZLOHQaHdIPBeDcTSsLJfzyl3lVWqgwgMczm/PdY66eJcjbDLhcPZGlUpgsHfl3M8QjvzRiQ7U3GXY+Nwayo1K1qkllncxqiWdH4ynDZt8hbHCobHNPwtRJtljqENUi9Xo8uOCEd1KG8RY2cSZ4iCJR99f7qp1lFTPCwHDmKYmtnjy0/sL0hiSk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e73db4-d746-4196-c723-08dc924c606b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 23:46:31.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fgi7I94flOwIzvjabrH720EHrWc+LrYCAvZVTDIhewEtV2CJskcQmHZqmrrhXjjZagTqErxcYYcZUu+ZmysBCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5650
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406210173
X-Proofpoint-GUID: _f8Gx62jAsfhjHqOTYYOXZ8DkGj0T4Ti
X-Proofpoint-ORIG-GUID: _f8Gx62jAsfhjHqOTYYOXZ8DkGj0T4Ti



On 6/20/2024 8:24 PM, Heng Qi wrote:
> On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
>>
>> On 6/20/2024 12:40 AM, Heng Qi wrote:
>>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
>>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
>>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
>>>>>>>> How we can we make progress with
>>>>>>>> the realease but sure we don't make backwards compat a pain?
>>>>>>>>
>>>>>>>> Ideas?
>>>>>>>>
>>>>>>> There is no functional break with this relaxation.
>>>>>>> Device set some non-zero defaults and driver didn't modify them....
>>>>>>> Anything broken? Unlikely.
>>>> Generally it's inappropriate to leave this decision making to the device
>>>> for what would be the best / most performant default config, as the
>>>> device is generally considered agnostic to the guest load...
>>> Instead, the performance of the virtual machine and the driver depends heavily
>>> on how the device is implemented, just as we have proposed various ways to
>>> offload the data queue in the device to the hardware. The reason why most
>>> devices use software to simulate ctrlq instead of using hardware offload is
>>> that the driver has no requirements for the performance of ctrlq before, that is,
>>> the device implementation is responsible for and meets the driver's performance
>>> requirements.
>> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
>> thought that it was for the debate why we need coalescing on hardware
>> offload device in the first place, instead of reusing event index or
>> similar s/w based notification suppression. I don't doubt the value of
>> coalescing, but how's it relevant to the default value disposition?
>> Generally the default config disposition is not considered to be part of
>> device implementation, especially when it comes to the situation where
>> device can't easily figure out the specific workload to occur in the
>> guest, and there's no perfect single default value that could meet every
>> single performance metric across the board. This is a typical tuning
>> knob left up to the user to adjust, why the device or driver needs to
>> set or load the initial value? The driver just needs to start with
>> certain value, be it 0 or non-zero, which guest user can override at any
>> point of time, depending on his/her need, and that's it! I guess I still
>> don't understand your user case here, why device / driver default is of
>> such importance.
> I've explained that, and I understand your argument is why default value is needed,
> and users should be able to adjust them, right?
Sounds about right. You'll soon realize that there's no perfect default 
that could work with everyone - in that it's just a static value to 
begin with, no matter whatever initial value the device comes up with, 
one user or another will come over to you and complain that what is 
loaded from the device doesn't match the workload they have, so those 
users are still expected to adjust manually tweaking for their own. As 
long as it's a tunable that guest user can control and override anytime, 
I don't feel it too much different what initial config the device would 
start with.

> The default value is working when the user doesn't adjust them.
> It's not practical to rely entirely on user adjustment,
That's where the adaptive interrupt moderation framework (e.g. DIM for 
Linux) could come to the play, I think?

>   and for devices
> that serve hundreds of thousands of customers, the device implementation
> has to be comprehensive.
Would you mind elaborating the technical difficulty for why the device 
implementation has to be comprehensive to serve hundreds or thousands of 
customers (i.e. adaptive moderation in the device), and is there better 
way to improve the current interface (ctrlq v.s. doorbell/MMIO register) 
that is hardware offload implementation wise. I feel people reading the 
thread without understanding the full background would become even more 
confused as to why it's relevant to your proposal, to me it's completely 
distinct use case or problem area that we are talking about.

Thanks,
-Siwei

>
> Thanks.
>
>>>> Unless the
>>>> device is specially hard wired to some fixed guest setup that users
>>>> couldn't change, it doesn't seem logical that the device could derive
>>>> the best or most performant config on driver's behalf. What if the guest
>>>> wants best latency for its load but the device just blindlessly guess
>>>> the guest might prefer throughput friendly that it miserably uses
>>>> latency impacting non-zero default?
>>> The device does not want to guess and cannot guess. This patch does not force
>>> the device to choose a non-zero value, but relaxes it to allow the device to
>>> choose 0 or non-zero, which is very friendly to virtual machines with different
>>> performance requirements, right?
>> I don't understand the friendly part - do you imply your VM users are on
>> kinda fixed wired setup that they cannot change these coalescing
>> parameters after driver is loaded? Can the owner of the VM in control
>> apply certain initial config for the coalescing parameters to the VM
>> image? Or is it the problem of the guest driver that doesn't yet expose
>> coalescing parameters to the end user? Otherwise I would think that
>> guest user should be able to set parameters accordingly that would best
>> fit the specific performance requirement of their own. How the device
>> could even help here? I don't feel there's a lot of value to grant the
>> device or host admin the flexibility to policy the *best* config on
>> guest user's behalf, to be honest. And you seem to admit the fact that
>> the default doesn't really matter, be it 0 or non-zero.
>>
>>>> Could this device side change for
>>>> the default config regress boot time performance (which may need best
>>>> latency over throughput)?
>>> Don't make these assumptions, what if the driver needs better throughput?
>> There's a misconception here: what we think that driver may need in
>> terms on performance does actually reflect what guest user would like to
>> have. Driver cannot read guest user's mind to make the decision, either.
>>
>> In history there was drastic change in the Linux virtio-net driver that
>> ever changed the default disposition for XPS (and RPS as well) from
>> throughput and long-lived connection oriented to concurrency and
>> short-lived oriented, which regressed a lot of existing setups that
>> expects sustained throughput and packet rate after kernel upgrade.
>> Although the occurrence of such drastic change for default disposition
>> is not so welcome (that is one of the reasons why I valued consistent
>> initial value and back compatible  behavior), I don't see people yelling
>> at virtio spec for less flexibility of offering the default disposition,
>> given that the guest user can override the config any time with their
>> own tooling or script, there's no problem at all for them to just set
>> the corresponding config back explicitly to what it was before.
>>
>>>>>>> And device/driver has better performance, is that a problem? Unlikely.
>>>>>>>
>>>> Even for rare case with a hard wired setup, the way to tackle the very
>>>> problem using device's default is still quite questionable. Usually the
>>>> mgmt software or network config utility should be equipped with some
>>>> default value if need be. And we know the guest has the best position to
>>>> impose the best / most performant config for its own load. What is the
>>>> issue or use case that this initial config couldn't be applied by the
>>>> guest mgmt software ahead but has to resort to the device to load some
>>>> default (which is odd and irrelevant to any guest load), before the
>>>> interface is brought up for operation i.e. performing I/O?
>>> Use cases are everywhere, Alibaba Cloud, MLX and all other modern network cards
>>> have a default value that is not 0.
>> You seems to be referencing your own setup basically, and the question
>> is still left answered - why the initial config can't be done through
>> the mgmt software or network config utility within the guest?
>>
>>> (0 is actually a kind of default value)
>>>
>>>>> Sorry, my vacation just ended.
>>>>>
>>>>>> Yes, it is possible. Driver can cache values it sets
>>>>>> and never query device with get.
>>>>> Don't we already have a lot of behaviors to drive queries from devices?
>>>>> RSS context, device stats.
>>>>>
>>>>>> Before anything is set, driver will report incorrect values.
>>>>> Devices that are widely supported and supported by good practices should have
>>>>> any initialization value. Just reporting 0 is incorrect value. Although the
>>>>> spec now says so.
>>>> I don't have an aligned view here, sorry. As I recall having 0 as the
>>>> default is just to keep device started in a state where coalescing is
>>>> disabled, so it's backward compatible and consistent with a
>>>> non-coalescing supporting driver - such that it won't yield surprising
>>>> effect (for e.g. regressed latency) inadvertently after user's getting
>>>> driver software upgraded. Unlike the other virtio-net features that
>>>> could 100% improve performance in all aspect, this coalescing feature is
>>>> more of a performance tuning knob that may improve performance metrics
>>>> (such as cpu usage or throughput) of one dimension while demoting the
>>>> others (such as latency, jitter or connection rate) from the equation.
>>>> That said, there's not a single and fixed set of default config that
>>>> device could supply which is able to satisfy all kind of guest load.
>>>> Rather than rely on the device to offer a matching default for driver
>>>> (which I think it's technically wrong), I'd lean to having guest
>>>> software or network utility to apply the initial config for the guest,
>>>> where they should have best knowledge for the specific guest workload
>>>> than what device could do.
>>> Before this feature, a good device implementation should also support coalescing
>>> (of course we don't necessarily assume it has coalescing).
>> Again, I don't doubt the value of supporting coalescing.
>>
>>>    In addition, virtual
>>> machines that tend to favor latency and throughput exist. If the device supported
>>> by the manufacturer needs to provide a low-latency virtual machine, please
>>> continue to keep the default value of 0.
>> No, that's not what I was asking. There's no such requirement for any
>> vendor to provide a low-latency or high throughput VM. The more general
>> use case is - the setup for real world workload might just be too
>> complex that end users would prefer low-latency on some virtual NIC or
>> even some specific queues, while the other queues of a virtual NIC, or
>> reset virtual NIC might have very different dispositions. Due to the
>> needs and dynamics of workload scaling up & down, they might have more
>> or less queues or virtual NICs to configure, so these disposition would
>> need to be readjusted at any point of time, for which there's no easy
>> way for device to adapt to easily. The guest user should have best
>> knowledge for the specific guest workload and setup than what device
>> could/should offer.
>>
>>>>>> What will break as a result? Hard to predict.
>>>>>>
>>>>>>
>>>>>> Given the patch is big, I am inclined to say it just should use
>>>>>> a feature bit.
>>>>> This doesn't seem to break anything in my opinion, we just told the device that
>>>>> now you can set more values.
>>>> Another thing this could break is live migration between devices with
>>>> varied default. How do you make sure the guest doesn't rely on some
>>>> default from the source device, while on the destination it just doesn't
>>>> get the same default coalescingjjj value? To get rid of this side effect
>>>> the guest would still need to apply the initial config for its own,
>>>> anyway... Which eventually would render this proposal with arbitrary
>>>> default rather pointless.
>>> I don't quite understand why this would affect hot migration, the values
>>> would be migrated over.
>> Then I don't see this has been discussed (wouldn't the initial value be
>> part of virtio device state to migrate over?) in the thread or described
>> in the proposed text. And your proposed per-queue coalescing parameters
>> (default plus current value) would have to be described too as part of
>> virtio-net device state, so that people don't misunderstand your proposal.
>>
>> Thanks,
>> -Siwei
>>
>>> Thanks.
>>>
>>>> Thanks,
>>>> -Siwei
>>>>> Using new feature bits does not seem necessary.
>>>>>
>>>>> Thanks.
>>>>>
>>>>>> -- 
>>>>>> MST
>>>>>>

