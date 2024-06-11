Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079D17839D
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100748; cv=fail; b=obuTre8TJr4A2NDETKf2LawbZCB4hL8GYsqBgIdV5cYKjS3G1eMR8Xc6sJ3TBK9xwavLeYBEh3Wk1wHABxkylocZTX8JAksyAXarHK6YgFpiLmJsXCxcCRxMGhV+wZAcap4LeYa9fr+DKWW46itKIo4Ek0z+W7IF+pkTmVkQmlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100748; c=relaxed/simple;
	bh=AoDSxxXp/2tvSKXyswfgk+Y7vX72+snGe0jo/EdlBuU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YdA44HNkBvTdjNiykDLC84VmTYwarZpbERYQV9CfWM17Vla0AzdVfE7SSacJjH4hPqc8WO7fjtoAWskYgTwfN4vTWy7rs8n9lO7NveBup5s6rCJ5zq6ck2s3+zL8mkidDtGbOL0WBcruvw99XYtUyQtK7x5gv3SE9WiK6QfWDsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D3pVY1Se; arc=fail smtp.client-ip=40.107.243.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D3pVY1Se"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSIduJCKpA6cpkvgG3ejrp/rLBVRPlNyUJWzRTlqDjXTBYRBq0j5WWq506KeBpKCxgYB6X0eyUHU3Zd6xvzqG5GGP7KLaBJst33sZH1QL0mCB//5GD1mQCmatGl+rWlzFNUC+siIIR2LNfaiDXKK/sFrZX8JXrIC2cnUeQaAcgb2U6heE7GrNXXqSq1U5cKEin4JUeXxcLzf+/1JxYSPinHuLXyNH6e7xQ5xWyDrObfH3zmZDIxYJBCNtbOzpRn05HN52YI/s6n1XrQNSbufgJFf62qLUIj6camvZgLEytygcKynyw/L92F5fyHsCd23lo/WIh9mQ9t7FS8A/WKZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4Dbr9zwIaCOPBbcHdetGfu59+32j+ZBRJ7Hjx2NB8M=;
 b=m8+NF85i9YkHf+C+sYssPtyqeg+sYtas08tCU0ct0bueLCddR75YIKEuuKedB5Um28XNdMzQy3vYmnEUm64uSBe/wsg3vzOT4BQKK1RHlAp3vR0iqJf47DjmeVRNckTK0UpLmkNozoRVcjaHBw3aj6ShWX4CfnMn80GM40MUubSDP4tWTVgIc0uGcPH8/ZKOMTtkFswEkyZ3QEBAHIzLqQ05nV0Qy8GIf4PWNjdkt1e31soEah8Bo8HHMBRp9cdogYo5H8HxJ4LPWkEtQjEEEueB6n0W+nNnxttEkz4ITXCR76sLouub8Ph28IEVyfZRklUTlv25kQJKOAUebiv/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4Dbr9zwIaCOPBbcHdetGfu59+32j+ZBRJ7Hjx2NB8M=;
 b=D3pVY1SeXsleRxc1H1RQ1Dcsu7pH7rT18jmqlUKYzzt/q4U9zCumW+byY00uTHl8bXHw01IrTFN+2/A7OuAx+PUe7OEfZ9/Ip8ze7VrbPzjqeZNqorOIqPFDX6f5VXQ0G4VsHYstNzU7a0L/lFsFskYpYoqFtRfbSnprUNTrDCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 10:12:23 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 10:12:23 +0000
Message-ID: <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
Date: Tue, 11 Jun 2024 18:12:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:3:17::25) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 060e5066-2a36-44b3-4883-08dc89fefc7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkpEQlRUK1J5SXJMeEhTQzcrYzR5a0Q3bjNKUDkrb2JVdHlIUXg4V1JnR081?=
 =?utf-8?B?SVhSRGd4Y2U3Zk1FV0RNRDVWaFdsQm8wSG42TGI1UUlHTVF1SmtKMkpsaDVY?=
 =?utf-8?B?V3ZENko5aStvUGsvbjJSeEY3Wm92UHQrdTIyZEZJQldGRkNLdWtDaTdmR29I?=
 =?utf-8?B?TmcvTjB1M1RLVVkvQUhFT1lXWjloTlU4T0l1RVo4MWNDWnRGNUZyTitkcnBE?=
 =?utf-8?B?MGZVN1JxZmZ5Y3gxUTZwNnZrc1BCcm5xYlhIUXpLRURoNnU5cDFqM3V1c3d2?=
 =?utf-8?B?eVNCVlVNNWRkcUc1aUQ4MDF2bGlwb3JwZVp3TGZCclNYNVN6bWM0OUVJNEpk?=
 =?utf-8?B?SmJ0WVgvQnhUM0RHQkVsMzVoMWlVUlJwYndjb043a2RKazQyZklLT3d6b1pB?=
 =?utf-8?B?L1FYVWNRbEtiOWhucXdEN2c4Wld1aWR0NE1DR051dW9RRkI3R3daTnVpUEg2?=
 =?utf-8?B?dGNERC9lTVZHTU44YTJleXdtUGpDZTVxMlJOVnVnS3N2VU55WkRiMFdYdWZB?=
 =?utf-8?B?OUJ6eUlBYmsvVnJnSnRVVUJmL3RFM1QwQnJ2TkhNOXlSRmMyWjAxcnNlL0x5?=
 =?utf-8?B?WHhWbTVsb293RHpoUDcxNHo1YUgzMG9XbHlZWmdSR3lPZ09pd2cyZm12R0tP?=
 =?utf-8?B?dTB3T0lCWU0zdXp4Y3FyZXh2SGgyUkZSQmVnTEpVVnNJaDFNdXJKYjBjMGVF?=
 =?utf-8?B?bUcwMlBybm9BakJSekpId3NYaFhGR1cvWGthY0xYNno3dXEwVzdpNG5hUXpw?=
 =?utf-8?B?Z2gwQndCQ3YzbnFMQW5TN29WeEZJZzExUDdad1VkZ3RTMmNGL0NLU1RFZCtr?=
 =?utf-8?B?ek1Pald0eUdFdTlhSUlxQVRYTkhpWU5kRW9hdm5iSnJhV3M2NUdFUjZvZTlq?=
 =?utf-8?B?YlZSYy9mTnMzMmtieEpveEQ4M2pGc205b1ZlVlJ1YUtVQVZCaG5LZDhEQmFU?=
 =?utf-8?B?NzdtZmcrOHBoWm5ORi85MnJ5cmpLS2NaeGtoU1d2WlMrUy8wRi83NTYyeExC?=
 =?utf-8?B?Rm9aRVBpc0ExSUE1ZXZYdS9wMDE4UlFYdklja3VKY0RKYU5YREY0V0g2TXRU?=
 =?utf-8?B?S09uZkhwc3hUSVlTU0pzdlZuN21oNGpUN0ZKRDZrNUxQSHhXcUhqMTFPYmIr?=
 =?utf-8?B?TDBTWkZ4SC9odjlkR24vRWkwaWpQUHlkUURYYzB5V0orRzBVeW5NS3lFMDRE?=
 =?utf-8?B?ZkFJaWpkY2RYTC9xRDRhWS9sOHMrWjhSN1hReFdPY0tMZ0pSMWxWWVJLc1NQ?=
 =?utf-8?B?cTJJa2dCbkpaeGlNSStDcmc3d0kxMk9MdENwTTNtYmgzTHlmcmZQdEF6MGJR?=
 =?utf-8?B?ZW1vMkNqSEREVlJQQ0lKME5FaUNXcmczU253c3czcFFsZmlzUzc1cHhxbjJI?=
 =?utf-8?B?YStYYkFZUFdPTWxKNEVyWHdVb2lZa3RHQm5ZcnhKNTMzV2pGc3VzR0JvSW9R?=
 =?utf-8?B?TkU1M2t6R3VwVExYbE5NK05vU3Y4R0o4RGY5VmlvUjhvUXZCOUUzRmpqV1hv?=
 =?utf-8?B?a0NYaUl4cVZKdSszanRFRWs2N2hLK21hcEhyaC8wUUNqb216bnNYTTZVL1A5?=
 =?utf-8?B?VkYzbVM2MExXTVlzUllWTWJ0N1BXWTZLT3pZemk2cW9WOUpwcWdYVTNXME1W?=
 =?utf-8?B?bFNBYWU5WUNiakdjMXBUbG4zY0JLL3VtNy8xMDFtM2wwV2I5NGFCOHE2OEpx?=
 =?utf-8?B?L3NldU0xdGZ2bXJmYklVOVVGV1BSOXAzcTYzdWtSV1FzeXlzWEhBTGVkRStW?=
 =?utf-8?Q?GjR8tCpnXwEGijpi0EH9Lu0XpWwa1nDrXMVRTR0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDlOd3FZVjlid1JESm5jcCs4elAwM1dZN1hSK2NucWx5cGVoZk9SZ1dMYTcx?=
 =?utf-8?B?YWc5T2d4aWV5WTRxRXIyUDRoOEhvZDlpMnpqR3lHY1hKZnJ4d0Z1ZENsQkhk?=
 =?utf-8?B?LzFseTg2eWREekd5LzlIdjk4cWU4a2tTNDkvTzRkYmJPL3dQTjRYWFBEcWpk?=
 =?utf-8?B?bTRzV2Nrak1zc1M5eFVRY3NQOEZJSmY0NFRWR2JMMlp5NXhYZGlvbTJzMDlk?=
 =?utf-8?B?cWx3QXQwNnpVN29qVE5WNVJUS2tEdEluYVN6UC9sY0IyZG9jQk8vTkZiOE5q?=
 =?utf-8?B?Y3JIVmp5UEJpT0RzQkExUTJmOEkvc05RR0g3MVNxVzMwQ3hEVDNLb0EvQ1ZX?=
 =?utf-8?B?Z3JsODZQbVNHbHAvU2hDZjdydmtrRVFnaWpJMk1IbHJNVGIvQUN4QXBuSFlj?=
 =?utf-8?B?eDJ5UE9NR0VhL0sweE9vaDJRQklXU0ZXTHQ4SDlNQmFveEpZc1J6RlVKUFJW?=
 =?utf-8?B?TC85M2pYRkdBR2haVVJmL1NnNjRxeGp0S21YTG13NGNuMmFYOU9NMG45MnhU?=
 =?utf-8?B?SEIwSTRVMktFR0hyN1ZsTkF5ckNVbnJ1Wlg3UjhhSStDdDBTaDBuMzlZc0VI?=
 =?utf-8?B?eTNtZFZoNWQwVFJkcElBKytTSVQ0dnlWUEFQY1dGU3dnbEJiMEdqL1Jia0x3?=
 =?utf-8?B?L25RaFJwNXZmUDFmZURsYlVPc2Y0c053NGlqWnJmbHBBanZwNDkvUUNybU85?=
 =?utf-8?B?Wnk1bngzbkVvbCtKZFRVM2pMWHp1dC85RkxZSkhSeXU0MTRHY0VBMXo3QXlz?=
 =?utf-8?B?N1dpbkpMNW11RUZMMUQwdkFBaU5iVWhxdjhoNVRKZFFpYm9oVVBncXBqRnVo?=
 =?utf-8?B?czlmc01zbFR0ZlRNMGtyYWpuNEIvK1psVThORWZFN3ZTRHpaRkZQQ0pPUFA5?=
 =?utf-8?B?UkxSbGdab3RRY1dLSXdUM2poVDB6L3Roc3IwOFg5d2NtSnpkWjRISFNDRzg3?=
 =?utf-8?B?K1dzQmRuTFlmZi9HSUVqeHZLbWpZNTFnaUlRa0RkaGJsNWNPTkhRTmplWVFl?=
 =?utf-8?B?OU1walcvaWEzUXBXLzFSZkhWVENUVjViNEgzc1c3aTJyMDYwa25OME9XR1BZ?=
 =?utf-8?B?QkFNN0c1M1o1bUlDVm9RSnk5dThuMHVScjhTQVRxcmxOdjYwRlpKTC9TNjVK?=
 =?utf-8?B?ZnNCOVRyVFY1R201ZWxYWlpPU0NpUjNyNzFuaVBIUDVndys5MXZFY3VCUmxl?=
 =?utf-8?B?QTVDYldURUVzeU9TYXEwZjREZHV1S1ZoWW15MGd3MFZyMDA5Ti9PeW5DQ3hM?=
 =?utf-8?B?SlVibml4VDVJZkRiZnIyY0dlSEF0bVdkRUFLZXFKMFp1UU8zcjRUdzNMZHRP?=
 =?utf-8?B?MDFIV1JPRm1wVmdmaHdJaUN3VnB0ZVI5U1hkOU5qT1RoTzAwTnB3NEFBeXZY?=
 =?utf-8?B?Y0hFSXl3R3M2SkF6dDFxeEhNd1A3RFN6Tm1zd0tOZCt2dnFqeGRRdnNscFVX?=
 =?utf-8?B?NXdPdXdDSmovVTU0S1E0TXJOSll6aEN4OVhvMlZOdVpPaTBzVnZzUG16a1hU?=
 =?utf-8?B?SEh6akRrWDEzVWp1N1dyVzdma2owQit1TkJCN2xKeXJkb2xqdzNjNTlmSjdW?=
 =?utf-8?B?K3NhZnRDVHROZ21obnV1MnFSZktEMUhuWkdnM2orY01qa0ZVa200d3gzQ3FH?=
 =?utf-8?B?YTVJZDQzWVJBbURQcFZXbDg2dUMzOTBKWGhRNkE3VWtvTy9xS1JnbTBtU0FW?=
 =?utf-8?B?d05LdlpQeVE5K21oeWpyVzNrSHVZc3M4cWpwUWFRTkFHczBNZUdkY0pudjBZ?=
 =?utf-8?B?R3hKRFBhS3d3dXR6TkRLend4Y240MElCUXpZdW5oY25PVU9mRm1RcGd4eGtX?=
 =?utf-8?B?NmZqdE9zN0FIaFZqY2ZpSTR2WkR5RWIwOC84b1ZoRnB0V2pqSU1RMnN6dm4w?=
 =?utf-8?B?amFHd0xjOFY3WFdDbmVJYjJUM1ROR21TMXcwVmVOK2dSb2xYWlFyczFmUlEz?=
 =?utf-8?B?UkRSL1QwYTB2Y3ZKYUpWeWRFWFZzYW1qVmtkYlZRQ0pKYzAyeURweFdOaE9L?=
 =?utf-8?B?MnhuVnBUbW1yRkt2aGw2MG5zSGJDTHNtOTJFQ3V3WkJXUU52MVNmSENibS81?=
 =?utf-8?B?cS9sb0dyNG9qSnFsQTRYNVBRTmZRWXA4UVJsMVlQMGpoWUxHeWd0V2RYOUVx?=
 =?utf-8?Q?q7GHgOLuhFiqLTG78aWOXfzWL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060e5066-2a36-44b3-4883-08dc89fefc7b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:12:23.2970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olxRQ4bFSqYwiG1vAS5dYktb6X8IIyrUOoCeVMFXLf+YrLNFPJSOuZyFceAH5YmvoRtBalSEZF7gEZRhkdK5qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257



On 6/11/2024 5:43 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, June 11, 2024 3:03 PM
>>
>> On 6/11/2024 4:48 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Tuesday, June 11, 2024 1:57 PM
>>>>
>>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
>>>>> Hi Lingshan, David,
>>>>>
>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>> Sent: Monday, June 10, 2024 9:34 PM
>>>>>>
>>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>>>>>
>>>>>>> This commit allows the driver to suspend the device by introducing
>>>>>>> a new status bit SUSPEND in device_status.
>>>>>>>
>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>
>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>> ---
>>>>>>>  content.tex | 69
>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>>>>> Can you please add a changelog? Especially as some of the previous
>>>>>> discussion has been lost due to the broken old mailing lists...
>>>>>>
>>>>>> (...)
>>>>>>
>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>> +
>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>> +
>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>>>> +\begin{itemize}
>>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>>> +whether the
>>>>>> SUSPEND bit is set.
>>>>>>> +If not, the device does not support the SUSPEND feature.
>>>>>> That sentence is a bit weird: I'd expect the device to not offer
>>>>>> VIRTIO_F_SUSPEND in the first place in that case... could this
>>>>>> rather happen if the device is not able to handle the request at a
>>>>>> specific point in
>>>> time?
>>>>>>> +\item The driver MUST NOT make any more buffers available to the
>>>> device.
>>>>>>> +\item The driver MUST NOT access any fields of any virtqueues or
>>>>>>> +notify
>>>>>> any virtqueues.
>>>>>>
>>>>>> "send notifications for any virtqueues"?
>>>>>>
>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>> ...except for the status field, if it is part of the config space?
>>>>>>
>>>>>>> +\end{itemize}
>>>>>>> +
>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>> +
>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>> +
>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>> +while suspended, except for \field{device status}.
>>>>>> ...if it is part of the configuration space.
>>>>>>
>>>>>>> +
>>>>>>> +A device MUST NOT send any notifications, access any virtqueues,
>>>>>>> +or modify any fields in its configuration space while suspended.
>>>>>>> +
>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>> +clears SUSPEND,
>>>>>> "subsequently clears SUSPEND"?
>>>>>>
>>>>>>> +the device MUST either resume normal operation or set
>>>>>> DEVICE_NEEDS_RESET.
>>>>>>> +
>>>>>>> +When the driver sets SUSPEND,
>>>>>>> +the device SHOULD perform the following actions before presenting
>>>>>> SUSPEND bit in the \field{device status}:
>>>>>>> +
>>>>>>> +\begin{itemize}
>>>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>>>>> +until all buffers that are being processed have been used.
>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>> +\end{itemize}
>>>>>> So, is there any opportunity for the device to fail setting SUSPEND?
>>>>>> I mean, if the driver is supposed to look whether it sticks, there
>>>>>> should be conditions for when the device might clear it again...
>>>>>>
>>>>> Additionally, a suspend operation usually involves saving things to
>>>>> a slow
>>>> memory (or media).
>>>>> This is because the device implementation wouldn’t know when exactly
>>>>> the
>>>> device will be resumed.
>>>>> Few examples, are:
>>>>> a. A gpu device with 128MB of video RAM when suspended, QEMU needs
>>>> to store this into a (for example) rotating hard disk as 1msec IO latency.
>>>>> b. a NIC may need to store its RSS, queues, flow filters
>>>>> configuration for
>>>> several tens of KBs to some slow memory.
>>>>> c. A block device may prefer to complete some IOs to a threshold
>>>>> level
>>>> instead of maintaining large list of outstanding IOs in some
>>>> suspended memory.
>>>>> d. May be more in future.
>>>>>
>>>>> Additionally, suspend operation needs to be synchronized with
>>>>> certain data
>>>> path hardware engines to suspend DMA operations (read and write both)
>>>> which are inflight.
>>>>> (without causing DMA errors). Same would apply to the sw backend
>>>> implementations too.
>>>>> Therefore, the suspend operation that is initiated by the driver,
>>>>> should get
>>>> the acknowledgement back from the device that it has been suspend.
>>>>> Some of the good examples if you prefer to follow, a driver<->device
>>>> interface needs a suspend register which should behave like below
>>>> queue reset register.
>>>>> Spec snippet:
>>>>> "The device MUST reset the queue when 1 is written to queue_reset.
>>>>> The device MUST continue to present
>>>>> 1 in queue_reset as long as the queue reset is ongoing. The device
>>>>> MUST present 0 in both queue_reset and queue_enable when queue reset
>>>> has completed."
>>>>> At minimum, we need, something implementable like,
>>>>>
>>>>> The device MUST suspend the device when 1 is written to the
>>>> device_suspend_ctlr. The device MUST continue to present 1 in
>>>> device_suspend_ctrl as the suspend operation is ongoing in the device.
>>>>> The device MUST present 0 in the device_suspend_ctlr register when
>>>> device has completely suspended the device.
>>>>> The device MUST resume the device when 2 is written to the
>>>> device_suspend_ctrl. The device MUST continue to present 2 in the
>>>> device_suspend_ctrl as the resume operation may not have yet completed.
>>>>> The device MUST present 0 in the device_suspend_ctrl register when
>>>>> the
>>>> device has completely resumed the device.
>>>>> At this point, the driver may resume notifying the device and
>>>>> accessing the
>>>> configuration space.
>>>>> Can you please enhance this part?
>>>> Hi Parav
>>>>
>>>> Yes they are necessary contents and we will address them in the
>>>> following patches.
>>>>
>>> The register polarity is critical.
>>> In your reply to Cornelia, you descried that suspend bit cleared in the device
>> after driver sets it (until the device is suspended).
>>> This is ambiguous behavior of the register. Queue_reset register was like that
>> before it was fixed in 1.2.
>> once suspended, the driver should not access the configuration space except
>> for the device status, so it should not reset any vqs through configuration
>> space.
> I am not talking about VQ reset at all.
> I gave an example of how the VQ reset register polarity works (with was broken like how the proposed suspend bit is broken).
>
> Suspend register needs to work the way the reset register works.
> Can you please go through my exact text I replied in the previous email?
>
> Basically, the bug is:
> When driver has initiated the suspend (writing 1), the device continue to respond 0, while suspend is going on.
>
> At this point, just by looking at the device_status register one cannot figure out what is going on in the device.
> Is driver initiated suspend is ongoing, or it was never started.
> It is ambiguous.
From the device perspective, there is only one user: the driver, and the driver sets or clears SUSPEND, it knows the status of the device.
Differs from vq reset, in this patch there is a section describing how the device should behave suspending. So once the driver sets SUSPEND,
the device should perform the required actions and suspend itself, during this process, SUSPEND bit is still 0, and the drivers know that, like
how we handle FEATURES_OK. Once the device suspended itself, it present SUSPEND == 1 in the device status.

1 bit controls whether SUSPEND-ed.
>
> Hence, it needs to work like how the queue_reset works.
> i.e. if suspend is ongoing, one should be able to read device_status without involving driver and understand that it is ongoing.
there are other users than the driver?
>
>>>> This patch focus on the basic facility virito suspending, not
>>>> transport or device types, this is to make this chageset focused and small.
>>>>
>>> If suspend bit is part of the device_status, it is already covered by the PCI
>> transport.
>>> So it is fine, but its polarity is an issue, that we need to fix.
>> Oh, I see your confusion.
>> All transport have their own implementation of configuration space, this is not
>> PCI specific.
>> PCI config space != virtio configuration space. And this patch focuses on virtio
>> layer.
>>> i.e.
>>> One driver writes 1, it needs to stay 1, while the suspend is ongoing.
>>> When suspension is completed in the device, the device to turn it to zero.
>>>
>>> If the device_status register does not fullfil this, a new register is worthwhile
>> to add in this patch.
>> The driver writes SUSPEND, once the device is suspened, it should present
>> SUSPEND in its device status.
> Yes, I understood what you are saying.
> It is ambiguous like how I explained above.
>
> The suspend bit needs to work like queue_reset register. Please go through the queue reset specification text.
>
> I explained this in context of VQ reset, at [1].
> Suspend bit needs to avoid similar ambiguity.
>
> [1] https://github.com/oasis-tcs/virtio-spec/issues/139
replied above

Thanks
Zhu Lingshan

