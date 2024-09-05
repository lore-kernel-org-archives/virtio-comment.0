Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62889188A37
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520374; cv=fail; b=es/CS9JP3IyfJVcujczkrIMu17mpeFv9BqT+otlejv/58O4s3l4ubFwaAteODe87RmJ66AIQaIGOqbF6AhZEDNCxlu5YKhvNxw7GFQhT7eFJlT9P75Q4EuevtWMBriJM281G4xQJ2FWcA/8ofcQHXll6WzKisic73LFftPiQEE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520374; c=relaxed/simple;
	bh=pkw0nrPwwCEhvP4cBVyM0S0XUhfOz+gGhhFTNeTH+P4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dbUzxTR7FWTBDg/EhbX7ZlOCj0Yt9/zHCIdK2Y+xCHEJ3jwOKSHpO64PYQcVqaKg7MLkutlYHYWuRZ6uB0pjzhbMm9S68FTeqJzGekild1DTqfwdTs/I/9O1u2x6nAhyiWvhv8xLLMb0+4tT3zhy0Git014A+V4CAgF03GzKSNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c0m0CqKd; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c0m0CqKd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hba22JKViJgdnBUhF2Khy8LGCQA8cWdXWyDZxKZxqOz1ngvnZFlDEgEwIPjuNC2RPQaKxpau4qaI3A9wjtOHw24bzl6YAMZj7TDj/Ez9U5ann5NNHJHlZEZNuHqLO6gz5w4fftGu3p51wnixdul/e93di718A60AMp1UNMnJ6RLL9GrtkgWwN0J4UcWM7IlJWUupL+oawOg+0c88G6gzUNUXyuYt34n0tiOx9wuB0VIm4PW2Wy3LXNhWlzifqOML0DZeBAPJxNT1yTagYCkuMLG+dHvNawAz1X0qSOAlJneoYmKa5hqTTCtB0VG4YBrYwk60KRLyCXutlG2RXZrOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuzxQH0Y38mehtq3yiSWLuVGyzE+2dHZuybotC0lDHc=;
 b=MuhXOa5QB+CwPl0fUDAtAdW0/d8h3pqydRKaNZQIKw/iBQeSeO9nfshKmY7+xiJ8dtyWtMLVlnvQodMmaq3Ar5RIv1mCLnhStH8dgmB6y3vfv1SV4Omhx8Zb+Kl6S7twARdmceeTrBV/LIkwd0jC5APAKunxa+/4h3R5BziZIuNXuc6lS8gg4HJTdisGAWaoZ14zQie1Bkgl5TE9p/tVIT1ga2mmQAnpVlbpndIrR6l24GUIkpLumdYfx1ixdFu3f49Lt+ntF7cmX+XGjgQjlPqCz3mfLFp6v/CnZx+EVgJXcfMGJFevHV0QvVTLmLfK4YNzMVbCBN0eulrxZ+phOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuzxQH0Y38mehtq3yiSWLuVGyzE+2dHZuybotC0lDHc=;
 b=c0m0CqKd5MgrVAvvbIshC5gNIhhxGL4RMbIp8JWQjdOZMQe7bt3MB5LKQ4ZJaTYrKaZ52YAY7EkqoikNhJLU1xXhXiFHXqFUNh84ySfx4mnVkJU8AcNg94z+VGwvh5HUUgzbRp1H8od1XWMvmYHh1Q/2mwe37P+fs+BhIb3x2Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 07:12:49 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:12:49 +0000
Message-ID: <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
Date: Thu, 5 Sep 2024 15:12:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <20240905024935-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240905024935-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae8f80a-6999-46c7-4abb-08dccd7a263f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ulp5ZzBwWWVDODRTcDZsakZTMWQzeS8rMDZRZG9aSjJEbXk2MEhQWHhzWExp?=
 =?utf-8?B?UndicmZnQ2lhU0JJeXh6V2w5STNLYnVWejJhOHFrMm9jOGhIdjNtVFRSK05z?=
 =?utf-8?B?V01hZkJVVzhXdHNCNkdGWHhDWGI4VFR0aFhNZjF1ZHZQM3RyMzZCNFlaaXo1?=
 =?utf-8?B?aERRZ2w4Njd4MGxZTTFiMDhQbEk4emQ0cmlPMHZwNm9kWmkzZ2dKQTUrVWRQ?=
 =?utf-8?B?Vnpvc3c1YVpydFZvcldvaUZRRElrbWxWVUxWQlFFY1dWN0pxUCs3dUdRdlJY?=
 =?utf-8?B?UWplNDhFT1JCb1kzZzBidVc2dXN3YXM3UlRld3RPK1lUai9yTytyVXlBNXJs?=
 =?utf-8?B?VzdITXlHMEw0NEYrc3VSQlJPN2RQaFNVSE9reFpGVG82RlBUMlJBVUc3MVh6?=
 =?utf-8?B?RzBmUys4TU0wdC9oT3pXUmZwc1lPUXk5aVdPTDRseEc4VXUyYnAxaWVMYVF4?=
 =?utf-8?B?SlZvMnlVOFczN1c3MThXalpVbkNhczQ0eGVHRld0LzJKanpxcmJDYVdDQlRi?=
 =?utf-8?B?Vnd2b2t0YVlyaFl0MWpMU2JkWTlobmNZWHRZNHMvS01EbkVpUGNlNVhHWktS?=
 =?utf-8?B?V1NzUFBMVmcxbFlPUWRaNkQ3cFBwdjNscC92OHNZd3hRRGVTVGQzNVlGRUw1?=
 =?utf-8?B?a0dGdm1qUkN4QjkzdzRMcm1ydUNHMG12UjhiVno5dzZrd25HT2t2YWZVYnMx?=
 =?utf-8?B?cGZDc1VZc0s1VDFFYXVrbXl4S2tzclNRbXBjUEZhVWdzUGVVQnRxT3Btc0lz?=
 =?utf-8?B?ekx3ejJiM2Y2NG11RTJOM0FLY3Q0QzdxK1lkMFRkYm5WdG5WQ1Z5cTM3cDY0?=
 =?utf-8?B?YlQ0ODdPZmIvNVh0NU5odFoxclhrYk1qaHFUQ1hha3I0RFYwQ2hlcFlkcDBK?=
 =?utf-8?B?SHZGMWlhMjNoVTZWb0Rmb3paWE1scTlLTWF0MzJBZWRudmRPRlQzU0Y2THdG?=
 =?utf-8?B?TUl0bGpsNmluOElpc3BQbkRxalZoSlYxZ3Jib2MvanNTZnJDeUIvR0Y0SERr?=
 =?utf-8?B?SjY3WVpDTE1leVppYlRVQlVZKzJFUFhwdFBBVndENy9MOTY5S2RLTW0vTXd2?=
 =?utf-8?B?VEM0TkQ3Ri9WZGtzb3pLdnp3RHNoNmlVeWRhMW1xZFFMTTFwQzFXMEptVTBi?=
 =?utf-8?B?VmdYMmNNeFY4cXRzbWMxNVZWOGVqeGI2dHZuU285blZ3dlFFUUIyV3BqYXlE?=
 =?utf-8?B?UlljaiszWHlIK3VhUUVFWDZHS2xsZlprckJMcS8zbTU4QWZaR0VRalpORmQ2?=
 =?utf-8?B?dlZ0TGc1emtYL2VXaHh3NTNneWQxYXQyNkRIbDVIMzcvcnhBcGtsNkVQRy83?=
 =?utf-8?B?YUdialhnSWcrWkxmaldaUi9ZQXA0b1lNZEJNalJkUStuMlgzRVczK1lDMDA5?=
 =?utf-8?B?anNtK1g5ZlJTUGNoOEhIaGVWazVYWEs1VG9xcDhzbDJZakpURjIzekxIRWNX?=
 =?utf-8?B?K3RTbDh3MGErQnVCeDQ4am1NdUovV0wvS1V0d01GWjhSTnNLM25EQUt6OVU1?=
 =?utf-8?B?NWFuM1V3UHNVdWtHbU5sOUYrTG0yTW15WU5KdTdid3hlQ3JDN1RsYjQ3QzQ2?=
 =?utf-8?B?VGpHa3ZEUG0yQUpwMVUzdXNQNFNONXhaQWxlR21ua3FMaE43WVdLOVJKSTRS?=
 =?utf-8?B?ZEN5WS9XVWxWQUhlVUU5cDgxWkZmYzdZOWl4ZFJzNnhqN3Q4SnRHdEpYWHh0?=
 =?utf-8?B?OVE0NnR1b1dCbnBPWCt1emxmSGJMbzZibmphNHV4QSs4ZVFvNEZjd25mdGw5?=
 =?utf-8?B?ZnVSUi9vZ0U3TXo0UUxDQmJPK2srZWFnYWJnRGdsUzg5V0tJZVlvTkNFV0Yz?=
 =?utf-8?B?UFlhWHZvcjlQeVpOVWhUUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHdmbTRrNHVCaUhmQmFOM0pTZXZVQzZmTEJWNXh2YjdZc1UvajlkSVdXb0tM?=
 =?utf-8?B?T0RXZ1g2bmJzb2VFbzVpNUtPZzVNSmxWemZuRDZxa1BlWjFncldZZWQ5SVha?=
 =?utf-8?B?dTRSbEl1YlRQTUN2N0dkZ2lBeUxtaU9oTnhLNmhKMHhXZytjTkVDTE56Uk9k?=
 =?utf-8?B?UDZic1l3VGEvZGNZWjY5NTRuT1RVNFFXTE52LzBqOFVwSUlPclA0YUg1TDZG?=
 =?utf-8?B?K080RVNGOGN5NmcvSkZyMU44cnkwTWdsYnJ0SXdqMTFvR3JsRnRBSWlPMkZW?=
 =?utf-8?B?MTdCMUFDbXkzeVlDOWtTc1NuYmdvYnZCZ3JDTEFXSU1yUzRvcHZhZ040TEpi?=
 =?utf-8?B?OXhwUnRtMEV3NWs5ejVjM05kYjZjVmI4eUVGZFdzRFZYd1hndWZWQmM3RHVH?=
 =?utf-8?B?N3ViOGRIWXJUNEV0Tkk2RDhkQk1Kd2xnQXlZVTlFLzg2aTlHbzlNdlN2bk5u?=
 =?utf-8?B?QlNIUUhTZ3RDZDBhbEhqMW1rOVJLYXE5TUVJVnA4SThsL1lCZUh3aGhiRm9z?=
 =?utf-8?B?MUZaTVp5Mm5CVUVPcjYwQm8vUUJ3SUdkclBtcGQ5cS80TXhPNjNJbXVBRzVF?=
 =?utf-8?B?UFAzUW9vMkU4aUdFeXRqb0owSEloYVBrUWN6bE5vUlV1TTI1UDZlMWx0Zjlp?=
 =?utf-8?B?Mi95TWdWT29Xa1BlUHBoa2NuZmpoYXhDTEJXSE5qZ2haWUxzNnYzY0NHcmxY?=
 =?utf-8?B?czhxNHNoc0Z1dENraExDNTEzSjMwcmphQWluNFRuU29teXE5eVh0UjVqaktH?=
 =?utf-8?B?eHQ1aFhacWlqOHBrWWVncWJkbUh6UGJ6QlNoNVRrTGJRVGxxdUNKWURLOVpT?=
 =?utf-8?B?bDlwS0VFYWt3dit5WWgyaGRia01zZE50V0F2UUJPYk1sbXREbk5icjN6VUFm?=
 =?utf-8?B?bmkrVGtZb3NmN0VuaWdDeXpLM1RPdzBEc1dFZTNKTWd3eVRXU09TbFJqaXRN?=
 =?utf-8?B?cUZOVWNwNk9nc3d3SFB5U09lSTloTzliNnVZSzV2SDMxMXUzVnc3Z3BQTmY5?=
 =?utf-8?B?TWoyZ2lWWkgyTm1IQVlydnExYjNGa3RDNC9sdkYvQjR4bG5kL0pQT0J5bmFq?=
 =?utf-8?B?dzg1UVpUd3lOSmVwWE9Oci9aSkJRSFZXQnRHcnlKdVVoZUJRYkszMGM0S3Zy?=
 =?utf-8?B?bG96bFNtTnh5R3ZEYmcvUkQ0VzI5TkpBTVZxT2xSODY5dXJyUmRsMmJIYmV1?=
 =?utf-8?B?eVErOWZuc0ZVYUlWL2orWUp1MHVQR1plR0ppSEZOcytEbzdjdjVGUHZkWW8z?=
 =?utf-8?B?VUZaWVdBWHNtUGZQbDdjSkY3MS85VnhBbVk1MW41dnhURllQS2g2M21jZlZ3?=
 =?utf-8?B?a0tIYmo4bjF6aUo3Q2J2WmdqZmxPTG90WEk1Y3BQSTRsMzhaeis1cWxncVY1?=
 =?utf-8?B?dHZLUXEwLzZNK1ZnRmxVbDJiRS8zeUVLYUtKTVBhUk5nVlFqbWc2L2x4U2VL?=
 =?utf-8?B?aWgrL0pGQzBHdkQyMnNaYldjamRFOGx2MTRiWG9CR0ZGdEFxWlo2UkZBVS9H?=
 =?utf-8?B?SUdmVmJxOUxsajhrdmROSVNObWJHQzc4WTBjOXNZa1VSSEp5SnVHN252R3pE?=
 =?utf-8?B?Wm54Y296RmpQUlF2KzJhMzFsczFza1dwWnZhL2tIZTdrbEhYR0lrSkNkRWJ6?=
 =?utf-8?B?WXBsd21mNkZZVmxVdlBTeWY4eVBwTDBFbHRGRHJqNGNHaGNoaXliUHgweTE3?=
 =?utf-8?B?ZEdUcjk3RlhOUGMxN1kxUDRMbkZFN3NibWozVExJRmlYVDExRk5IejNBb1dh?=
 =?utf-8?B?dXdPTGkyTlVXSEZnZGI5NS9ON1pRbitiWU9CRlp5S2puK0RFeDZWVE1FUDdS?=
 =?utf-8?B?VEtnYzNHY1BMWGVHUjNmUGRhUkQwbE0xSitWeHlxZ1U4bHhBN2VLV0RaTk0w?=
 =?utf-8?B?eFFpbDFwNFhtdEdibWNMZ1kreDRPZXFaY0E4WU85RWpDZnVJQ3ltTUs2eCsz?=
 =?utf-8?B?TDhMeitHOUk5UDFibjE3RUFXR3hnOElRV2lsVk9tWVpTNUdmTENnYWsxakJm?=
 =?utf-8?B?Y3hTWkNuSkFTVDM5aUZOTVF5SjJQWVhmYUpCcExobjY1eTFSQ3REMWh2N1ZV?=
 =?utf-8?B?bkVYQXJqQzJFajM5cXc5dmdTL2xJcHRDVStqK0RJVS81OGMxRUZqMzM1Y0l5?=
 =?utf-8?Q?zNQt5gaQs2Vw/hXId01RzoQlh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae8f80a-6999-46c7-4abb-08dccd7a263f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:12:49.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FOH7ycoy+4xC1OTTfPNPoMrHYfl0RO7w57p16dsyTjxUQCf6TxCPdtFyThOj/Ch608UkYh4O1YNHbtFXCcQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932



On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
> On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
>>
>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>> But I don't like it that looking at the registers, one does not know the device
>>>>>>>>> state. Hidden state is bad for debuggability.
>>>>>>>>> We have 4 states:
>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>
>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>
>>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
>>>>>>> No argument here.
>>>>>> Or, to be more precise, our status is driver status.
>>>>> It looks like the device actually otherwise there's no need for
>>>>> re-read or poll for things like reset and others.
>>>> The need is there for complex device state transitions, which
>>>> can not reasonably block a read response.
>>>> Another standard approach with PCI is to specify the time
>>>> transitions can take. I consider that less elegant -
>>>> is this what you are advocating? The advantage is that
>>>> driver does not load the pci bus with constant re-polling.
>>>> The disadvantage is that it is hard to pick a universal
>>>> number.  A combination of these approaches might work,
>>>> e.g. a recommended timeout then poll.
>>> We've already had msleep() for vp_reset(), anyhow we can increase the
>>> sleep time, if it can overload the pci:
>>>
>>>         while (vp_modern_get_status(mdev))
>>>                 msleep(1);
>>>
>>> We can do the same for suspending.
>>>
>>> The main blocker for timeout is that it may break migration and
>>> complicate the hardening. Another proposal in the past is to have a
>>> notification.
>>>
>>> But what I don't understand here is that suspend/resume should be
>>> lighter than reset. If we can afford a reset, so did the
>>> suspending/resume. If we want to have something new, that's fine but
>>> it should be orthogonal to a specific new status bit?
>> I agree, if we want new status indicator, then the new indicator should not be
>> specific to SUSPEND.
>>
>> Thanks
>> Zhu Lingshan
> If you mean reset, we have a problem.
> Specifically, reset has to work before feature
> negotiation. So we can not do as we would with
> SUSPEND and use a feature bit to expose presence
> of the indicator register.
I guess the driver can reset the device even after DRIVER_OK.
IMHO the indicator should work for all device_status transitions,
not only for RESET or SUSPEND, it should also apply for FEATURE_OK
and DRIVER_OK. So we don't need a feature bit, we may just
place it in the common config space as you proposed before to
define common config space for all transport. We can do this for sure!

Of course another approach is what Jason proposed, the existing
msleep and poll, driver knows whether the device is in progress
of status transitions because it is the driver writes device_status.

Thanks

>
> Regrettably, reset will have to still be supported
> through clearing status just because this is always there.
>
>
>>>>> Anyhow driver know
>>>>> its own status.
>>>>>
>>>>> Thanks
>>>> indeed, the status register is there to inform the device about
>>>> the driver status.
>>>>
>>>>
>>>>
>>>>>> If we need
>>>>>> to reflect and control device status, we need something else.
>>>>>>
>>> Thanks
>>>

