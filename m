Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014D1C6AE
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718188226; cv=fail; b=bD+7Cv9c+gyG+imE8gXt7f9upObWLqvqLI3SgK5CiB6DpLtQF4zgrfS30AVuONJfgWOqIW9y0q/94F3uxrxvWYu+bTOyl7S0JTYGlQGxzzzpElVj7Ixw0/iO9RifYonXyOMQxChfeGrg9qScvno+RL5iJbyORzx/s32AQCd1PkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718188226; c=relaxed/simple;
	bh=vlKuWwqoR097TndIHb1DiDKq6b7GNRUkaj67hYKJ8Jw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QrjO8vkV5IV7tFfar/S1kJyVF0JKTogZ20F0j4//jp7DvtkjmV/BXDbi7tmTciXHwVg5r8dQOWB5WgrYVJVnkGriZl+Ykq0lPtjjerkBxHF62hMjx0mMUUBcO0xMwNxncbx/4a8wTJ85z0xKp9s987T5NHXIONiEMYhpu9V3MHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cd76FvMF; arc=fail smtp.client-ip=40.107.223.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cd76FvMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKfyv/we2yPxN1O7dN86ojEksy1U/E+7XbRzmGZhZCOxBS0c621xyAfrf6KslVON2+rSXRqnCcO382Vj3hrB9euH5W1Bc/+15VdfBrqED0Rxzpd+XcTMJkbT3icMBdR99SIh4WPKvhiiZN4cg2YeROqzl50OBdm23ZHfdG7jVzQjgZ6OFGPcitJzVrS/ZTRJAMKvTda9t2Yl5+BEvVkF0eVB/4tzA5XGHW7YRtHtQmZ7uu0IIG+OW9D4dWgNkbAqyTSHsed8FwnfySqOcZQQneNCNXK7zy9FOOTYKfD3JU/+Cf8vhA4PQuRO5C3iEAocIdIo/IH11QZ+//vMzBYNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjNDSgODfvzzCzs3msQAT63P/U956RRF7d5ntR8Y1w4=;
 b=YYh3PCn9aB2L9hHITOK4ZErlhQ6/AIlYwW1MtWh+PIsAB5EAZhnvMpnio1PZDCm5jhg3N1wxSlizKUcANJhmTQLbdr2bsDr9WzoyQty3ACZdE7fiIdxPLGPNhkxunDOLoDwhAnz/gR74ScEIpvZ8PPGAV5Cn5nVb5AzPWJ+ejwVpgqN9it/TOCviHYXWJbhMisIJ+EJeJ7z44K221ZliioTiAacVJwjZq6SLQnuYMgNl4YPZx81Pbv1rL+fCpR4mypxIx7oLQgvfoFdLLtwbm8xWOd5qmqHy7W5T8F/RT5AHhz1knf/To3OUcTkfrAtqmv3ZPN8j/4f516AuJsMnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjNDSgODfvzzCzs3msQAT63P/U956RRF7d5ntR8Y1w4=;
 b=cd76FvMFLXfMSnafTELBmlzTWHV1Lw1wDJtR4oYypiqXNK6nmmqtFEYIVEzfudQxt5Z+MuLcqQyE/y1CBSCAYGMy5TXTWtn5g51tfPGhcNcEYGpuoh21cN1m6NX/nW9x/ksews+EtFxQ31Xdtwm59Dga2lPKcApzt1Et3oN9E4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 10:30:21 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 10:30:21 +0000
Message-ID: <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
Date: Wed, 12 Jun 2024 18:30:14 +0800
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
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cec527-f701-40d3-af0a-08dc8acaa994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnNNRFh2UnNFUG4vT0w2SmR4bmVnRGdRMElNZFNHNm5hM1piT2NHaGJubkVZ?=
 =?utf-8?B?YkpyU3ZkeTkzOXhPLzFNSUtwV2dvWVIrQk1ad2crdFluRDNSTVFpT1ErQzFH?=
 =?utf-8?B?eFBtWk5BS2F0cEVhLy9BeVM2OHNmN1VIRzdPbDA3dVprS2oxRDNKMzBBeXph?=
 =?utf-8?B?MVdqSEdwZjBiSTBXRkxhZ2I4emlrUGd5QzZSRHZ2UHZJRDZsQXVyc2FRejJB?=
 =?utf-8?B?aW1BWnBNTGkvcFY2V0Q2djJnWGl1LzRMWGFGZ0NVMlRkNWxCVVpzNnpCZFJ1?=
 =?utf-8?B?VXhUdDdFRThKbmU4eGdsWlFlOEk5SjVMcHdEL3FyQitWcXVTck53SS9QeFJo?=
 =?utf-8?B?Nmlvd01xMVFpZTNGUzJOMEYwdVU3RkJJRWN2SFBDa1U2dUNlYzZERlJ2RmlK?=
 =?utf-8?B?L2FrQVFadkdmcmpTelpKcTEwU1Z0bndGRmR2bXluL2NDbUJGTjc4RmpWb2hY?=
 =?utf-8?B?MUZIZXo0U1k2THNYRk1qR2ZBSXhuckJ2bFpZakkzQVBSeWFMWlkvT0ZocUZl?=
 =?utf-8?B?SUkvS3U5S3ZaTkVjNTZDck1laFE2YUMyVVVMcEpJUDlDb05PYmpJQlV3OGl6?=
 =?utf-8?B?VWxJblN2Z1czRjFuVHZ5OGJ0Qm8relhHcG41WWxuTFh3Qjl1YnYvblRIeGc5?=
 =?utf-8?B?M0VLVHdMRlpkTWR5RHFZT0U1alI1bGpKNkpIODN3US9sZU5vQkJTRHhIdWds?=
 =?utf-8?B?SCs5S3Q3OVhwWEFFcStxeFU4VEkyWTVibTlGWFdpT3IxZjZhSU44L3BidFRw?=
 =?utf-8?B?VFI2Nk5ON1BYRTc4SkVjUmpSQ25WL2VrckdvRFhQU3d0Q1Q4ZE1UUUlSQ3hV?=
 =?utf-8?B?ZUJZUkFOTFduYnN1Y0x3SUxaNFQ5OEtXWXQ3VkViazNOYy9aajZ3UHZWQUdK?=
 =?utf-8?B?TjhYYXZkcFhXRUNIQ3U3QnVJTnVEOVU3Ylk1ZHp3U3F5QXc4eFA5Qkl3aHpW?=
 =?utf-8?B?RXU0aDJFQmtqN210V1I1NW9hL0hzWUdTOWNMVVB4UnBLY3l2R016c2RpTk5Z?=
 =?utf-8?B?MWg5QWRvdzh3MXJNS0ZKZzNmY0dRT2tQbFF1U2VCL3V1Z1c2b29OVHRQRm5O?=
 =?utf-8?B?TVdtWU41VTIrYkw1aExwU0J0NTZuOWxobUpUUXdMNjR0RjlqSVBXNnJEYWw4?=
 =?utf-8?B?YzBuaEpTZko5S3pINHo3cGNydU5yTEM1anlBcEgyaW0zejNoRytSUGgyUGtw?=
 =?utf-8?B?LzI2QVYzUDdsTlRxVzgvWC8wbTRKVnk0dFhvYkdVYVlGUmJ0NTViSE9yczVt?=
 =?utf-8?B?RnVPRkFsampMM212UnFnYU95N1BCQ2R3R2ZZMFkwcURkWUhZOWFUbGVNUmZP?=
 =?utf-8?B?OXpvZzFqNG5ucS9uZ1RoSlYzS0hhUXp3Z3ZSd0tvekFadXIvbUJLR2NpL1VL?=
 =?utf-8?B?Z1FOcGkrOXE4S2J2RkRraWE2Zll2VzdkbU1IUVJ0UnhjODNMVlBuTGozZzBI?=
 =?utf-8?B?UVRRQm5GQ0Q4ZnNUWkxrdDdrSzRmdHNtNmpTK0JSUkRxSjlNVmZEZi83b1l1?=
 =?utf-8?B?cit2TkQ0YUo2Nlc0NVovYmdUVTdtWncrSVZrOEt6czNjeHIzWUl2bVc1UXlI?=
 =?utf-8?B?ZWppQnppa1g0NFQrd2RjTUtRbllIWlBDV0pMV0RlNXl5UkRyMk9CbnRtTm9a?=
 =?utf-8?B?Z1RWckVOendYSjY1bG9WM1ZzYjVsV2Y0NkowdTBGcjJ3NGkrYWxDNXE1UTVy?=
 =?utf-8?Q?ZFztcqMlV8BFHU/rR/Ti?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGh6TXlHSzZkaERDM0M3MHNtN2VNeUJPUEV1R0RMenpmODl6YXI4UHBvclN2?=
 =?utf-8?B?ZmNMSGdqaS9zVllPMlYwc082Zk8rb3RLc0ZUc1IrT1UrL3I0TkpGNEpnRkRS?=
 =?utf-8?B?eVVNMDdFYU1XNjJIbTlWSUlUNE5rZ2FDWUd4eWgrSkVMLzhweHVsUzFWYS80?=
 =?utf-8?B?aWlZbHZWZGlVNktwbzF1M2ZWRjA1emlIZWUrUlVnZXRmZjNETUwycjk5Q0xC?=
 =?utf-8?B?UEdVRk1BdVN6Q2h2U050NStlMkRWNi9nZEl3WG5RbEh1Q2t4ZElqQjBuVG1D?=
 =?utf-8?B?NEZGSS9nL2VDaUFieWNva1hadTZOOHFxVEtHR0RhMU1LR3ZXc2hKUFd3RmIz?=
 =?utf-8?B?T0ViNWtlUkx6OGR3ZXB6Zm5tS1NXQkZUVUswRkdTQkh4bUtEVjVKbTdNRHgx?=
 =?utf-8?B?YjB0b1YvVzl4OHlaM2xWSW11QTk1dGlnb3Q4WjFBVkVwVzNsMGtPZTBab2t0?=
 =?utf-8?B?cjN6ZnFDak9FdGVEVWdZbnBpeTNncFArVXBjTlpzNDdkYXdYVTNHVDJFSkZx?=
 =?utf-8?B?OXRPRDQ1Q0gyb2k4aWRPZ0hNd2pFZjlYeG53OWYxNCtBSEFjbFdLRS9SZWd5?=
 =?utf-8?B?dTlCd05tNFo4YVd5M3RCaHh1R2ZIa1hreUxra2dDeHdjWTgwSVhNRkZFQmNW?=
 =?utf-8?B?ZUFiRWR5N2Q5aC9ha3c2cFdxd3djUThMd0llVVQyZWV2alE0L0dMWmRtY2lx?=
 =?utf-8?B?aXMza256Z1NkalMzeGkrZjYvYWFWaGx0dytQZ2N3Y21GOVk5aWx0QUZUZ1BK?=
 =?utf-8?B?OHBDTzRCWVNFd2l2cjFRWDdEclVxOGs0V2RVRk90a09FRjI2aHpDSnRxNDc4?=
 =?utf-8?B?Q3d3cXM0ckdYOGZNVjlQQ1Bpa1RsOWwyOWlUYlJtOHRIVkRyU2QvcFVEMDh3?=
 =?utf-8?B?M244NlNicWNTa0VUOGpNcFo1ZlNlMFRxTmdhYndJV0pjNUhOVW9xK1V2QmMv?=
 =?utf-8?B?M05TMk5ETTREdW9xL3pnREUxSjJNSlYxOFpObGpWdU1mbEJON2pvYXV1bS9S?=
 =?utf-8?B?TWhsRUJsS3VsMXlZdVZseFdOQ2dkVExUaUxEaFNvNFU1akFNQ1F5MWRRRE1J?=
 =?utf-8?B?ZlA3djJ5amFCTlArRGdkVndYRFI0TUFGUVJjb1k4RE9DaWhIZ21NUUVCdUZi?=
 =?utf-8?B?M0FyVjEvYUk4ZXk0SGthN2V6RTliYVYxczZDL016WUE5TjVVVytWaHk4L0gz?=
 =?utf-8?B?TVhSNkpvM215SWZHcDRJcU9ScU5JaC9QU0Exd1pDTEdXcUVaOG56RTFNSG9n?=
 =?utf-8?B?SVZ3YUdUQUdudUJnV2NzeGxReTN6SnFGaXZxMzl3TFd1dVRLYzBmejNRU2lR?=
 =?utf-8?B?TWp2VzE4TDRBQit3MVk0SFZLaWVIVEtSaXB5dXVyL1JpWG11SXFxYmdHZVIz?=
 =?utf-8?B?RUJyZHZseWpReFhXNmg4aFpJQngydnIrU1RVQUQvQzlSZXlXeGRtd1lIVnBR?=
 =?utf-8?B?eCtpbW5pbU4zeFlUemlHWXY1RHE3S3pqT0dkMFZ1b0Iya2tTMUZpdFFvQUlT?=
 =?utf-8?B?enB1NGlocUFOMXdQSlZuZE5oYnlURE8zVzBncGw5M25wMUF2T0Z3R2o1ZUFP?=
 =?utf-8?B?SE5mMHgrRkkvU2o3SXFsaG9hWEFlZ2JzWFYzbXMybWlTcVZNR3RreXhINGVG?=
 =?utf-8?B?cXp4SHhINE1ybmNjRnZYVUcwMnZDV0JXTnlQeXZPUUM5ejN6eU03TWROekpD?=
 =?utf-8?B?NTJwaURiQXJOMHdtb1hKVHhveEx6RjNwQUNPN0NWM1ZyTUlFcGVCNWh0bGFI?=
 =?utf-8?B?RktmQkJDSUs2WUNFYzlQNkxsdFhBMDE3YllUS3RvOFZJaUFCUEdqS0xZMnc1?=
 =?utf-8?B?V0dOU204U0RWU0ZzQ2QzQ2tOVFRDNElxS2dQdXhCOVFFMCt5Y0xkVHJ1OXZ2?=
 =?utf-8?B?V2ZsN1dQVjJqUDRmV0pKVEg3MmJObEhZajJuYmFEeGErOW1MMDJzYml1UHRv?=
 =?utf-8?B?K2U4RWN1aGt5ZVNHQ0JqeWsrbWZrQWpObUc4ODRnV0E2RFM2eHV3R0UwQTNR?=
 =?utf-8?B?TFY1Nmxad1VNQ2NYWWNCTk5aZnN5WHJVTXNzbzY2TThsbHpIMG45YzlpTWZN?=
 =?utf-8?B?MDNleXk4bnpXdzNpbjJUQ2thTmpuVjV3QVliWlVRNzVPbjF0Qm5Rc2M5ZmY1?=
 =?utf-8?Q?jB9r9xUwpr0fdJ6AwBXkXGQ+e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cec527-f701-40d3-af0a-08dc8acaa994
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 10:30:21.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWucLS7uk5X8PJL3xRRCVFw82RoBNyGl8KyOT9wCW7PDyiu6N8iicxglNaf4pPI1cqBrCiH5/8lcai0CQY/AVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900



On 6/12/2024 6:07 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Wednesday, June 12, 2024 2:50 PM
>>
>> On 6/11/2024 6:37 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Tuesday, June 11, 2024 3:42 PM
>>>>
>>>> On 6/11/2024 5:43 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Tuesday, June 11, 2024 3:03 PM
>>>>>>
>>>>>> On 6/11/2024 4:48 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Sent: Tuesday, June 11, 2024 1:57 PM
>>>>>>>>
>>>>>>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
>>>>>>>>> Hi Lingshan, David,
>>>>>>>>>
>>>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>>>>>> Sent: Monday, June 10, 2024 9:34 PM
>>>>>>>>>>
>>>>>>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>>>>>>>>>
>>>>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>>>>
>>>>>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>>>>> ---
>>>>>>>>>>>  content.tex | 69
>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>>>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>>>>>>>>> Can you please add a changelog? Especially as some of the
>>>>>>>>>> previous discussion has been lost due to the broken old mailing
>> lists...
>>>>>>>>>> (...)
>>>>>>>>>>
>>>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>> +
>>>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>> +
>>>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the
>> device:
>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>>>>>>> +whether the
>>>>>>>>>> SUSPEND bit is set.
>>>>>>>>>>> +If not, the device does not support the SUSPEND feature.
>>>>>>>>>> That sentence is a bit weird: I'd expect the device to not
>>>>>>>>>> offer VIRTIO_F_SUSPEND in the first place in that case... could
>>>>>>>>>> this rather happen if the device is not able to handle the
>>>>>>>>>> request at a specific point in
>>>>>>>> time?
>>>>>>>>>>> +\item The driver MUST NOT make any more buffers available to
>>>>>>>>>>> +the
>>>>>>>> device.
>>>>>>>>>>> +\item The driver MUST NOT access any fields of any virtqueues
>>>>>>>>>>> +or notify
>>>>>>>>>> any virtqueues.
>>>>>>>>>>
>>>>>>>>>> "send notifications for any virtqueues"?
>>>>>>>>>>
>>>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>>>> ...except for the status field, if it is part of the config space?
>>>>>>>>>>
>>>>>>>>>>> +\end{itemize}
>>>>>>>>>>> +
>>>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>> +
>>>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>> +
>>>>>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>>>>>> +while suspended, except for \field{device status}.
>>>>>>>>>> ...if it is part of the configuration space.
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +A device MUST NOT send any notifications, access any
>>>>>>>>>>> +virtqueues, or modify any fields in its configuration space
>>>>>>>>>>> +while
>>>> suspended.
>>>>>>>>>>> +
>>>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>>>>> +clears SUSPEND,
>>>>>>>>>> "subsequently clears SUSPEND"?
>>>>>>>>>>
>>>>>>>>>>> +the device MUST either resume normal operation or set
>>>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>>>>> +
>>>>>>>>>>> +When the driver sets SUSPEND, the device SHOULD perform the
>>>>>>>>>>> +following actions before presenting
>>>>>>>>>> SUSPEND bit in the \field{device status}:
>>>>>>>>>>> +
>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
>>>>>>>>>>> +Wait until all buffers that are being processed have been used.
>>>>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>>>>> +\end{itemize}
>>>>>>>>>> So, is there any opportunity for the device to fail setting SUSPEND?
>>>>>>>>>> I mean, if the driver is supposed to look whether it sticks,
>>>>>>>>>> there should be conditions for when the device might clear it again...
>>>>>>>>>>
>>>>>>>>> Additionally, a suspend operation usually involves saving things
>>>>>>>>> to a slow
>>>>>>>> memory (or media).
>>>>>>>>> This is because the device implementation wouldn't know when
>>>>>>>>> exactly the
>>>>>>>> device will be resumed.
>>>>>>>>> Few examples, are:
>>>>>>>>> a. A gpu device with 128MB of video RAM when suspended, QEMU
>>>> needs
>>>>>>>> to store this into a (for example) rotating hard disk as 1msec IO latency.
>>>>>>>>> b. a NIC may need to store its RSS, queues, flow filters
>>>>>>>>> configuration for
>>>>>>>> several tens of KBs to some slow memory.
>>>>>>>>> c. A block device may prefer to complete some IOs to a threshold
>>>>>>>>> level
>>>>>>>> instead of maintaining large list of outstanding IOs in some
>>>>>>>> suspended memory.
>>>>>>>>> d. May be more in future.
>>>>>>>>>
>>>>>>>>> Additionally, suspend operation needs to be synchronized with
>>>>>>>>> certain data
>>>>>>>> path hardware engines to suspend DMA operations (read and write
>>>>>>>> both) which are inflight.
>>>>>>>>> (without causing DMA errors). Same would apply to the sw backend
>>>>>>>> implementations too.
>>>>>>>>> Therefore, the suspend operation that is initiated by the
>>>>>>>>> driver, should get
>>>>>>>> the acknowledgement back from the device that it has been suspend.
>>>>>>>>> Some of the good examples if you prefer to follow, a
>>>>>>>>> driver<->device
>>>>>>>> interface needs a suspend register which should behave like below
>>>>>>>> queue reset register.
>>>>>>>>> Spec snippet:
>>>>>>>>> "The device MUST reset the queue when 1 is written to queue_reset.
>>>>>>>>> The device MUST continue to present
>>>>>>>>> 1 in queue_reset as long as the queue reset is ongoing. The
>>>>>>>>> device MUST present 0 in both queue_reset and queue_enable when
>>>>>>>>> queue reset
>>>>>>>> has completed."
>>>>>>>>> At minimum, we need, something implementable like,
>>>>>>>>>
>>>>>>>>> The device MUST suspend the device when 1 is written to the
>>>>>>>> device_suspend_ctlr. The device MUST continue to present 1 in
>>>>>>>> device_suspend_ctrl as the suspend operation is ongoing in the device.
>>>>>>>>> The device MUST present 0 in the device_suspend_ctlr register
>>>>>>>>> when
>>>>>>>> device has completely suspended the device.
>>>>>>>>> The device MUST resume the device when 2 is written to the
>>>>>>>> device_suspend_ctrl. The device MUST continue to present 2 in the
>>>>>>>> device_suspend_ctrl as the resume operation may not have yet
>>>> completed.
>>>>>>>>> The device MUST present 0 in the device_suspend_ctrl register
>>>>>>>>> when the
>>>>>>>> device has completely resumed the device.
>>>>>>>>> At this point, the driver may resume notifying the device and
>>>>>>>>> accessing the
>>>>>>>> configuration space.
>>>>>>>>> Can you please enhance this part?
>>>>>>>> Hi Parav
>>>>>>>>
>>>>>>>> Yes they are necessary contents and we will address them in the
>>>>>>>> following patches.
>>>>>>>>
>>>>>>> The register polarity is critical.
>>>>>>> In your reply to Cornelia, you descried that suspend bit cleared
>>>>>>> in the device
>>>>>> after driver sets it (until the device is suspended).
>>>>>>> This is ambiguous behavior of the register. Queue_reset register
>>>>>>> was like that
>>>>>> before it was fixed in 1.2.
>>>>>> once suspended, the driver should not access the configuration
>>>>>> space except for the device status, so it should not reset any vqs
>>>>>> through configuration space.
>>>>> I am not talking about VQ reset at all.
>>>>> I gave an example of how the VQ reset register polarity works (with
>>>>> was
>>>> broken like how the proposed suspend bit is broken).
>>>>> Suspend register needs to work the way the reset register works.
>>>>> Can you please go through my exact text I replied in the previous email?
>>>>>
>>>>> Basically, the bug is:
>>>>> When driver has initiated the suspend (writing 1), the device
>>>>> continue to
>>>> respond 0, while suspend is going on.
>>>>> At this point, just by looking at the device_status register one
>>>>> cannot figure
>>>> out what is going on in the device.
>>>>> Is driver initiated suspend is ongoing, or it was never started.
>>>>> It is ambiguous.
>>>> From the device perspective, there is only one user: the driver, and
>>>> the driver sets or clears SUSPEND, it knows the status of the device.
>>> It does not work elegantly when the hypervisor or other system is looking
>> dealing with this register.
>>> In current proposal, anyone else than the driver looking at the device_status,
>> it is ambiguous.
>>> For example,
>>> suspend_bit: 0x1 suspended.
>>> 	     0x0 not suspended or suspend is ongoing. (ambiguous for
>>> hypervisor debugging this device)
>>>
>>> For device migration, it requires yet another side bit in the device parts.
>>>
>>> An elegant and non-ambiguous interface can be,
>>>
>>> ctrl_register =	0x0 (a usual default)
>>> 		0x1, suspend the device
>>> 		0x2, resume the device.
>>> status_register =	0x0, (still) running.
>>> 			0x1, suspended.
>>>
>>> With this driver and hypervisor (both) has very clear view of what is going on
>> and what is the status.
>>> No more ambiguity for anyone.
>>>
>>> Please consider pros and cons of both approaches.
>> The driver "owns" the device, other components access the device
>> configurations through the driver, I am not sure there are other "owners" than
>> the driver.
> Device migration and debug channel [1] plans to access the device from the hypervisor.
> I don’t see any disadvantage of separate control and status register.
> Do you see any?
>
> [1] https://lore.kernel.org/virtio-comment/20240601145042.2074739-1-parav@nvidia.com/T/#m14b80fd996e8d2522723967d8af844b70e131a90
is the admin vq governed by the driver? There should be only one owner of the device, or you need locks.

I am not sure we want to repeat the discussion on the admin vq for live migration last year, you know it breaks nested.

