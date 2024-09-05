Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C27126C1C
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520500; cv=fail; b=Isbk2VjaSG85hcfa6rTcFBe2H7WHYpmnjNSjtcxrE0WYTlkMZKD4X8iKOYblVhy487nyYi05r5a0xeMi4wVDKjaAb+8W0Zcpq+4pEWOQsvQW0q8UUAVKj2HkorbfBcB9PAgLoQXBTXlNCZ6JRBuSOvkYQcWLbcL5GlvPjUcMnG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520500; c=relaxed/simple;
	bh=WGMItBV69nsrhhRUdmXg4xim5P+N9hzKXqWMNvaEaj0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cAcGXS9DD4Cx4oB9l1CUHOjPN5/VbwNNSFGC+L7Hmgtli/KSOJLL7h8Vxxq3OOtzuH5+f+v822xCmAV1KzV2zfbMPcQLXDcDGXv0vHVcDQxOBmCsVIONGoB5Iuffh7KG5A98Kv8tcCKdxf5xXUvVUp3uSe0LqLEOKlJhs5RXmm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RTq+0LjP; arc=fail smtp.client-ip=40.107.237.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RTq+0LjP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFMjuC/KNymuXfEyX1r8bQxq3djgPxaPYgFzwbZVQGhtntKHp7GyOSRue3jr7pu2ejN06JxbjPdRJDA6Ey1FroiN6B3acOp9zvwU4mVIlRNbkEqub2ltX/iLbMr3hl7TVsyBo+1Eff9TnZcjWR2tTCc8AvTTw6dLauulVZws66gVmu7V7Dz1QkfWmRjgUbS4ValGx2CnTrVwibWOAdnzYrUxq1BuQB+eSzofJTM9Zb9ETQABeKkfe7Q/oDZEsMVT2TpLHqpNh7R6tM9UVk6zBb+qmR4/AkV5xpwPrgVFAr8GzUGhlY5HbdOpsVjZlMR2SJJkyPE/iYdCReZIuV1dXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12IM1NDr5VGt1KWUilWS+Fb3innEqIKYV525hDXOb2c=;
 b=HyvbkzxZksN7H3n9OwOomq5cUhx0/h+lRHIMS5ilGzswIOkdGG/+bkgWoRWmv9J4g+og/EIU1cNynSH0nUnd+p/lRuSId8eT7k1VCS6ReSPPu2Gq2nvz4SS9/Y8bV9jzeolCxbxamOUj93cmUnnV3FLyplj+ZyIgtNdHs0sWND1d85/R2/cBR/d+Vap38S9gzMKDbEyJFA2txPwFh+5Ui76eTDNsj1pqQ/b5bwD6xMIPtRP4QN3ebO4OL68LjRX3EJg+/cK4+P5b6VZmkOZnXWmRC677NLt+4mIdx9rfk8EzOk0WrAI8zuhpjciykcPJQupwKM+UphWXt7an8larMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12IM1NDr5VGt1KWUilWS+Fb3innEqIKYV525hDXOb2c=;
 b=RTq+0LjPhIRNikD8D6D6viKoo+LRDq1gm+EsvITseowTVxYc11ex26aSByCSId3WlTDCy2MA4/vgYcpu0V4BuHrtYaY06S6Vv9IVi9dULlOo43L9UH7Zj8GdPwRQYNE4/gWk4j27t+Y8DljzPXm6Z9o3NJ8vk4MOvm/osZtN+Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 07:14:54 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:14:54 +0000
Message-ID: <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
Date: Thu, 5 Sep 2024 15:14:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: bb666d9d-94b8-4ce6-992d-08dccd7a70a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akp0RVhTUHFycGcyMmlIZW4wSU01QndtNUlMcExacDFuVTRIRStacERyRnRa?=
 =?utf-8?B?RGQ3a2luc1ViNy9LYW5iMDBIbjk3M1JMd0xrYWs0K1VLVnlVMzlUa0oxb0FJ?=
 =?utf-8?B?RjhQZkhrUTl6RUF6QzJ4RDVmeHdmNWFkR3drODVYY3ZWVnpxeWp6WjFrS1lW?=
 =?utf-8?B?SEY0dzRNcUNQVzh0cTQ3cG1EWENrZzRnQ0NnNmZWNDV6WUIzTEhFK3J4YVlj?=
 =?utf-8?B?Sk0xTEdHVmJiL1k4b2E3TnZ3QlI1bk9OZ015ZVQyNW5IMlNuczJUdGlPUVdO?=
 =?utf-8?B?R1MvTytrR1BHYkF3MDlPZzA4NHd4bVZpUnM4MnlZQW1hREUwalo2TGxPQUJw?=
 =?utf-8?B?eFZtVUJXZC9qZjZUbFdDRkhic0pFWHFlZ1Z6dEpoSllFSmlCb3BkeDU2QlB1?=
 =?utf-8?B?OFFmSEEraFZpTWdDZzdJZkdaaERBKzdhMmdVV1EvWjRQbDFtcUFLV0RTTWxN?=
 =?utf-8?B?TGRLYTRCd0RPR3M1Y0FMSmJyUVVGLzcwc2dwb3poSHlVZjczUUFQQTZDbmlD?=
 =?utf-8?B?TW5RNFl4eHozemcrT2lkK3pMWnc3ZzVsZFI3VjJURUlzTG9IYjBmZDc3WUlj?=
 =?utf-8?B?dWtueGc4Znd2WUJWNXBsd0tCbHpEcGxkcGk0TnJ2SkJyUFYyN0sxVDJQZnBs?=
 =?utf-8?B?eDdSYTlMd1RmOUNaWFk1RkJjeDVXOXVaYk5HZG5XcEVHUFM3QmcveEFodjFH?=
 =?utf-8?B?VnJNR3pqTGIwdG1DQUtUeUpTZVEvTWJ3UXBrOG5rWUdtNWxmbnExb2sxazdl?=
 =?utf-8?B?RTRla0gzRTRjRnhmZHF1Q2dhYm9zbm5aODM1SnRFTm9tYzBIMTlNSVpvNVZV?=
 =?utf-8?B?TXBaZ1VRYzVSbXc1OGNWRituWE9nbzRRQ0FUbEZRVGtkaUNrU081eDhpdUVk?=
 =?utf-8?B?ZW9pcDZHTDVtUmRFRUlPdC91d3YzVjVROUd2eXdDWEtSeCtoQlVsVGpxd2Fu?=
 =?utf-8?B?aEZadGtENUx5VmFaQXRBaEc1b1hBVjNXVmltemw1SU4ranQ4WFlaSmllSkxG?=
 =?utf-8?B?aE1GaW9GMkVNT1dCRHQ0RTUvelZkTHNqR3NndVZLM01kT3ZDeEVrYi9sVG1P?=
 =?utf-8?B?dFRiQ2lYNk9sRXdrM0pyQnhPS2J1NDBUY2RsVjdnVkpSVzBHYlBBRXJUWWZk?=
 =?utf-8?B?bHI5V3pXWGVhRWFEVTFZWTJzcWxnVkFJaVVsVFJkVytJbXZjMWZvWVdTR09p?=
 =?utf-8?B?S3VFaFZkZCtBTHNTMjh5TUNIYXdOTDlDSDJUZHBDV202ekFqbXVEcU5zOEs0?=
 =?utf-8?B?OVN6bU5OU0pnYStJOWdBRW0raUI2Vzd5VVhsSXB4dFpnL3dXVVdEYUFDUEFx?=
 =?utf-8?B?amozM2MyTDV5bEltcGt6Mmp6bGU4UWtLVlJPbXN5Qk40a2xmdEx2U3JGRnVS?=
 =?utf-8?B?akZrVmVGeGlsZHJaNUNaMExUNnB1cjNOQUFVZjNaemF1NHhzc3BNYjE2L1RB?=
 =?utf-8?B?M1BGVUREMUxLRnE1OGV6RW1VNDcwTVlyVWRsbm9TTjVjQWdxQVBVWmNRd0VX?=
 =?utf-8?B?OXdqWG5VQ0FSQzQ3R1d0Q3lHdEVvNjdkKy9wYzZ5d3ZVRVVrOElwL3loMTJu?=
 =?utf-8?B?T2dLSGVod2dBNFFxSm5Xa0pVTFVXaTNISXR2NndOSVhvZnVPamJ2eTFyMWl6?=
 =?utf-8?B?QWlyM3U1d0x5eUJPSkpLUG1QTDF6UUI2dnlmNmUyK3R4QjY2clowOUtjS0RO?=
 =?utf-8?B?K2x3SlhrS2xBTnIxNllJaVI0M1lKNkI0VnVsVnlsRlNVSkhYWUJrTytCK2hG?=
 =?utf-8?B?aWxIUU8xUHltbm9SYXI2RUtvN2plZ2YyNEpadU9Qek5sYjc2dUtKVjlPbFVp?=
 =?utf-8?B?eVJwcmZJQm9uaVF0L3drUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qks5cUJuNjBURldMd1cwd3Rja2huUlFFeEdDa1QxaFFhZkxYQ05JekkxNGlS?=
 =?utf-8?B?NVdFUEtPeTVwWXArallCUVVRQ1Z1d1FrQzhBTzVlM25qMWYrYkwreXpSamdH?=
 =?utf-8?B?RVJmbWQxN1dLL1pOZzBXY2Vkd3JsREtEdUN3MC9RNHZFek9FWFRPdnhEdE1a?=
 =?utf-8?B?SW1Vc0hsVXZTdlBDZkJVbVhMVjM4UDU5anhJTlFEZXZ5ZDFlaCtZRWJ0ZlNk?=
 =?utf-8?B?cmZhNC9NZVNMM2tDWlovVUprdEFsWGlvSTZvSjNnZGxFMk5GMzBoeVlHZ1pD?=
 =?utf-8?B?RmQ1VFNDYmJNVGpOY2F5Q21mZWdIRUF1QzNtR3lkMGU3b01sVFdET044SE1C?=
 =?utf-8?B?bEZCaEgzb3NsaXBXaHJnSXRNSTdJam9MTklWQ3JibnBlOWMyUW9pWlVlUFpB?=
 =?utf-8?B?VmpIUERSOElMckpJNktSMmMxLzd3Yk5Hc1d2dlBBZlhlcjROTk9zL1IxRUNo?=
 =?utf-8?B?eC9tSXhTT1JOUHhGRWptZ1dDOGRkcjQwUEhqTnBjQlJaRWEyRjVVOVJHQ2FX?=
 =?utf-8?B?bzgwUUN4VzBoWVR0d3prRm5iNXd3T28wdGpScGFqZHNnWjZjZ1hCWkpuSjlt?=
 =?utf-8?B?MEVLTHpIK2pUa3lTL1BrZnRZZmRwSHhvbzU1V21RUm85MWllOE56ck9IY2xB?=
 =?utf-8?B?cytuWnRTY0RkYkxGYlNid0xBZEFnUVlZV3JxMktOckFVNWVsNkluL0x1eE9a?=
 =?utf-8?B?bndCVVBTTWxvZ01Eb3pNczNmc3lVV0N1YVRsTEJadUpTYlY4WTBPQnVuSTFS?=
 =?utf-8?B?VEJiVlhFZG5SRlpsYVh3c2oxWElxbVRDVHJEcy91QnhhblZxWGVKajhoVlVV?=
 =?utf-8?B?N1YzWXV6MWVuL0JTK1FPakpybHpVNlp1OUwxUjZaQVByL3M5b0V4UzlndUpn?=
 =?utf-8?B?RUcwdlp2VVJ4RGQ3dThRMHhSSzNSQjl6eUp4TldyTkJ2MWYvdVJJOE1rLzl4?=
 =?utf-8?B?c1BZOW11a0d5bUxxS21pVnFqRDJJcXVrU3NqWGkwVGRsbzhGZ0haUVlseWpH?=
 =?utf-8?B?NlNYc1RBRnljd3NZNkRHVFhrRHZ2QWpWWCtoOHJiOTFIWUtIOGxJdGJaeU1q?=
 =?utf-8?B?K2l2RGM1dDVWQ1JhSkk0R3J4cURjY2syZTFZT0RNaWJhTHF5Ymp3TjRYOWsr?=
 =?utf-8?B?WjRyWVZZSHNnMURHeHJCNmRCMGxqOGcrZ0lIT1RNK0VnZkZhMERiQ05YT1R4?=
 =?utf-8?B?RUZDemIzMWJ4alNlRkhwQThYcTRLVDlTMU5aL1JQY1Y4WEpXaTZFbXRBV2NT?=
 =?utf-8?B?QWdNV3hRblZGVkNkU0k1bGw4aDVWT1RGalQ0OUF1V2hTUkhkUE9hdnpRVlZG?=
 =?utf-8?B?cWN5V0daUmREWmg2TXQyQ29oKzIzS083RzU4UVh1Tk14cGo4YWwzNlBaS3hH?=
 =?utf-8?B?VDNpU3V4QjNRS3ZoNlY3UmV1c1VXQnVRSFNMVXJsWHk4QVpqUFdsRkRKS0tx?=
 =?utf-8?B?OU5KSEUzbHg0VE5RcmdxVUJqczFkWTBYZzVDWXV4dlRGbU1nMDk2UERvUHAw?=
 =?utf-8?B?U2NhQTV2MG96dERpWm8rRFNoMHBpdkt6aUt4QklyS0Yvd1B1c1IwTnpnVnVT?=
 =?utf-8?B?ZkU0RnZ1U0ZEVHlLcUdXbkRjWS9EaFM2M1JteENWOGh2WmZKNDFlZzcycmJH?=
 =?utf-8?B?VDdSaDRYZ2dlcEVrQ1F1U25WTHJHM2pCeVVMaXBjQkJOU1pnZHV1TUdVWXFr?=
 =?utf-8?B?Y3VWTHRTVW1QSlNQRjVxNER4MkVNbmpkMjVSc0hnbERkbE0raUtzbTZGcjMv?=
 =?utf-8?B?U1k4NGpUdDBSdE9qVXpCRUc4b0tBTVRaNzcyVEpjM1ZiRVh0UnBqZGtVUkpJ?=
 =?utf-8?B?eThiazF5ek0wUGF4SUxEdmkrVFFmK0xRQTJ4QkhZNmw4UVhvZlYyM0NHTkEw?=
 =?utf-8?B?eXY1OHFjWEg3TEVnRkFHNjhnRmY3R2xQaHA1cm5KMmpGdlNKMGFla0t3ZDF2?=
 =?utf-8?B?KzNJMWN6RDhqU3BWWFRRL2llb3hscmNNMlBrMHU2NStEL1NTMTJxZ3d4TEgr?=
 =?utf-8?B?cEsrVXU0a1hFd00rb0FYekQ3SlV5MmFTSWRtUkFoOStZd3oxNDR3eHljZjNj?=
 =?utf-8?B?WUFKbHo0bEIwYVNrYnVQamgwcXhwbGRWU3pwaEp0cFFoZU9oU253eWZKY2R1?=
 =?utf-8?Q?nJcWLX2zDFC92mjQ6eb0Ibjv7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb666d9d-94b8-4ce6-992d-08dccd7a70a6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:14:54.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFXC+B9KkqKnVUZjiHT4tXMc/s6iknQFeEsnww6uDaW4YciVDkGEGxa5pe8ExV9+VW6asmm5CJmGmn4rg81aww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932



On 9/4/2024 2:46 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Wednesday, September 4, 2024 12:09 PM
>>
>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com>
>> wrote:
>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>> But I don't like it that looking at the registers, one does not
>>>>>>>>> know the device state. Hidden state is bad for debuggability.
>>>>>>>>> We have 4 states:
>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>
>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>
>>>>>>>> This is why letting the status tell the status and control register to
>> control thing is elegant.
>>>>>>> No argument here.
>>>>>> Or, to be more precise, our status is driver status.
>>>>> It looks like the device actually otherwise there's no need for
>>>>> re-read or poll for things like reset and others.
>>>> The need is there for complex device state transitions, which can not
>>>> reasonably block a read response.
>>>> Another standard approach with PCI is to specify the time transitions
>>>> can take. I consider that less elegant - is this what you are
>>>> advocating? The advantage is that driver does not load the pci bus
>>>> with constant re-polling.
>>>> The disadvantage is that it is hard to pick a universal number.  A
>>>> combination of these approaches might work, e.g. a recommended
>>>> timeout then poll.
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
> Sounds good to me as long as new functionality does not force the device to react in 50nsec.
> In the current state it forces the device so please upgrade the proposal as Michael guided.
Trap and emulate is very often in virtualization, of course the sooner the better for emulation.
But there are no 50nsec assumption and no one can force the hypervisor to finish any emulations within
a certain time 
> Thanks.

