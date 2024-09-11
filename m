Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B27322066
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726029740; cv=fail; b=KBkZdLprNSqR1jk766v46aLe4VlS/QfpDUxg/GrbKjtlyoVO157APztcCtaUrWOx8FUF24rOvNeezPWGkhrtkS0tlUt6rdfTAsak7Vbo06v2uj+yMI5InlopeegEZD+icxB+6lnp8rnFBQSpxHB+UCW11z7IEpmZzpdG79hC0Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726029740; c=relaxed/simple;
	bh=AvYijf2+lHeeIvNvc20Gwg2pTh6fi06nqnQx+fsKMIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NNQZ/+qnfknTdq13koabXFnyPvZX9Fc0K2pzryVwBAz4JXzAA+Iu3Fvc5L88hob3GSu0uim5WLa5T2VV/We++SH84NOGHbODcsT8qdN3FFf3s2/P0H5LFIrPTR1ELrySEcS7gCgKUHu2Os55VBtTZO+QrNG+pMlo69Vb0lkvaQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DD0g4BkP; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DD0g4BkP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzZbX+WI7egHpYQKo9+ZQs+GbC4jLJzpyVkz1XvL+jV6cQHcy0quM/hFE9zRV5pOQbO6KHWCGpmpClvwBSceTNa7IkDoS7tiX92b+MkCY+lCfDpCpZPthtTesri6XY/aT+LHZdfibIw7ub/0JHVOl/dLT1W5NzX/QUYobSud1/QHftc2mY5rAj1KknO9IDPRunFPIu0UJ2q+omNTDmFn0+CW2I7PnjuE5veX6p8tTwGce8jYEkRNCxcUyGCKYIuNCYEEAh6Ne15n5TbpF6rjH3QUu+fqtQF0jNFRFQRGPAuyG6DDCZA9ydTtaT3hEjhJjUPUjR4NdPJyOtkU5YuZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO+Zn8ZK1RDl1xMDRzWlgPkSxHEUYFXf5YvYRo/KRHQ=;
 b=JmsdN8gwQT4xi6Kn23ZbO9sBmjf+HpQZ2/SiK4OJLLQBdHwNEWLpCUQAeSfz2Jlcs+OhY3xa6F9RC/7qA9B0l/Gl1N1ZJcJl96urkKDbmgFH+pj+IIjiVAievsCsJOzkvJVBO2rEneeKraypAm1N931s51/EQuPH8M0Fp3Ownsllv6ppxo6ZocKRnqGsxYgdfkxlicmplyN5e13UWDSd4AwcYwTG5ovr1qKLe6t6i5gksxfQp1FiSUcuD/GBB+cVz5O0l4njZJH9koleqlb1OzVvP0GnQHO3yPocZK0WNGUOih8I5p7lDdwq0qgrs36Qfb2UPZarLsHcnYNXp2i6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO+Zn8ZK1RDl1xMDRzWlgPkSxHEUYFXf5YvYRo/KRHQ=;
 b=DD0g4BkPgE9VAxXNomgDY7rKp1qPeJl3brAbleV18JiHQMjvu7mKstzyo6T/PQrzrsCFNAJAm1obqpO3Shbc7wqhYDzmHdLFX6Od6BC/iown3wJTcDoKLXZDIRW1/Dq4pbinNbpwnnY8xL86Nof83P3YxOEJqBO+mq1MmUD5N4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 04:42:14 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 04:42:14 +0000
Message-ID: <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
Date: Wed, 11 Sep 2024 12:42:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
To: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
 <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0135.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::15) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0655c36f-72a9-4a61-7a63-08dcd21c1b85
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SlFZQWtnUXN5Ym9tQURFSDZhT3NLQ0dLbUtkK1ZTTW5PbWpnV2RZdlFsWlBo?=
 =?utf-8?B?bmUxenFmZ0lvNHNZSnFFMnR4NXRQY04vNFkyK0JNOG95c0ZHR0UyaElPb00v?=
 =?utf-8?B?V1BsaUpSUFk4WWQrb1p2K0lxWUVRNXkrZDJUVnRMTjdQblBsUDFKTmE0ZGlk?=
 =?utf-8?B?STNGWndJRFMzM0pFdTdkRWNXSG9JTEJoWGIxTHZPVUJTR0pHd3N0R0tRQ1h6?=
 =?utf-8?B?WFhGUGFnTUhmMkFKMEtIbG5Bek5wZmtnN0FFajhsS3QwMW05Y3JOVENqVDNj?=
 =?utf-8?B?aEMvNUd3SlV3TGRlcVBDNC9rQnNNWGJNQm9mWUI2dkxlSmdXYnBjckQyL0Rm?=
 =?utf-8?B?eUVKNUlldVRtcUk2T0wrZm1UcVovWTRzVWZKdjRmN2VjUzI1eStzOEswbkQv?=
 =?utf-8?B?a1AvcXhVWXJiOTNPS21BSjRkNXFuam1GUHg2RG1ZeWIySGRtZk9aQlFJd25i?=
 =?utf-8?B?UkhmQU9xWStQR2dicDBRVS9Ra3NjMm9HUFlPRFN4VndLOUZ3UHRNQ3RYMzM2?=
 =?utf-8?B?cERBWHVTV2F3R291dHV5Y2VoRExkQVRMVWFhQVY1eUgxdDVaVUcwTDdRWnBC?=
 =?utf-8?B?aXh3VTRkOVhMd3N0VjVKWVJsWHNhVytNOWx2NkxKYlpyU01pLzNPYjdWQzJP?=
 =?utf-8?B?UGVEV3A2VXdYbGwwRnFBamp2cnhITmh2YUtqOE5HZ0tzWHJndVdja2JVN3p5?=
 =?utf-8?B?TjRKaEhhaFJyWVBVR1RLQ3hwTENZOXlEem03dTMrK3BZQ2p2NHYvL1Y1bDY2?=
 =?utf-8?B?eVEzMzZDVVJjakp3Y21EdmU1OFZhQllmVE5FRHJtVUc2eDF5NnBzVDdVNWxN?=
 =?utf-8?B?RE03QVZxb0paOG5RNUxqTERZa2hyMXVtODlYVWZYaENCUzRVeUc1dEpsZkpH?=
 =?utf-8?B?RjJLWEZJaTNJSVQ0N2lTcVpNN28xdktuQm9Jd1hZdzVoWU9IdUhXOVJ3Tjlu?=
 =?utf-8?B?amlkb1VmaXRJd2d6VkVTbkhRbnorNUNIaFpNRHBpbFIzUUpQNHFGY2N3cmxJ?=
 =?utf-8?B?VEdIemRkWW1uUVBEeUVlZ29PWWprR0pHRC90L2lwZkY5OGFlOEYrRDRNSjJL?=
 =?utf-8?B?dVM1Zkc0NEcvS2lYbmNVWUZ6bVpkRC9mOTJrblpDQ1B1dlFJeS9yNjRTNXFZ?=
 =?utf-8?B?MVNyV0Uvem1jTlVtSU1VMHUzTk1SWkIwb0hSa09RU096NUcwb256WFpJSFJt?=
 =?utf-8?B?UzI5M29FSEFtdHFMMU43WjNPZUxqaHIyeDZqRStHMjdTNGtCZjIwclpmeHl4?=
 =?utf-8?B?R1RjQ1B6ZVNENFMzalMzNnJWc2NKQWFjSzd3WnE2TU1Ecm53M05XVXB2WFRr?=
 =?utf-8?B?Q3dwbzl4YnVQS2JsdFBtMFM1NzVUTmliRDN3dFJlVTZyM0x5UXhXVFBJd28z?=
 =?utf-8?B?dlhsajJiWEdWUGVCTmgvSG9PTFlLU29SdUo1QnRlZGYyWDBZUmxsY3MxckJs?=
 =?utf-8?B?QkhNaW5XNjZJS1lWTjgvUjdtbFZLQjl0NjJPMmJZZkxZZUJ1d1E2YkJUcWtt?=
 =?utf-8?B?TitvNXZEOGdHbEJrV3JSNHJNSHphM1ZyN1ZlaGdMWmVZenJLOVJNWEppWDFE?=
 =?utf-8?B?WS9rd280N0FteERWOFhTbWNCQXZXczY4a1k2YUI2R1Q2ZEowdmtaWmdnVmoz?=
 =?utf-8?B?N2dVU0N0aDdLZWxkTGpVbWFJMGVMbWZWOGl1bXk3bXVMc0JDRjZLNnVTUVZE?=
 =?utf-8?B?eUY0WWJXQ1dMMnFZalg4YjRCRGlQY2VsT0FUSEQvV2ZxMDEzbG9iOU4rdjU5?=
 =?utf-8?B?TmlMWnRxQnl4eW01Rjc4UGxTY2NqcnpranlyWmlhc2tkQWZYVGx2cTl2SmV0?=
 =?utf-8?B?dkJZSFpGOHhYM2xmdmttZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OC9XclM3L3dOdjkxQ3RDQzdOcHAwMWx1ck5Jc1dPNjY5cHplUzB2dElyeUUr?=
 =?utf-8?B?dTRtbFR1VU5Rcjh5ZmhKazZJTWFuMW9uNUd0dU9uUTFEZFBtc2duMmpxa042?=
 =?utf-8?B?Qi9wYWlZRHJKcHRWVTg4bzVRSFVXM0MwRUFIM3ZLUGZFZFBXSjFMaUlQNFFh?=
 =?utf-8?B?Tms0SXV6VG0zK2toNzd3S2FUakdocjZySGRkdzZBQUpEbU10Z0FpWUhTa0Fa?=
 =?utf-8?B?ZlpOTFZZa0FBRjV0c0FRNlBQeFFqR1hUbkt4QVNWZFQwQmtOelpLL3NuOXJy?=
 =?utf-8?B?bEpSblZRbnR2RlJkQVBPYk0vcXpRRVFkYTVUMnN3czNUSjZVVXhoTWMzNlRm?=
 =?utf-8?B?SFkvU1haeU50TGc0cXpycjdreWNuTlNSNSt6WFk0MVRRNEx4YjFWTjdoa2hv?=
 =?utf-8?B?MHYzRC92OE9mTkNrWVpGK1dKeHhJK0RjVTN5M2JYUkdGZ090Tm5DWTgvZWxR?=
 =?utf-8?B?NDJFdmV6elNWZy9ZL1B5MjhUeVAvaHgxOVVDYmNFSkpaUEVyTTJ1SWIrOEpL?=
 =?utf-8?B?NzRUdkN2bGRidnJaY1NFWjBBbU8vNkVGWVp6MHNTQnNqaTNVVDYxKzFUUS9r?=
 =?utf-8?B?NU9vU3gzajBMS1BuWW1DVE11NkF3K09WcXZzOUJ3Y2xlOFc5MkhYcERJR2Zo?=
 =?utf-8?B?LzltNVlobkpGOW1sTkJTS1FYZkZMOXhHZVhoZ0F0YWlsSFFLY0JrbWl2RE9l?=
 =?utf-8?B?TWE4ckQ2N2d1V0tKQmpkWE5qcW9nNUNTTER3UUNGM2U4OEVsdyt3ZlAwN1dK?=
 =?utf-8?B?LzRkemZDYzFFbmVqUFh2K091N1poYWMyakZURlZDdWFPYTlnSkJieXg1c0cz?=
 =?utf-8?B?dFpicmdWbSt5SlpScXNJRW9WcUNJVEtTK0NtSEVFNk5iUE1tUjNWUDFzczJj?=
 =?utf-8?B?QXd3Uk9CVHhnU05yWXNJV0E0RWd1VStaZ1l0bmh4ZVQ4RU5jUG5TZzIydXhp?=
 =?utf-8?B?b0tmU1dUcUJ3d0d0RWprY1luL292UW5KNGJud3JpNlJVQUZpSUxKM3JNeWNr?=
 =?utf-8?B?YVkyWU9FeTZYbEl4ZjhFTDhKeUhhcHpSY2JtR1JiUWI3cmRiWjhzWnJVaUV6?=
 =?utf-8?B?d1hBdE5JcXQ2WlBBMmRpR0RIZzA0eGgwRVZlSHFWRXd0WElsVmZxMzQvVGJh?=
 =?utf-8?B?RUtiOWZPenJ3MzNKT1g5VGw4ek5JQkdpUlRJRDBXYmRhSXh3Sm1rbmk3UVBn?=
 =?utf-8?B?akxkeitWbjdmWFNSOHZkVzV1V3VTMzhHYS94aDRwMVY0dTUxYzVldU1xUGVa?=
 =?utf-8?B?amNrcFF1Q1lQQzNKdDVMVlpIcEJ2TEppQzE3OStTQnlPZVhSWmxsK1U2bjM5?=
 =?utf-8?B?MjZqcDR0NC9jQnNCUmFiVzZMb213WEY0aWpFWDRVN0RCVllXN1lOeVgwMlpT?=
 =?utf-8?B?aThwak5RZVIzNTFMSzVuSFpQTlZ6S3NPcVNXQk9BV3RIVTVnVWJaZHNYZ3dD?=
 =?utf-8?B?T1lVOEdXV09TalZQQ3JaaFZyZ0dxZFVFdUhqMThzM1REM0hLeTJmY2FpdkVN?=
 =?utf-8?B?aCtldkNod1Aybk8rWVpoYXpvTzJPTDJYLzVTRHpKUHdJcTBxOTJFY2MzU25P?=
 =?utf-8?B?Y2tXODEzWjhNTHdEV2c5ekt3LzJnMUhiZnVoRVNTbVYxTXF0WGNxL1FodWRa?=
 =?utf-8?B?cUl2Q2NzaVIvTjk2L0YwU1FZZlpmNEhZUHl0N0krVWNJcTJLSVprZExHTUpv?=
 =?utf-8?B?UHZ3bENRVzM5aGdlSi9rSnJySnBxaElUbGpTVWNWV0hwYXZrazdNaXRMdVJo?=
 =?utf-8?B?VGovblJRYUM2RjZDTHQvck1JNE8vMSttR2dUSWh4Nkt5cHgwVFNVamhGSkNE?=
 =?utf-8?B?V0x1NWFPV2Rsd2RoWjErcVV1Qld4NkpLUytPbmUwSldWVUlCemJQOVhrOWlh?=
 =?utf-8?B?UkhtNzlqNXZRVHdQalhHYjJ0bWRldHdtY2tDbGtNU1V6dkpVR1ZCV1dSMWxN?=
 =?utf-8?B?dkl2dkZ1elFlcDlLQXdpNjZHVnhHdi8vaC9HQlJHUG1VZkFaTEdNRDRsSmtn?=
 =?utf-8?B?SWQwalZwUTNCcW5SQmVVMVdaUCtnUUNMc01HREJYNmo1SEpkSjlkVmZrYUln?=
 =?utf-8?B?TG44bUo5Zm9vcEdKbzNIaHNpcko0aHZGKzVYNkY2dkg0M3NpLy9mRW1YTkVs?=
 =?utf-8?Q?trH+IDBQYmJkdGPW6YBaAhJA9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0655c36f-72a9-4a61-7a63-08dcd21c1b85
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 04:42:14.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sNxFORx/hvLU+0YTGMEeplwkzeolvo84RrsryQnUxrx4HZTjzkK20aQfnubuHeXsxoVioLqj1G+1el1fsO5nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206



On 9/11/2024 12:38 PM, Jason Wang wrote:
> On Wed, Sep 11, 2024 at 12:12 PM Parav Pandit <parav@nvidia.com> wrote:
>>
>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>> Sent: Wednesday, September 11, 2024 9:30 AM
>>> To: Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin <mst@redhat.com>
>>> Cc: virtio-comment@lists.linux.dev; cohuck@redhat.com; Shahaf Shuler
>>> <shahafs@nvidia.com>
>>> Subject: Re: [PATCH] admin: Enable driver to send admin commands before
>>> DRIVER_OK
>>>
>>>
>>>
>>> On 9/11/2024 11:37 AM, Parav Pandit wrote:
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Wednesday, September 11, 2024 2:06 AM
>>>>>
>>>>> On Tue, Sep 10, 2024 at 07:01:08PM +0000, Parav Pandit wrote:
>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>> Sent: Wednesday, September 11, 2024 12:02 AM
>>>>>>>
>>>>>>> On Tue, Sep 10, 2024 at 08:07:23PM +0300, Parav Pandit wrote:
>>>>>>>> Currently the driver can operate administration commands using
>>>>>>>> administration virtqueues. Administration virtqueues must be
>>>>>>>> enabled before it reached DRIVER_OK stage similar to all other
>>>>>>>> queues. This is a limiting factor.
>>>>>>>>
>>>>>>>> Many of the device functionalties needs to be discovered and
>>>>>>>> configured early enough before the driver reaches the DRIVER_OK
>>>>> stage.
>>>>>>>> Some examples are:
>>>>>>>>
>>>>>>>> a. driver wants to dynamically create the virtqueues of virtio-net
>>>>>>>>    device with more parameters, for example header data split,
>>>>>>>>    multiple physical addresses.
>>>>>>>>    Here, the driver needs to tell PCI device early enough that it no
>>>>>>>>    longer uses queue_* registers for non admin queues.
>>>>>>>>
>>>>>>>> b. driver wants to discover these features and related attributes
>>>>>>>>    early enough so it has chance to decide to proceed via admin
>>>>>>>>    cmd interface or proceed to DRIVER_OK and follow the current flow.
>>>>>>>>
>>>>>>>> To overcome these limitations, introduce a feature bit that
>>>>>>>> enables the driver to send capabilities related admin commands
>>>>>>>> before DRIVER_OK via the available interface such as
>>>>>>>> administration
>>>>> virtqueue.
>>>>>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>>>>>> We were there in 1.0 and it's messy. And next thing you do, you
>>>>>>> will
>>>> Also if you can explain what exactly is the mess, if there is one?
>>> As far as I can see, the spec says:
>>> Set the DRIVER_OK status bit. At this point the device is “live”.
>>>
>> This patch upgrades this detail. Please read through.
>>
>>> And no vqs are active before DRIVER_OK. How can the device assume that the
>>> driver is ready before DRIVER_OK?
>> Device does not assume.
>> When the feature described in this patch is negotiated, device knows that AQ will be live before DRIVER_OK.
>>
>>> Why admin vq is special?
>> Because it is used to do fundamental device and driver capabilities discovery.
> Then you need another transport or a control device.
So Maybe it is a good chance for me to continue the "transport vq" work?
>
> Thanks
>
>> Please read the commit log that describes the motivation.
>>
>>> The common config space is not enough to init a device?
>> No.
>>> If you see a gap, how about fix it in the common cfg?
>> Admin command is the interface do perform administration work.
>>
>>> Thanks
>>>
>>>>>>> want it before features ok, and we will keep piling up hacks.
>>>>>> I don't see any motivation to do before feature bit.
>>>>> I do.
>>>> Can you please share the motivation, why one wants to enable the AQ
>>> before features_ok?
>>>> And how would it configure all the basic things to operate a AQ before, for
>>> example, PACKED, VERSION, PLATFORM?
>>>> If the motivation to negotiate device specific features via admin command,
>>> then that is still possible with current proposal.
>>>>> And I keep saying, we need to be proactive, address more than one
>>>>> problem with each feature and try to predict what will be needed,
>>>>> otherwise it will be a mess of a million conflicting features.
>>>>>
>>>> Sure. make sense.
>>>>
>>>>>> Never before features ok, feature negotiation is two ways
>>>>>> communication
>>>>> that indicates device, that queue notification is coming.
>>>>>>> I think that if we want
>>>>>>> to do admin commands before VQs are active, we should just add a
>>>>> capability
>>>>>>> with registers for that. People wanted that anyway.
>>>>>>>
>>>>>> We discussed before that pci-sig discourages piling up vendor specific
>>> caps.
>>>>>> So better to avoid that.
>>>>> Well, that's a separate issue. Actually pci endpoint guys already
>>>>> want a way to access device without messing up with capabilities.
>>>>> So we'll likely create a way to put capabilities in a BAR.
>>>>>
>>>> So lets take the base line design requirement and see what more options do
>>> we have.
>>>> a. do not extend pci capability
>>>> b. utilize the current q config registers c. have bidirectional
>>>> negotiation if driver will use the AQ early enough or not.
>>>>
>>>> With that what do you propose?
>>>> A new register in the BAR instead of feature bits?
>>>> How does the driver tell the device after reset and before features ok?
>>>>
>>>>>> An alternative would be to bump up the pci revision_id, which would
>>>>>> align
>>>>> to pci-sig and its known early enough.
>>>>>> Though it does not take away the feature bit because device
>>>>>> preparation is
>>>>> needed to setup early admin commands.
>>>>>> And feature bit can be a good hint to inform that.
>>>>>> Only revision_id (from device to driver) is not good enough as there
>>>>>> can be
>>>>> large sw stack which may never use it and no point in enabling this
>>>>> in the device without driver using it.
>>>>>> So feature bit proposed here is self-contained, and its early enough.
>>>>> I don't really get what this revision_id discussion is about.
>>>>>
>>>> I will pause explaining the issue with rev_id for a moment and see what is the
>>> efficient way than proposed?
>>>>>>>
>>>>>>>
>>>>>>>> ---
>>>>>>>>  admin.tex         | 16 ++++++++++++++++
>>>>>>>>  content.tex       | 13 ++++++++++++-
>>>>>>>>  transport-pci.tex |  6 ++++++
>>>>>>>>  3 files changed, 34 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/admin.tex b/admin.tex index 39fc072..95054ed 100644
>>>>>>>> --- a/admin.tex
>>>>>>>> +++ b/admin.tex
>>>>>>>> @@ -334,6 +334,11 @@ \subsection{Group administration
>>>>>>>> commands}\label{sec:Basic Facilities of a Virti  supporting
>>>>>>>> multiple group types, the list of supported commands  might differ
>>>>>>>> between
>>>>>>> different group types.
>>>>>>>> +When the driver has negotiated the feature
>>>>>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD, the driver can use administration
>>>>>>>> +commands VIRTIO_ADMIN_CMD_LIST_QUERY,
>>>>>>> VIRTIO_ADMIN_CMD_LIST_USE and
>>>>>>>> +commands related to device and driver capabilities listed in
>>>>> \ref[sec:Basic
>>>>>>> Facilities of a Virtio Device / Device groups / Group
>>>>>>> administration
>>>>> commands
>>>>>>> / Device and driver capabilities]{device and driver capabilities}
>>>>>>> for the self- group type before the driver indicates DRIVER_OK status to
>>> the device.
>>>>>>>> +
>>>>>>>>  \input{admin-cmds-legacy-interface.tex}
>>>>>>>>  \input{admin-cmds-capabilities.tex}
>>>>>>>>  \input{admin-cmds-resource-objects.tex}
>>>>>>>> @@ -608,6 +613,14 @@ \section{Administration
>>>>>>>> Virtqueues}\label{sec:Basic Facilities of a Virtio Devic  or
>>>>>>>> VIRTIO_ADMIN_STATUS_ENOMEM, then the command MUST NOT
>>>>> have
>>>>>>> any side effects, making it safe to retry.
>>>>>>>> +If VIRTIO_F_EARLY_CAP_ADMIN_CMD feature is negotiated, the
>>> device
>>>>>>>> +MUST process administration commands related to device and driver
>>>>>>>> +capabilities before the driver indicates DRIVER_OK to the device.
>>>>>>>> +
>>>>>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_CAP_ADMIN_CMD
>>>>> features
>>>>>>> are
>>>>>>>> +negotiated, the device MUST be able to generate notifications
>>>>>>>> +related to the administration virtqueue before the driver
>>>>>>>> +indicates DRIVER_OK
>>>>> to
>>>>>>> the device.
>>>>>>>> +
>>>>>>>>  \drivernormative{\subsection}{Group administration
>>>>>>>> commands}{Basic Facilities of a Virtio Device / Administration
>>>>>>>> virtqueues}
>>>>>>>>
>>>>>>>>  The driver MAY supply device-readable or device-writeable parts
>>>>>>>> @@
>>>>>>>> -641,3 +654,6 @@ \section{Administration
>>>>>>>> Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
>>>>>>>>
>>>>>>>>  The driver SHOULD retry a command that completed with
>>>>> \field{status}
>>>>>>>> VIRTIO_ADMIN_STATUS_EAGAIN.
>>>>>>>> +
>>>>>>>> +When the VIRTIO_F_EARLY_ADMIN_CMD feature is negotiated, the
>>>>> driver
>>>>>>>> +MAY send commands only to the first administration queue defined
>>>>>>>> +by
>>>>>>> the specific transport.
>>>>>>>> diff --git a/content.tex b/content.tex index c32c218..12f9224
>>>>>>>> 100644
>>>>>>>> --- a/content.tex
>>>>>>>> +++ b/content.tex
>>>>>>>> @@ -540,6 +540,8 @@ \section{Device
>>>>>>>> Initialization}\label{sec:General
>>>>>>> Initialization And Device Oper
>>>>>>>>     device, optional per-bus setup, reading and possibly writing the
>>>>>>>>     device's virtio configuration space, and population of virtqueues.
>>>>>>>>
>>>>>>>> +\item\label{itm:General Initialization And Device Operation /
>>>>>>>> +Device
>>>>>>> Initialization / Capabilities Access} Optionally get device
>>>>>>> capabilities and
>>>>> set
>>>>>>> driver capabilities if VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
>>>>>>>> +
>>>>>>>>  \item\label{itm:General Initialization And Device Operation /
>>>>>>>> Device
>>>>>>> Initialization / Set DRIVER-OK} Set the DRIVER_OK status bit.  At
>>>>>>> this point
>>>>> the
>>>>>>> device is
>>>>>>>>     ``live''.
>>>>>>>>  \end{enumerate}
>>>>>>>> @@ -550,7 +552,9 @@ \section{Device
>>>>>>>> Initialization}\label{sec:General Initialization And Device Oper
>>>>>>>> driver MUST NOT continue initialization
>>>>> in
>>>>>>> that case.
>>>>>>>>  The driver MUST NOT send any buffer available notifications to
>>>>>>>> -the device before setting DRIVER_OK.
>>>>>>>> +the device before setting DRIVER_OK; however, the driver MAY send
>>>>>>>> +buffer available notifications before setting DRIVER_OK if
>>>>>>>> +VIRTIO_F_EARLY_CAP_ADMIN_CMD is negotiated.
>>>>>>>>
>>>>>>>>  \subsection{Legacy Interface: Device
>>>>>>>> Initialization}\label{sec:General Initialization And Device
>>>>>>>> Operation / Device Initialization / Legacy Interface: Device
>>>>>>>> Initialization}  Legacy
>>>>>>> devices did not support the FEATURES_OK status bit, and thus did @@
>>>>>>> -
>>>>> 879,6
>>>>>>> +883,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>>>>>>> +Feature
>>>>>>> Bits}
>>>>>>>>         \ref{devicenormative:Basic Facilities of a Virtio Device /
>>>>>>>> Feature Bits}
>>>>>>> for
>>>>>>>>         handling features reserved for future use.
>>>>>>>>
>>>>>>>> +  \item[VIRTIO_F_EARLY_CAP_ADMIN_CMD(42)] This feature indicates
>>>>>>> that the device
>>>>>>>> +   exposes an administration command interface which is
>>>>>>>> + accessible to
>>>>> the
>>>>>>> driver
>>>>>>>> +   before the driver indicates DRIVER_OK device status. When this
>>>>> feature
>>>>>>> is
>>>>>>>> +   negotiated, once the the administration commands interface is
>>>>>>> configured, it can be
>>>>>>>> +   used by the driver to issue administration commands related to
>>>>> device
>>>>>>> and driver
>>>>>>>> +   capabilities.
>>>>>>>> +
>>>>>>>>  \end{description}
>>>>>>>>
>>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
>>>>>>>> Feature Bits} diff --git a/transport-pci.tex b/transport-pci.tex
>>>>>>>> index
>>>>>>>> 95b08b8..a612b34 100644
>>>>>>>> --- a/transport-pci.tex
>>>>>>>> +++ b/transport-pci.tex
>>>>>>>> @@ -495,6 +495,12 @@ \subsubsection{Common configuration
>>>>> structure
>>>>>>>> layout}\label{sec:Virtio Transport  to ensure that indices of
>>>>>>>> valid admin queues fit into  a 16 bit range beyond all other virtqueues.
>>>>>>>>
>>>>>>>> +If VIRTIO_F_ADMIN_VQ and VIRTIO_F_EARLY_ADMIN_CMD has been
>>>>>>>> +negotiated, the device MUST support administration commands
>>>>> through
>>>>>>>> +the administration virtqueue identified by the
>>>>>>>> +\field{admin_queue_index} after the administration virtqueue is
>>>>>>>> +enabled and before the driver sets DRIVER_OK to the
>>>>>>> \field{device_status}.
>>>>>>>> +
>>>>>>>>  \drivernormative{\paragraph}{Common configuration structure
>>>>>>>> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI
>>>>>>>> Device Layout / Common configuration structure layout}
>>>>>>>>
>>>>>>>>  The driver MUST NOT write to \field{device_feature},
>>>>>>>> \field{num_queues},
>>>>>>>> --
>>>>>>>> 2.34.1

