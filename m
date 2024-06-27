Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3517BD3
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508512; cv=fail; b=MukAUMvDPZN8Gstv2X2nCUMd7jKB6WdD1a92EH7Z/+RxiBUlFRoiQoMd9x2bA4eI/4YVblu3SQbGjWI7ltXh1pv8Q1DqR/e2AeSE+tlIhI3i4XaS/vPiz1/B5Dy3P4IetyU3QjBcr0hK/sXDp1k0AaSBoWJb0T/Ax3RCpSQ27oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508512; c=relaxed/simple;
	bh=sxNsHjQ+0rDq8mgbBD/k/vsj+QaBu3QGgKDQ3x2me2A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hpq1ZybUZmQlaFS2B6KgfjZp+QCZR3htZKxNnbPd972DnPIaBCi5LgRBk6Ah+Zto5Rw5QllEH8xzU8bg1gRTRwksCPLN0xNIvjbKYpxSdpJpdUtNJj0FgdcAEOkLXREfc43geNRtyW69gPoQFAS3JtosyA5t3V+hNnUcq6EzItM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ceoJNm74; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CPkmcHsg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ceoJNm74";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CPkmcHsg"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RFtTm8024717;
	Thu, 27 Jun 2024 17:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=gYQv8/k/g3yM38hCroX8ZnV8bEoBTpho3JSPBJeyOYg=; b=
	ceoJNm74GEhgTNo4oVzGyEqHvtmdD7EJI3suvVg/wu4xDW69ElikNh41zQ0p6VQE
	j9ypN1uyC1kk3XbsftMTULEFNVIflVgimkl8xUCEbWxyg8pMV+gtZTgg6gjcIRFU
	64SdrzHrF2atMuxUk4V/j5dImsk0rpuDYHgIRFxP5+xTvpGcAgOf0BIZ1XddXlG4
	4qYww76d8RSU3n6TFoPwxFae5QQ5cXnaC9zUwQu9ZSqYpEInAAkmAFSbToGIKFwE
	SS/KMWKcbPz790ubAjzVLkG26IJzGd4DTyu7vBSJURvWR+0sSnWNEiTPJdJwnw6/
	FIJR2QkiaVL0XXouP0jqOg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttna7qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:15:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45RGIk5X017874;
	Thu, 27 Jun 2024 17:14:59 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amves-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXauWr5GpQ+UVkhyzOi1e9ci+dvBgzrH1Oa6hCeFaKtxpV0QQ9U5jYx9YVNaZ+vIoA0oTjDWCmVIxfgXjXn7wT9Sc+d7JQffSxTlwUkEmvzF4NHu/QY5v4eHsHL3JUVhRyb2LSbBjlpSVr3xlBBSondZWceNqC0maOAL7NZcoSf3GLv7vOVqXaSlRAQYZkd5VNcQOIHlvFE4zPiy1MQUw28bYk6TU7kkRfFetbnwnPIoK1GvW0ZBhkkvYmsru1/We+HtesH66gSbgGXUqzmz0D84gnUOoP7HRQnp+xl1Iwzwqq0MMK28WKFXIY7/CVpXoLU8k7lTCQgkkKcyG7W9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYQv8/k/g3yM38hCroX8ZnV8bEoBTpho3JSPBJeyOYg=;
 b=cnCCjD3soEmqbcspcCEVyoS2AITl3N174XJqrPggk72z44Tdur2JdW0N2ynAbAkIJ1iBGxHPEyRZIcJAQ5bBFeS4WqjYZdLfHbE+aw8FyzNtNZj8NmdXcurpMwdXGfHYFWJK3P3OkqGV7DBpnAiyOWvP/DLkzzalTqRgvwbNwaRpnnFrvKviQK/+vpjujwgczbPm5JNWYf1CvZRC3/4J0a5x9qfiFo52fg12kxGfSAJIWzBZD2/thB7QejKEcjp0ne5wOL4sYsnwN2TtOfgtA468w4MY9TJS5NTkSEL9D5QWqk6HEE4Q1fW0CSG4JL9kY8HhZcrj8Cybzk8vyWaXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYQv8/k/g3yM38hCroX8ZnV8bEoBTpho3JSPBJeyOYg=;
 b=CPkmcHsgXtMpQl/fVU/UcKiu5RewNe/SiD5YnEdJDYZA7+L3frIffoT09cAzYmL8pgBzjfUezENV2AA0sOk5HcdPB1zba6UmPenVskeR92L+IE4shtvKnKloMjEyKzNwg5fCaFhn1jTgaw4r/4G29OXLfjNqIbtIankqLP5LUO0=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by PH7PR10MB6275.namprd10.prod.outlook.com (2603:10b6:510:211::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 17:14:54 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 17:14:53 +0000
Message-ID: <b57acf4d-84e1-4360-a229-eeb7b3d752fc@oracle.com>
Date: Thu, 27 Jun 2024 10:14:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: Parav Pandit <parav@nvidia.com>, Heng Qi <hengqi@linux.alibaba.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20240627080346-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|PH7PR10MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab7df4e-526b-4718-192e-08dc96cca953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?azhJb0VydHJzeFJhcjB1L3o3OXY2cC9NUkZsSXNzdkc4MEcrVXRLcHY2WlMy?=
 =?utf-8?B?YVpSYjBOUVlUa3pCZytDTmVzNi9LYnhBamRkQVp4S3lwN3pQSjFhRUdpRlJG?=
 =?utf-8?B?WEI3RlhDN2FNemJTZU9CYTVoclRIVEo5NllwaSs0cFdrcXBXWVdUYUFTMitq?=
 =?utf-8?B?NkVvS3dXbHhkWEJBL0lCbUJlemxWbWhZaHlqUWxkQXh3Yk5VakZqTE8zYno4?=
 =?utf-8?B?aksrMkNBOTd4eml3cUtBS3kvQ05QeFdSSmlNS0VhaUU4S1M5YWFBRUlORFJn?=
 =?utf-8?B?QmN2djh1SmNQazluY0drMkZIOWZMd3pKMzcwM0xkNk93RzVrUnFiUlIzcFhS?=
 =?utf-8?B?V2g0YTRjUHZHSkFjN0Y5a2NyaUNPOUhYTS8rclVVa3FUQ25ySHArQU1YdjFL?=
 =?utf-8?B?OVlXWjJNV1JWdFluSjl2bERId0hRLzN6UTZ6amxXQ2d1SzdoUk9VS3B5SFJW?=
 =?utf-8?B?OTdsK1NlM0pFRWhLQ2pKWm1Rbis5N0pzSWVLZ2FHSFlPWkY4TUxoZzQyZUla?=
 =?utf-8?B?VkI4cThHL1ZabWhHRGRUbVhMZ3RvOXlBL2p0LzBad0IrcmIzVnRGYlg0NDRB?=
 =?utf-8?B?K0RPaUpZZzZMMDcvQ3ZIZmRLRGY2VC9hSmRVemhqMHZEZ2RSaG9zTDlRSVp0?=
 =?utf-8?B?WDNpbnB6OGZaWUhpdkJoVGtnNlBhYmorNUxGajFubFdEdW5FUE1wMXNoN0oz?=
 =?utf-8?B?MGZQdC90N21ZK00rNkwyZ0tibUNIY0JyOHptbmRlb24zejl6S1kxb0dGNWVV?=
 =?utf-8?B?dlJJdytmMkZ5dmx6V2R3ckVTZ3lDREFIOGlPc1VjTE9jTXR3cEpHQkp5WkFN?=
 =?utf-8?B?T2JoNDVpWjZKdVF2ZkhQS0cramF0Qk1EWm5mbE1EMC9aVUVwYkhzenc5WXpJ?=
 =?utf-8?B?WTM4R0E4M3UvOWJ6bEUrUkhrZjdkdjlWZGJmTVVaN1lqVldzWjUzUkJtNTFD?=
 =?utf-8?B?RmtrNmorZ2ZoTTk3ZWdvb01lOVhtOFQ3VHFWbkJjaW1DRVBJYTdWT2N6RTZV?=
 =?utf-8?B?bUx1WENBWUJDcFV6ZkZyb3Jac0oyN200eGpTQlhjNkdyMFpoNVlqeVQ3cm1Z?=
 =?utf-8?B?QmlxNTdrcUtVM3lLVE5mWFdWSGFpK2w1L29JOXpIWnZmaGZVOUo5ZVhObVQ1?=
 =?utf-8?B?aDZLZ2sxbzgwNmhaRGRDNENkUHJmd1pQRlFobHAydlY1Uy9vUEwyMDNGeWcw?=
 =?utf-8?B?cFRrVUFpY0J5UDVTVGo4bUxnZ0ZpaitKN081YlhaeGxGVXZnZ3V3VkZRNStT?=
 =?utf-8?B?NEdtTjhFUTI5R0ZuODg1akZhM2MrSklpTUw0U2wyUmQzc0RJWXFOcDMreW1U?=
 =?utf-8?B?eXlaMU0xQS9jdlFJTVdyOVU1UnNyd0RVUnFTakU0aXp5bGxJa3Zya3dXN2VY?=
 =?utf-8?B?S1pvK0RycFU5WUx2WTR5NE9tMm02elZ2MGxIeHlNVGpWL0ZRSTRmcXN0cXVp?=
 =?utf-8?B?VmU0ejFZKzZaQi9kMnB4eUtwbU5STDEvRklIeGJCSGNvTjAxbnR1RmRNTnN6?=
 =?utf-8?B?M2FvcGk4ay82Z0Z1WUtCdHEyZzNBUmJQNFBxQTJzUUUzT1E2T05CS3R3VFJa?=
 =?utf-8?B?bGpmZlVNbVVGZmFuRXJiZ2s3Y1BXWEtOZ1VwMkRBeWZHZHA5VHBQOE5ZdXZC?=
 =?utf-8?B?Q1dOLys5aHMwL2JiRUI2WVQ2WGdYN0Z5VXZvdUdwZmJiUHBCQ1BrejBGa0Jl?=
 =?utf-8?B?WWIxOGZHMnVHY09GMitGS2NyeTJKcVkybmFBcDRPRDhlVitjcFQxT1hnTDZl?=
 =?utf-8?B?NXFFM1c2RERKcU5WZVpwTHVpMFY0R2RERE0xc2prMjVqREhCRzFzc0JuMGpJ?=
 =?utf-8?B?UXZOWm9kNHpwcDY5TDhLZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck1HZFNsNnhqQUNVMmdTVGh5UTNZaUpRdzQ0Vm8xRmZwbXltZGlidGZpNkRj?=
 =?utf-8?B?eXNWTDUxNDdnUWlqTHlXV3BiUnNrYXZucE1PbnFYWFR4bmZZQWtJZVlReHRB?=
 =?utf-8?B?RkJmeDNIZ2YwL29HMUlLdWtNaXNYeXlMd2l4MTd3cmZnV3Y4M1BmNzJnbTJ0?=
 =?utf-8?B?a3ZlOHpabDc0N081bE1CTEdxZGVQVmtEYkdMMEJvaEwvbUM3ZTRaZTJqMkF6?=
 =?utf-8?B?SnRQbWg0MlVhaDFoM0pxNDdPYWJjblRPVzVJWmdkNmFnSW1TdzhWdngxWjZk?=
 =?utf-8?B?bTdmVmoveGlFME5UK1Q2TTlNb3VlVDNsRGZ3clE4ODB0OHozNi9ocFhJQ2Ra?=
 =?utf-8?B?WWJvazYva1VaUWxGVHVDZGg2enRYanZ6aHBHbVgweE9ZWGpMYzRtcnl6R3hj?=
 =?utf-8?B?Zmcra05JdXNXNm5Ta2VGT0hUYnJuc2dmZHJCM1J3NTZtenYvc0p3R0g4akZl?=
 =?utf-8?B?N0tQamx1WFV1WXBhNVlCcDEzRHFyWHB0SS90QStjd0g1NXNZaFJyK1Q1ZW52?=
 =?utf-8?B?RGNPRFYxYzliQWFDUEtuMTBFYjBOYU9rR2dESHlKVXQ1S3dUamp1K1VpZEcw?=
 =?utf-8?B?TE5uK25MUS83ZVIwMmhzUVljVk9FdkNmRW1KTGN5Zkg2eVZLc2ZudnBIbW5E?=
 =?utf-8?B?RVNsZnRWZHJ3RFRlTG83NUk4T3gvMVlSNW9iR1lXQ2RsZmpBN1VOYTBVZ3Jm?=
 =?utf-8?B?V0E4ay9nNnZRU3pnd1JqbC9NUGliK0swSHBvOHNnRkJINkxrOHY1Wnh5WU5o?=
 =?utf-8?B?VG1UNm9QeVlBNWV3QXpMSGVtZG5GaUp2SzRqQmdISU03cUhvVkQyU3ZndzE4?=
 =?utf-8?B?eWY4dmdreGJkeWZBRTVtYXpUaDVrVDBQb0QwMTB1Q0t2NWhPWFprNHlkZ2lY?=
 =?utf-8?B?ZXpOWWxNa2lhQXVuNWZpeVpZTHhqc3hoNHZmNzdvMnErNUlmRGJCUUVpeGZv?=
 =?utf-8?B?ZGtXbVN6MDFPMGI4TlZZTWRDdTRpelMwc0lidXl1aVJaQW9UaElheHhicUY2?=
 =?utf-8?B?V3lqdjlvZDc1b05iNC9OT1Noc1ZSVXFPc0R4ZmFKTGpiUEovS1F4UU9NMnNj?=
 =?utf-8?B?QWk4b2FkbVp6ME5Dc0Z3b3BsMEQ2d1JvV1k2YlNCajJ6RHdha08wTGtGV014?=
 =?utf-8?B?cndJTHFaNlc5dW1GNkUyemxYTHV1a2t3ejQ3eDRGenZ3L0RUMitlLzRrMUww?=
 =?utf-8?B?MDVORE9ZcWFxb0dIakFhTmpIQ1BwK3NuTFNONHV2Sy8vRk5Ca3ByUjFabGJJ?=
 =?utf-8?B?QjduTWpoemVhL0drMmpnM245bGFYSTdZU0I4QWhFTEcvODAyOUs5Z1gxakhz?=
 =?utf-8?B?YmxZSlBhaVBaemhjdG5iOEd2dElaTi83VDNraGdTTDdXRCtxRTJTWnV1cDVw?=
 =?utf-8?B?NUwwNTZzZ3JKN3R5bnYrbjVDUXhrSUwzaUhlK2VPQUlkNFpCNnU2SjYraURx?=
 =?utf-8?B?NlZUR3UwRGY4dUovYzBxaWF4K0l6NEk2U1Bjd05IRnBibDhCdDNpM3o5L1JR?=
 =?utf-8?B?Uml5dEFSblp2a0k0eFlzUDNYQmtaRGhWRW9oNWpiM3d1SS9qanIzOTFicFh1?=
 =?utf-8?B?SFBQSXhCQjl5b1B4ME9WRFZRVkFDMzJZbFA3VDM5VEh2SCt1cGN0T3V1blZH?=
 =?utf-8?B?R3VGVmNVSzNOUTRSQzNWamYyY3NYbmd5VDVwV0JmZHlBYncycWI0N0Z2bWVl?=
 =?utf-8?B?MVlMb3FuMnJFajU4TU03azQ1dCtibVphT0VhUHJYZWxHRU42MXE1dC9HUUZY?=
 =?utf-8?B?Z1piWEw5aGZkZmZveW1UdkRreUtVMG16NVcwZDQ2eHBkRmRVVzRLRDdHSkpu?=
 =?utf-8?B?S2o2eUJSWURpMTVSUGdqRGNBaXZWb3JIS3IyOVdmRE5BY3JyRmlPeFUvc0FJ?=
 =?utf-8?B?RTloS0F4R1dIK2pGbzdBMTk5MWcwb3NodFh5U0pkWlBEQ1dhSjNLeklrK3FP?=
 =?utf-8?B?RVZST0Z2TzRrWjl6bm02T0xEVTdQc2VjMFZiQVgwS3lXTTNteGFJa1oxMDM4?=
 =?utf-8?B?U3k4RjNaUnc5ZTVTNFBpTnpXRmxXcHVjQlk0dFJxelBRRGdwQzJralhGMGlO?=
 =?utf-8?B?eHZ1MVFVQjhxbStqYmdLQWFXb056RHJrbEtVNzhqRHEzNXZZekVXcUsyZ05W?=
 =?utf-8?Q?+H/E7RppkZ1xKCqIGLBqMq94+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	J1J0wdajojp8CZ3Sgik4bPPqxKqpJ3Q+fsiqEWVCRq/VF1LnLQ4ROvwBUj6L8dvV9nnPlxGlmrAz2PkRRvQ/5Xh2rFmaJV4Ddp2vnje7HrPnz6HXKIihigzgR9Gitg/3YnQMoXSmekj6NGouohaEItveafZ0cUXnorx0KPGkWLEBkUPBsOQEmSPEGakGEBFvWWbmLym/1+7Q2bSVAe/HoWz6u8X6T5auAT8hhYUYD47pL5ZfrEEIbSiRkia9ewZW2As5S2TCibUjHi74wXZTqNA0YGpHB1ZT0sirQzqAQJfWZRUJpPuFAgb+5fvqonKk2VU0jnWxAnLPre425WNu7ysDSI2t1JRb/QTMqt4ybgkdkXu958P3ie7Gyr6wwRln1FNLFVEGAqV3xOs4kjTLcR+vCBzWkz7hKicpgQrXIzGbral12KuuWuXDyl2ExonQ5n7dGTkjE6IBIshAPzGOgnp4+yC9kvgD2je4URosS1LIcxJKLQD8BnIQpurlemgVXyfAsu7Y9FQw/vIwGKLKr+YSkFQyoDYK1Hf+MLqBnQ9Nl0kZixZ2VHJiZmndPk2STMDQrz1fT/kUZgSU0Ueuxz+K5dhsY7t/lUNdHsf9Y9E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab7df4e-526b-4718-192e-08dc96cca953
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:14:53.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nswINaQE3Uiim47RL1wzbvWMkrusFof6DGct7mo+Dh+Kp+PGw+KNKzbzzle1eri2Ken+5vTsNkIOlW3AUlR+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270131
X-Proofpoint-GUID: rN6XoSEbWp1Xz3prFb1wTGhCSJhY0q8F
X-Proofpoint-ORIG-GUID: rN6XoSEbWp1Xz3prFb1wTGhCSJhY0q8F



On 6/27/2024 5:35 AM, Michael S. Tsirkin wrote:
> On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
>> On Tue, 25 Jun 2024 18:14:15 -0700
>> Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>> On 6/24/2024 10:56 PM, Parav Pandit wrote:
>> [..]
>>>> I saw the need of this proposal slightly differently in the discussion with Heng in v4.
>>>> The way I understood is, proposed relaxation enables below Linux driver flow to work as equally as without device offering VIRTIO_NET_F_VQ_NOTF_COAL.
>>>>
>>>> Flow is:
>>>> 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL
>>>> 2. The virtio-net driver negotiated VIRTNET_FEATURES that has VIRTIO_NET_F_VQ_NOTF_COAL
>>>>
>>>> 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is not applying any coalescing on the VQ, in a good hope that driver will perform VQ notification coalescing.
>> I have certainly understood this differently. When
>> VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not supposed/allowed to do any interrupt coalescing (notification suppression may still apply).
>>
>> If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
>> to/MUST do the coalescing according to the parameters as described by
>> the virtio spec.
>>
>> Michael, Jason: Can you guys weigh in on this?
> I still don't understand why this change is needed.
> We have this text:
>
> 	The device may generate notifications more or less frequently than
> 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>
> and
>
> 	The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> 	the device MAY generate notifications more or less frequently than specified.
>
> So with no spec changes, devices already can do what this patch says they can do -
> send notifications less frequently.
Right. If I still recall it correctly, the above text was to accommodate 
the interaction with existing used buffer notification mechanism, 
F_EVENT_IDX or whatnot. When coalescing is in place and effective, 
interrupt delivery is a collaborative consideration based on the 
coalescing parameters specified *AND * event index / NO_INTERRUPT flag 
as well.
>
> Re-reading this spec text, maybe the confusion is that it mentions set
> commands specifically? And it's also stuck in the middle where it's easy
> to miss.
>
> So it would seem that the following should be sufficient, and it looks
> like a small clarification we could just apply and include in the
> vote for the csd. What do you guys think?

The revised text below looks good to me.

Thanks,
-Siwei
>
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----
>
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..d6788df 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1711,8 +1711,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                           for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
>   \end{enumerate}
>   
> -The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> -
>   If coalescing parameters are being set, the device applies the last coalescing parameters set for a
>   virtqueue, regardless of the command used to set the parameters. Use the following command sequence
>   with two pairs of virtqueues as an example:
> @@ -1726,6 +1724,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>   \item Command6: VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} = 1, the device responds with coalescing parameters of index 1 set by command5.
>   \end{itemize}
>   
> +The device can generate notifications more or less frequently
> +than specified by the coalescing parameters.
> +
>   \subparagraph{Operation}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing / Operation}
>   
>   The device sends a used buffer notification once the notification conditions are met and if the notifications are not suppressed as explained in \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}.
> @@ -1798,7 +1799,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>   Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
>   to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
>   
> -The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> +The behavior of the device in response to specific coalescing parameters is best-effort:
>   the device MAY generate notifications more or less frequently than specified.
>   
>   A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
>

