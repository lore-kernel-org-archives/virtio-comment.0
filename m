Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FF1DDA6
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718667103; cv=fail; b=RRkgKT52MmiRleCkqZDFjqa2meIR6qGYqfCyLI1pKRt2c+deMxH+DqrT1eo/R6250aT+NLRuslZCVIcuM59KH6Y85cOne0wGCyymMsz4SYeMFxjlIne7veQ/u/OBuCGvtJU9GlVOK2dvQXUvSqjQFpgBwq+ShDKHr43GG6UYPNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718667103; c=relaxed/simple;
	bh=Ko4hQM9BQRHcDabfJ7seRS84CHSJNeS2aWt3PfW5a/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D58Wof9Dw4/RbiN6bDkEDrtyzD/ERi7fZdklFvRdU9g0nm1/Z06fLTF3GkxzZwo7XO03nSFvFIBA19i1QGjiOHJnTQkiv0hSi/DXNySlg1fV5mqNnFtvIeFE3ayZk+/3kiib2Nna+P4e+fueGf4TeZiRGnx5q0mxTV44CgJhbUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z5lHB9qL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sEy+CRWO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z5lHB9qL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sEy+CRWO"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HMXUXA029793;
	Mon, 17 Jun 2024 23:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=1pRXudNCjGrZZEzxt/Lc8B22tiTTa3XaahTf6WiIlFw=; b=
	Z5lHB9qLvN3fTs0rtmgv1aMaGIOjeer6V77+Nq/e2S+wOZbE7W1OY/PutoUWm42i
	mw3wYKDGCeknEh32jJKuZSHWaFMYaFnuap/aEzgtYf9qkqrJuxJ0zxAwRPtRvYUH
	BWPsjBWfrKakHFomseka+Rmo2xVEBGqligykyL3tkzWKwhxkZlbf7QlKSJG+hyMC
	NhU8uPBR71pNL4PsdMiRmPVQTLP0VZjjgtEurycEveC3vPYQ8082PabJ1iCZ+xZL
	FomxjGCPCL1zAOM2vJGpVAn7/q/TjcIoloYoqSpuwo6f3Bm+7xUFj0J1Ig1a9168
	44dAhTBvtwY3g2WYLoJZ0g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ys1vebu25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 23:31:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45HNNbhG034477;
	Mon, 17 Jun 2024 23:31:33 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ys1ddme60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 23:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwzMpbO0zYnkQhjJSOxD7ea0BQw5EiF1tvwEIvc8XQMt4Bum3a6AN7bkSD3m+RSU+cid4YCGvyZWZYXQmaXvKBS1P24q4W5X4naxm9+ij2Okdr5DDUCyVWFwu7+r2N2jy9ziot3cqBCFXaG/XM0i5B0Es9CTabHXex9tasxlWSTcfEPi2GPu6VJjgu6gTBr4zU8DT7DOaQslQveNocSIK8Cj75HMOz9ZBwQroMt05NuhXts+2FjKTFDbmOkeDLJL2TcHcntRtwugfB2DEVRFQ3ljxz2RubtLOotRDE1w24eyoKhCIzfGKzqyaRn8WrAZbVJE+2h/swQ0Cmu6WGoV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pRXudNCjGrZZEzxt/Lc8B22tiTTa3XaahTf6WiIlFw=;
 b=Dzfww/0sRcSsfViZ+NNsnTk+DYVadB/Tgb+WIsBtvlhISpH/gTNu6EUSE5EANM/Ii+yFWkUhN1XpU6COphrVhAxNQ3tKVqCbiIuPd/AnY9iDIqPmxeqM1rYD23sjnpySqfc9b2uVOFVSEN1Y6YQRiKEO9J//yac0E2ckNlbZlaneKGkKVvgvZi5oXetK3Bqml4uNQczo/wEUOkIFv9yk9BZmTz4RGixs0fWww6pQ665QipENVP4V9hD+hO0Ik7a6hrj7QM5UWpDsVeQIeamANMhq3S4sNQUGZDmJ1kwXUi2MPZxgKvXrfgauA19K5FQxcMhFCgLL6xOUkZuPvi10Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pRXudNCjGrZZEzxt/Lc8B22tiTTa3XaahTf6WiIlFw=;
 b=sEy+CRWO5EWRDWA8OEk3Gk63ERf6yHe/s+mKhtcLVVh0HCI4NV/Wzpbm01K2lPJvHwHc3Jus4kC0orRMUbHgOI3B5t9wH18NDnPEirW3uKnSroJDiU79zt7NvBKifY7xBpO1pIx6TeJDtryQVG8frWgBmFuj2fEVkcU0sKuWbKA=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SA1PR10MB7684.namprd10.prod.outlook.com (2603:10b6:806:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 17 Jun
 2024 23:31:31 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 23:31:30 +0000
Message-ID: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
Date: Mon, 17 Jun 2024 16:31:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Heng Qi <hengqi@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Parav Pandit <parav@nvidia.com>
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
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1718591277.4770932-5-hengqi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA1PR10MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 385ebc3c-43f3-4769-7d46-08dc8f259ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0tJdXlXS1Y4cjBXeGtuNWxad3pzelpHUVVmV1ZiQVIrWkpNdEZZNHBaYk9x?=
 =?utf-8?B?cWc0MXJWejk0N2JxcnkyVGtINXBvNTliN2M4VEFEL0h0T3JyNXJ5Y2JEK2xr?=
 =?utf-8?B?TXpoZ2tUb3d4SW0ySUxsc0haUVdVTUovQVIrTUFtMmtCNFVHUUFqTm1VajZm?=
 =?utf-8?B?N0RIYW5KcXVwajNuNXdrT2FtVjBoSnVydlJLWjhaSi9seTN3ZHBnZFFqMWMw?=
 =?utf-8?B?UGdIQ1hSNkNQSFRFTWFBTnhjRHJZOHpxbWpWU29tZFNPaWNkNTFIaFJRWGtU?=
 =?utf-8?B?S1hvbGI3ODRwcCtYR0RhOXRvTmFOY3JEKzFwKzI2ekNia0orMUpMa1kxVEYx?=
 =?utf-8?B?T2tleklmRVZmR0o5d3ZTdkRDSG16cHU5d2NFUUQvSlRRSmYxV2Zlc1oyODl5?=
 =?utf-8?B?TytNUDNWZnRxMms3MEhHMWltcnJQYXl0NXk3RXFtelJ4WlZxcjB3UHBMdlFq?=
 =?utf-8?B?ZjByS1RRVUZCTlNXdEQzVlVmMk9UUjlHdUhMeTVrZUpCL1F5bDV3bUJpaWIr?=
 =?utf-8?B?R3pWTHgwcEVORzEyaTlZL2U1K256czM5dUd1M2UrS0s4L3RYS1cxTWtRbW1Z?=
 =?utf-8?B?eFI0NUtKRDRwQ0JuK2xVTHg3c0FIeCtFdEZHTE5KVEdiU1Y3TkRQUTB1Q0hv?=
 =?utf-8?B?WW5HazU1Q05Pb21zMWVET3pZUXNzNkkybGlRUUszKzVVMU50aktWUlFuQ0E1?=
 =?utf-8?B?VWZyR3M1SDJIVmIzdmJGR1I1RXlQVm01QXBndktLSVR6QS9WMGxuTTJtaUQx?=
 =?utf-8?B?ZGhMb0krRE5jRkMwY1RSNFJLS2xQemIrYzlmQVdCSHNIaXdqTmcxY0FsbjdO?=
 =?utf-8?B?NVV0M2E5bmN6Q0lvSzIvRzN5c0RhSmlIWnl2ZUVnQ2FwQlN4RFhxSUlDMFIr?=
 =?utf-8?B?cm5pZHJsVDFkSWV3Um9hSVRDcXlFNFlhbEsxOC85anpPM2g0QTNwcXFBbldN?=
 =?utf-8?B?VEkyLzFyN1JLVUQxL2lCc0xyckJMMjVvejcwTGpUVW1DTlB5eldBNE03U0Yv?=
 =?utf-8?B?UWtVRExNT2dreEFQcThteHoxL1RoUUxSNFlPSmxnSEQ0b0JsYU1rMm11VHl6?=
 =?utf-8?B?MkdHMmR5YzBqbXBQdFdoSlJWWE5CQnpNU2lnR0JuT3Q3ZnY5UWJHNWRsUUVh?=
 =?utf-8?B?R0FGd0xFelNuN2RuaEV4cGVJZTJ1TGIzU0hzR2gvbjFVZk01OTBsejc4dmlD?=
 =?utf-8?B?bUM0cU91YW02cklUYnFob1p5VjhJNituckNuMjBXNWQwQnpRSm9DaXpIdnBV?=
 =?utf-8?B?aFVEN01QQTJXa2dsR0F6L1JMU2pHNVZXSVFCS2hBUS9ZbVJuOW5qNld0Z00w?=
 =?utf-8?B?OUNFWVVDY0Q5RUFFeVpqRXlkd3BXekY4MUFyOVZhV0RVQjRxa3A1b2xvK0x5?=
 =?utf-8?B?SjZGUndOdG5KNkwzdVJSVW8yNTJiYTZVdzMyTjNuUjNQMFFBOXRYMkxyNFVz?=
 =?utf-8?B?dHBMc0hGVi9Ka3ZNQ01halk2Z1k1aURpWlF3cW1QbmxERGdOejRMUDVscWdB?=
 =?utf-8?B?c1gzYS81aGhFbE8rQWlwT0tUUzdVQmE3WUJCWUZHOENGOENyYzBETVBtbmdj?=
 =?utf-8?B?MStZcTNWcGJTd203SFZLQncydXBQdzNMamxSSm9LSnJHVCtpdURiWmdDMERG?=
 =?utf-8?B?YkZrZnc3RWtIOXZ5MTZ0L041T1ZIUjI3dEd6VEJYRU1JU1BBRXFtS0QvNDhM?=
 =?utf-8?B?aXRMcU96NFJYOXc2YWxDRU1YMGY3YnNrL3hHNmRHeEFkaGNObGZOR1A1ZVNm?=
 =?utf-8?Q?sosqCg83/4o/AKBVaKwHUd5DDKhMy8B8aZ0HmsM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2ZjNzNxcjJaWlo1eEFYMjRacFR0UWdOQXV2dHY0Vk50QktEcS9QemdMdHJM?=
 =?utf-8?B?VVBJcUkvZ25PL1JBMHo4UEhrYWcxZmVRQVdUZHpwaDlYK0VyZk00V2Z0ZCta?=
 =?utf-8?B?QWlXRkwxRlVoS3Y3T0dERm84emFndmtHTUFIcktJNjQ0ei9hcVkrUWppMlpV?=
 =?utf-8?B?OGltalVFNERtQTlOZmxXbW1Mb082MFoycGgzcHk5ekYzWG1uV0FtL09hNHZE?=
 =?utf-8?B?a0EwdGtzMlI3Qjl4VUFrRFp4Nk5PS3Y4cGZ2Y3JQMTdYVERwbk9WbSt2Q2V0?=
 =?utf-8?B?Ni9RMzhZUGt4ZmRGU2YrYkNBcTlWMGJZek5TM2ZpSGQ0bUlkWHBmWUJIMzVI?=
 =?utf-8?B?VXdCMzBybTkzSnBBemlTQk9mWU9CN05vWVZYRlN5S3lBRUtEWWZNRmpkWHI0?=
 =?utf-8?B?QlFydHRQNmxadlREYS9qWUF1WGlJSGFLRkFzamgrWDFSYTg2dlBYR0xjZ3h2?=
 =?utf-8?B?QjgzeUt1QmtNNEZleVNRKzRRV1IxVS90M3lZUlY2RWxGMitTQzY4d3FCMHd5?=
 =?utf-8?B?WmtGUStBYUtGVzNBc3VudmlJL1NHVEp2SkxkWXhEQlFkM285Nyt0QXBxbnFV?=
 =?utf-8?B?RXJkWFVLWDZONm5LTlh0ZGkzWWEvaHZYSTZIVVU0S21tSEVsOUJ3MDBvdCtK?=
 =?utf-8?B?ZEw3VkNvTlRKTmQyTklFenJwSy9yVWFzY25mUHhqTStGenNYRFRtaUJWOWZI?=
 =?utf-8?B?VzVneVU3cWJtZng4azZRbGVaMFRHdmFjem5TOTJGdkZFL3ZIcjhuV0pGNk5L?=
 =?utf-8?B?dktlTHgvRG1Mc2lJbnhubnBXS1RxSnViS3djZ0wwdWJ5ekdvanNpNXRkQjV3?=
 =?utf-8?B?ZmpySVk0Nk9tSStPQkgrUWNZN2xVa0kxWDNOQjZaYkxhckY1ZVNwUVdyTXFX?=
 =?utf-8?B?UG1jbGpVTkNCTllacld4QUJpcEMydWlLQXJVUkQ2dXppYWlsMHBUaHBvVnIr?=
 =?utf-8?B?Z0pwc20rY1ZpV2FDcVJ5dEtuMldjVjNKZGlyN0F4bUZZcUhFQnQ0c2t4Mkwv?=
 =?utf-8?B?SlJaVVk1TENHM2I0VDJESzZidTkzYVFRdG9hdVA1RHJyZVAvSFdvaFdzdEZO?=
 =?utf-8?B?YU1Yc3Q1SlF5WWY2dmtnK1E0ZWdON0lRY0gzbVpHS1Zoc0RhaXIraHhmVFdn?=
 =?utf-8?B?VEg1bUpxQlltL1JEay9KTzFDOW4wVXhCNjhaUHM1b3NEMGw3SmtqSFd5SEZU?=
 =?utf-8?B?ZkRYOTFzd2tLOFhSei9WcnpRWVVJcks3VlNscTZmWEJHNFB1OTJDOVJCRGZa?=
 =?utf-8?B?dGt3QnhoRHBiZktNMkloYnpBNms0R1BoYlViaVMzWkprWk5HNE4rWkRKYWpa?=
 =?utf-8?B?VDNJRlJSY1VPZk1XMHMwSytkdnJCenRFTkdNZGROMDZJdW9UZktGYjMzN3M0?=
 =?utf-8?B?QTM3SmhpYTQyRTg5V0ZRTTFoWUU0emgycE5HM0gxbXJ5S3lkczI0K2ZnOWF1?=
 =?utf-8?B?MWpXdVBQbExSeERjVG1nSW13ekdTMjhVWCtNSkdFTkxlb0kvYWdxLytWU2ZI?=
 =?utf-8?B?Nml2c3ROYVNEZkJaWVYxdXdWRU44VWFDZzZwaWwxaXBjWWhjNERMQ1lSd3lH?=
 =?utf-8?B?OG1YcEFSS3NOWDJLRHBDUFBORHVtaGlEOXRRMHowVkdCRUg4M3EyYzIzNXFU?=
 =?utf-8?B?dGxhdDBTV1NRNXRsaEdLMGoyS2FjaHRBcStVRzVhL2g4aUgycXcrNUVmSWhM?=
 =?utf-8?B?UC9yQjRoOTYrKzhjM3Rta3ROWkIxWDRmTy9FQ015UDdUb21tVmluZ1ZqRWVY?=
 =?utf-8?B?Q2M0a2pJV1FKS0ZpRUk4NHpnZ21VVFdsRlZ3RHlsbVdob2w3aVVHdWZheWlT?=
 =?utf-8?B?dkEvVkxtMGUwWXluOUtUalpFME1YTkhTSU5lNE9aajVhWms4b1NkVWlzcWQ5?=
 =?utf-8?B?c1FYTGFVTFpnV1UyOU1EMGNoaHRGUmNwWWRJc1l1eGlQaFc1M09sOHlWYjFw?=
 =?utf-8?B?d0dReGZ5TjZxLytVSVltOUYyK1BuWXZiTXNVb25kVGxqYlNGUVEwYURTWkFa?=
 =?utf-8?B?ZUsvd3lvelR3Q2UxbnJJbjZFc0d1dHVIZWJ4T0k2OWhCK29oeHhrODV6aFpq?=
 =?utf-8?B?QkEyb0h1SGhvc2Z6YVUvRStPdmpQS0VmR3B3K29kUGJINkFWSS9iZWROWm5B?=
 =?utf-8?Q?a9k3AZtmY6AFfOGqCgHEgJrAN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eAcXvsHZ63tfpbQsG+w8OR2o/Nn94GbPumoL8BONGJI+AAJ0EcSpjHdESqI0/NPd+QaeMtkco2EMcE2NCmAynnSeAdG7Ce75wcE667z9Fj7Iy0ltjxB8Ne2IRyDS7vtJubpiyQIQ/IuF38DEIITCSy1E88tieb7SVtGcXvgsHtdgrrE94cKPVrTOOxDyCYRM1YQyMouyjMk5ZKDBmLsclpvWguNxH9l18yc8ggZdNqR5mpQk1hXri78x9i0V9TPpzCufy5AC+XVj4QSAfMd95BSy1nb2TNn4VobKwGNM4WXhR341xotlEX/NmJraZUkgQaxAhEzQ0NAzSQIlfYxGG0U78NPyPeoXrPzGwGE0TQsuuLGf3XVD7KycgCrXkhzdf2R1fmKaY/vlesqQ2G9OVO0xmXTZ8PhuygntCmOvCu/KNVuElt9OgZ+5XtsKKNZ6E25fy4Svw6Jo+pQV8gaLKZtmOWcVh9vKSicMQvAb953vSEpleEzPcJv66qZyRx7Thvsyan3NnaSYsZFaY7N+4I1n5D+AclUUn2KvWpCUabtjB5MH4BxFVmYyaDqJR9qG4KaCxhV5+lsQKpZpA83OCEx4cdLhwRlL6XLfeuu/MKw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385ebc3c-43f3-4769-7d46-08dc8f259ded
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 23:31:30.7990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //8PGQQYB2kcbcJl02qqG78TVYXmeQvmXARRgkQyCHieVjG7oLnlFtc6j1NFe0rLCC5Hj6iblQtaby4Ue6GGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7684
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406170182
X-Proofpoint-ORIG-GUID: cwOQjNVhCZKWgmLWQAlGTopVmNrUNpuL
X-Proofpoint-GUID: cwOQjNVhCZKWgmLWQAlGTopVmNrUNpuL



On 6/16/2024 7:27 PM, Heng Qi wrote:
> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
>>>
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Tuesday, June 11, 2024 10:00 PM
>>>
>>>> How we can we make progress with
>>>> the realease but sure we don't make backwards compat a pain?
>>>>
>>>> Ideas?
>>>>
>>> There is no functional break with this relaxation.
>>> Device set some non-zero defaults and driver didn't modify them....
>>> Anything broken? Unlikely.
Generally it's inappropriate to leave this decision making to the device 
for what would be the best / most performant default config, as the 
device is generally considered agnostic to the guest load... Unless the 
device is specially hard wired to some fixed guest setup that users 
couldn't change, it doesn't seem logical that the device could derive 
the best or most performant config on driver's behalf. What if the guest 
wants best latency for its load but the device just blindlessly guess 
the guest might prefer throughput friendly that it miserably uses 
latency impacting non-zero default? Could this device side change for 
the default config regress boot time performance (which may need best 
latency over throughput)?

>>> And device/driver has better performance, is that a problem? Unlikely.
>>>
Even for rare case with a hard wired setup, the way to tackle the very 
problem using device's default is still quite questionable. Usually the 
mgmt software or network config utility should be equipped with some 
default value if need be. And we know the guest has the best position to 
impose the best / most performant config for its own load. What is the 
issue or use case that this initial config couldn't be applied by the 
guest mgmt software ahead but has to resort to the device to load some 
default (which is odd and irrelevant to any guest load), before the 
interface is brought up for operation i.e. performing I/O?

> Sorry, my vacation just ended.
>
>> Yes, it is possible. Driver can cache values it sets
>> and never query device with get.
> Don't we already have a lot of behaviors to drive queries from devices?
> RSS context, device stats.
>
>> Before anything is set, driver will report incorrect values.
> Devices that are widely supported and supported by good practices should have
> any initialization value. Just reporting 0 is incorrect value. Although the
> spec now says so.
I don't have an aligned view here, sorry. As I recall having 0 as the 
default is just to keep device started in a state where coalescing is 
disabled, so it's backward compatible and consistent with a 
non-coalescing supporting driver - such that it won't yield surprising 
effect (for e.g. regressed latency) inadvertently after user's getting 
driver software upgraded. Unlike the other virtio-net features that 
could 100% improve performance in all aspect, this coalescing feature is 
more of a performance tuning knob that may improve performance metrics 
(such as cpu usage or throughput) of one dimension while demoting the 
others (such as latency, jitter or connection rate) from the equation. 
That said, there's not a single and fixed set of default config that 
device could supply which is able to satisfy all kind of guest load. 
Rather than rely on the device to offer a matching default for driver 
(which I think it's technically wrong), I'd lean to having guest 
software or network utility to apply the initial config for the guest, 
where they should have best knowledge for the specific guest workload 
than what device could do.

>
>> What will break as a result? Hard to predict.
>>
>>
>> Given the patch is big, I am inclined to say it just should use
>> a feature bit.
>>
> This doesn't seem to break anything in my opinion, we just told the device that
> now you can set more values.
Another thing this could break is live migration between devices with 
varied default. How do you make sure the guest doesn't rely on some 
default from the source device, while on the destination it just doesn't 
get the same default coalescing value? To get rid of this side effect 
the guest would still need to apply the initial config for its own, 
anyway... Which eventually would render this proposal with arbitrary 
default rather pointless.


Thanks,
-Siwei
>
> Using new feature bits does not seem necessary.
>
> Thanks.
>
>> -- 
>> MST
>>

