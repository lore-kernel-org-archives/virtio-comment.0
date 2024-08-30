Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732B1D1315
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724985120; cv=fail; b=VTHtoU5VxAWNC7y+0zn08f6Evqwsr+lxtmYAAOK6+95w2BeiCZHPCMEkH9iz7CKI+IY7SNUDICzhyZFU2l1dLTzxKYVckqDDfNbOf+b3Q6mQVGEJqD6fFr6Nv2wJE1VVJ4NN1mWs8lgv45A3MQyiMTgwEgJjXJEw3Xmdq6c/f9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724985120; c=relaxed/simple;
	bh=3mfZnPjI5bhrSdsRbJVpALgXu7ixSpxb4oP4j2v8+f8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NqVpC1zuDK5OhbgfoPLs8wX+Lbia/CFJF6ZFjW2Ie8chMkrVOLhq4p8h0FjxEwp3XisuJkh0Qg7+MFq/YKSktFr/JMSlvwMgp6H6TE1y1sTQhLkqumUbft6k2AIeZYuwtmIAZryc9Bxz4Us1p/w+q2hzEWBfUAoNWBPo9jQo6Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P47XDiUX; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P47XDiUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SILTa6my+0CeKBeYxYXPOgcGhXw98QqEzij/g+gqsamL4gt6cqaFIWP5n+oMxhqMqqNJp5EbeorRLdOI1iuqOQEVoY29Y3Yh6X28TOFbfqXI+pav80hJg/ZeizC3LSEDyZzVBZQrQ0iYmPur6caD7uHCx12MPf/6w8paZOPe8MzrjHwnCMTfJQzzTyOUOVLjCMaoGVvk6on1aWaoJ8IUO8GsO4n++ROrnBUdyA2uAy9Bjls+bw9Cz6JPPSmISPcGxCasdgyC1gyq+ozaWQqFYSSKxfbxp55M9EDKKxoJ+SLiQw2cKYL+eNC9TlF5usHF+6LlbXF1EO5QinSInXrkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbiqUhx3PefoX1TWFjKYVk9wVh1c0aZEcKHqMrszTCA=;
 b=NUCAcsDStBengI/TwFMv5/alY4OXX6wWCFbDSfdXThba2bgAUXiKhhi50n3C770TEvyJs9YB3oPw80sd/taq/ny3gE6IQ1kKu9AZHhETMl7bcX78ChLGzVFAyCOxq5VQiJqTV3Dt4UWhsm1eblTAOMGYXW7brc9p3rTO/yHrv6e5tXlydar9CpDp77JKV6PPxj6VyywcamisvJkfwtcBfc/zsX4q4uNXNwikxPrMg1qt0jpXPGhbocYlyrd7COZushA5flpSNVFGzfwW52dP867chWhk4zMF9k5BN3+oCeLP+a81Bac0Hv1Wi0sihmnhYzEC5K/lFxBWazNN94wf/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbiqUhx3PefoX1TWFjKYVk9wVh1c0aZEcKHqMrszTCA=;
 b=P47XDiUXpjkYmqtvmDSjwjPtmulUaKSKdzMnvc3TUm2GeukWkSoZA7PJU7PMKHhHFqucF+vDMMV0lCd/G0WIv322QhCZ4F5QI6HyeAj3pqyDB1aQJ90KXcuAeG1Fi1fmyqWc1tZ+cb+N27ifVyjW2f65kuE0HnjPIWGAIcJA3I0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 30 Aug
 2024 02:31:54 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 02:31:54 +0000
Message-ID: <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
Date: Fri, 30 Aug 2024 10:31:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4d4a15-70be-4e50-0af2-08dcc89be96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE1BeW10dkpoS0dHeFZlbHhiL2dUTTRlbXFYeFpjTk5ka0VLT1E5RGNlUllu?=
 =?utf-8?B?SW1MVU54dE1sVGhwZEtkT1VOS0NtSW45YzZteEthZlhDa2s0TTVoamJveWFV?=
 =?utf-8?B?czFsQjI1OUdGblFFcWQ2N0syZTBOVmt1dGhzSTh0c2dnZ1J5RkFwU0dDWEZV?=
 =?utf-8?B?WE9BZktURjhkNDlvUW94NHAwYzR3bmdJVFRDbkY4aWg5bTdsVURmNGYwczY0?=
 =?utf-8?B?ZytMdXhNUDVpa1I0aHdxdnhESGlIVHlFRTRia1FIUm4vWkJ2UCtGOEJQaUpo?=
 =?utf-8?B?T1V0ZEl1bTlLQUdvUVJoODY2Vmp3S2hsRHpJL1lWSlllNTNqV2pmVkd6OGZi?=
 =?utf-8?B?dy9XOXl6bTQ4R0NEY01VZWN0bUZldC8wQnI5RnNDeXNmcTgvWWNLSThxam1V?=
 =?utf-8?B?NmFvcFROMk9acEFoZnNYcFNjRzhmdHY3bkpWaE1hVEV4WmFpN0FCbklUWkhQ?=
 =?utf-8?B?WkRra2lwblh0cENGTFNaTS9ISnlFSFY4bXU3c1VlS0pPMmgwTHk4T1k0OUpX?=
 =?utf-8?B?eU9abjA0d0VRMlZKM3ZGN2NNRnh0ZC9FcDJUa05IS3hoTEY2Ujl0ajFiL2hW?=
 =?utf-8?B?QVJoUFlGS0Y0SHpQTFdPTm5JL1dCbEpDQnRwR2FOWnZUWnB6UjQzWmUyeS9Y?=
 =?utf-8?B?aC9vOUcxZGhtSjVMbkRNRnQ1YlBmdk1GeEFtZlFuVW5Rc1dvNWZnQlJYN05P?=
 =?utf-8?B?YTluQTY5MDV2QlZ2Zi85UG9VRmNIa2gzY3lnR3NNU3BsaVhCZ2FVTnNNcjJU?=
 =?utf-8?B?S0VKL3NpZWg3NFRXdnVpSCtpNmtSWktkS3VFNzFqQzRuTHRmYm1USmd1Qzcv?=
 =?utf-8?B?UEY4VjRUSmoxa0NFZE5yek5pV1RuWmhsblcra1VnSmlNTW1HcFZKVTBWakJL?=
 =?utf-8?B?eTRHZCtkNTN6dktBOXdteUtlTTRhazdEOXFCeERUWlpDemJaTE5hR0s0S05C?=
 =?utf-8?B?dENTTHQ4VmFqVTFFK1dqL29EVE5WcEVKWEhoQWYwZmkvdmRrZWxTbzZnOHky?=
 =?utf-8?B?RGVuRXVBM3VYdUpqbllIR0lhVXFrNnVTZEJDakMxTEZrcVQwSmhiN21NRXRG?=
 =?utf-8?B?U1ppeDdjRGIxZGpNSkRndEJXM3Q0NDVOZ1lLdnJmVWs2SXBjOWxGV2VPOU1M?=
 =?utf-8?B?eVBTRDdLQ2tIaGtlWDZncmdMaVIzL1k1UDQzb1Z2SkF1ZHJhSEtxZS9UQ1d4?=
 =?utf-8?B?ZlluSm5sWGtWWE1Xbk14WWRrb2ZmU3MyNXU2WHFyZEgzSDlCNjBHcDlaKy9q?=
 =?utf-8?B?QjVhQWptNW4xWFFHblRBNGJ4SjU0VDJuOU04Rk1YNUpUK1lsdmUzRXJCbHNa?=
 =?utf-8?B?OC9RcGtXblhsek1FWlhXS1BCYW5GUm1NYURla1A2eUZaNGE2V2tLeVVnVSt6?=
 =?utf-8?B?WmlnZnNnMU9uOUNqRTcwc0dBcU5vYk4wR09PVGdpZjFBeGV6OGtpWmpjdjQ1?=
 =?utf-8?B?WWxSc2ljck5CMDV3Ykova0NXMWNONE56aGZLRHFQYVhHK3V0VUoyRlpUTUsz?=
 =?utf-8?B?ZW1EdUxvV3ZjbDVkTmNYdldwVVJ4ZzFzMHlGQjhFSEYvanJVWkFZaE83Sy9y?=
 =?utf-8?B?VU1NUTY3RlEyT1Q4VXZ0b1NaSUl5Ym41b25pakpHaUR2ZW11M01YVjU4dVRF?=
 =?utf-8?B?ZFN6Y2lydG02bkp2ODBQZTFlTXgxeFNzTkxXZG1JS1lYTW8rLytOZWRPN2JU?=
 =?utf-8?B?aTlDTXlZQVI5VGpKaVFNWGYwTHRsTGd5SDB3OEo2SlpUU1pQQnQ4RWdQV3py?=
 =?utf-8?Q?yT8De4AxU7kqEa+Hjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d240RjZvSkVOb1p2ZEF3aituL1NtZmhwN0lzU2ZodWJvK0VsV0d5bFFLWDlW?=
 =?utf-8?B?S2hDVGRzQVVCNnZtTHp1RFFwdHJiWHFJc1ZqdVJNZFI1Z1NYYXJUdUt6aEVr?=
 =?utf-8?B?RWlockNJWDBJeVJCMk5kek9UdithSXNFR1hMUFJVMzFURG4vcDBGWFZZRWFI?=
 =?utf-8?B?b3BueWx6Wkw5YVAvb2hFSURLM1VwSUM1TFJuaU5aU2d4MGhqWVVFZWx6bTNR?=
 =?utf-8?B?OEEwTTBlejJHL0RBWXdlOGV1L3hkMHFVcGlYbGRSVVh0OXdkT2JvWXBCVVox?=
 =?utf-8?B?RVBPbkp0dDJhMUM3VWhaZmxFdGxXSGMybVMzS2huUUdCY0pncko2UkM5cGtO?=
 =?utf-8?B?cmo2SlQ5emQ1MmxqOWFNNER0VVdsajZrRExaWDlZeXFMRVloai9qK2kxbGVV?=
 =?utf-8?B?cVk0MnhhaWp4bUNlOHFiYTg1WXowYXNWYXQ2N0xmWVZnYTFNQnNiUUQ5U0NR?=
 =?utf-8?B?d3hyeE9rckNaQnh2dkdYR01IR3pUWE1pL3RXU1p3R0JjT2UyajRZbEN0U0pV?=
 =?utf-8?B?cW5RWWxoNHVwTGI0ODl0di9IVVgwUGkrNVhNM0YrWXVickxsU0FhM3poR0ZC?=
 =?utf-8?B?UVhkTlo0dXdGNWxlZ1ZtTCtxSWZyYklqUFBmVXN3YXJ3QjVFa3FRWTlnT3E4?=
 =?utf-8?B?cHI3ZUpKVFo3NHNTRGFNQi9mbDA3d0NWUUVKNmlycy9pTG12R3M2YmJ3MzNi?=
 =?utf-8?B?YmZNTDN1bG5OZFh1R3FpOWxOK2RHWFI2Z293MmZvUEdHSlNTdmJMb2NxL2d6?=
 =?utf-8?B?ajEzY25EcDhJamt3cVY3QUZ4enVYSm14cGtCb0gwTVlUNkhuZWlpdERSc0li?=
 =?utf-8?B?WHZReE4xYXo3NnNFeUJyOXlESWU4eHM5QlRDaGFRaklIVVN0eGE3d29DcXNP?=
 =?utf-8?B?YnJTY0RvUFlNSWJMUXJoSVBLaXVaTURFSUhkdVl0R2hwQnhQYWs2dkJOenYr?=
 =?utf-8?B?cE5SaUtiTTNpNGVxNlpIekx5MHhKV0RGUmVRc0xWZW1RNUpYbmFsZVBqSDl1?=
 =?utf-8?B?d1IwOW9FNmpKRm5XeXY2d3BPWDMyTE1CYlEvbTBwa3pobDJxRElDNDVlVkZm?=
 =?utf-8?B?dnJLZHg4bHlVWUdMbEhBRHJRUG1rbUtHcCtlUk81UUlxdE9aZmtDb09sSkpr?=
 =?utf-8?B?VE1JdzdDaU9VZXFPd1RzSTVQTXFJZ1p0TEpmUUFpZjFNUlhIbk84Z25UdUpi?=
 =?utf-8?B?UjRhUnJSay9rczQ3ZnZzTEhJUVYrTzlTMHh3b2ZwOEJvYWNWNnE5N3pzTnpB?=
 =?utf-8?B?KzFvZHpGWHo3WmZScUl3NlhGdGZ2VmdWT0FhMGpjZXdRaCtmQXlkYjhLQUw0?=
 =?utf-8?B?ZWlhdzlCcHlicFRhS01mcGhtWEc3M2NZWUw3aFNHZHR1cDRQNUR6NXM1UkpG?=
 =?utf-8?B?NGdyM0VPNWVPSlY1UDQ4cHZIbDg1aVgxbjRhdXhQT1dNeEdYTFgzU1hkdVVW?=
 =?utf-8?B?d3BOeUp5dkRocU10dXU0blBYZVc5QUhGM3R5dTB3SVhTNFo1Q0h0dGdTekR0?=
 =?utf-8?B?cUZMMVV1TjNPTjg1ZldTWFJpUFF5ODgvWlZNYjNtNkhoUE8rb212Mmp2bEYw?=
 =?utf-8?B?UjhhWlRSQm1KTU5QNmNUaXp1SjhNT3pHT0djUTJ3YkNhb2NncWVtUGpOdDI2?=
 =?utf-8?B?K2ljbTVyUEk2dDJ5NEtqZDV0bjRNdXRXSnVKTUtQbzgreVgwNXdrZnQ2MDVx?=
 =?utf-8?B?T3dFWUxDeTc1NTMxREkxandyR2pJUWRYaGJhYTRSZHk5dy9URmRxODlydUh4?=
 =?utf-8?B?MWp3MnVJZnY4WFhURmM0WDhaK0YrdEVKNkFFNTVhWld1SjZZVEt0VFFOUzd2?=
 =?utf-8?B?TTQrYkI1R244VWMyUnRLWWJHZFNwMi9oRGFXbjZScGJSbjVXdWREK3F6WnlC?=
 =?utf-8?B?bitjWEhVTUd3RXFqQnVFMXZZUGQwTmhIdkh1OWQ2S2lDczB5MDJlQ243elZB?=
 =?utf-8?B?ME1sOXVEVzVmUjNFQ1JqV1N5aE5DdjcyUXF6UUxkcnBvMjN3ZjYyVmdJMHdl?=
 =?utf-8?B?bFhScWFvRGpGOSt4Znk4b0Y5b0x6VGJNdytDMFZMVVB5SlF3QWNRcXBuaEVC?=
 =?utf-8?B?QWRhcXJrYisrbDJyZHpCRm1FK1JoQmhoN3J2MHhNdWdrTGdidlRYaDgrWWtG?=
 =?utf-8?Q?AYn9P3XbjGNcEIlmLZbz7zOEk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4d4a15-70be-4e50-0af2-08dcc89be96f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 02:31:54.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h19hqZqeVARFBri/YNE5wcJYCN+4Zo9b8tkyzShpmrg8eaLkAhfogev7kDvbhJSbZIlvjrVhuCHEKkMeAUOeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207



On 8/15/2024 5:34 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Thursday, August 15, 2024 1:53 PM
>>
>> On 8/13/2024 2:55 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Tuesday, August 13, 2024 11:44 AM
>>>>
>>> I removed the unreachable intel email id as every single email is bouncing
>> from it.
>>> Please consider dropping that email from v8 as it will cause all reviewers
>> email to bounce.
>>>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Tuesday, August 13, 2024 11:15 AM
>>>>>>
>>>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
>>>>>>> Hi Lingshan, David,
>>>>>>>
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
>>>>>>>>
>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>
>>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>>
>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>> ---
>>>>>>>>  content.tex | 75
>>>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>> ----
>>>>>>>> --
>>>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>>>>>>>
>>>>>>>> Changes from V6:
>>>>>>>> - the device should hold its config interrupt while SUSPEND,  and
>>>>>>>> send config interrupt when the SUSPEND bit is cleared.
>>>>>>>> - while SUSPEND, the driver MUST NOT access Device Configuration
>>>>>>>> Space
>>>>>>>> - minor changes.
>>>>>>>>
>>>>>>>> Changes from V5:
>>>>>>>> - the device should present NEEDS_RESET if failed to suspend
>>>>>>>> - allow the driver access device status in the config space when
>>>>>>>>   suspended if it is implemented in config space.
>>>>>>>> - language improvements
>>>>>>>>
>>>>>>>> Changes from V4:
>>>>>>>> - re-order the device status bits section
>>>>>>>> - kick vqs --> notify vqs
>>>>>>>>
>>>>>>>> Changes from V3:
>>>>>>>> - allow the driver clearing the SUSPEND bit to resume the device.
>>>>>>>> - disallow access to config space while suspended.
>>>>>>>>
>>>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
>>>>>>>> 100644
>>>>>>>> --- a/content.tex
>>>>>>>> +++ b/content.tex
>>>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>>>>>>>    \end{note}
>>>>>>>>
>>>>>>>> -\item[FAILED (128)] Indicates that something went wrong in the
>>>>>>>> guest,
>>>>>>>> -  and it has given up on the device. This could be an internal
>>>>>>>> -  error, or the driver didn't like the device for some reason,
>>>>>>>> or
>>>>>>>> -  even a fatal error during device operation.
>>>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>> +ready to
>>>>>>>> +  drive the device.
>>>>>>>>
>>>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
>>>>>>>> acknowledged all
>>>>>> the
>>>>>>>>    features it understands, and feature negotiation is complete.
>>>>>>>>
>>>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>> ready to
>>>>>>>> -  drive the device.
>>>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
>>>> indicates
>>>>>>>> +that the
>>>>>>>> +  device has been suspended by the driver.
>>>>>>>>
>>>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
>>>>>> experienced
>>>>>>>>    an error from which it can't recover.
>>>>>>>> +
>>>>>>>> +\item[FAILED (128)] Indicates that something went wrong in the
>>>>>>>> +guest,
>>>>>>>> +  and it has given up on the device. This could be an internal
>>>>>>>> +  error, or the driver didn't like the device for some reason,
>>>>>>>> +or
>>>>>>>> +  even a fatal error during device operation.
>>>>>>>>  \end{description}
>>>>>>>>
>>>>>>>>  The \field{device status} field starts out as 0, and is
>>>>>>>> reinitialized to 0 by @@ -
>>>>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev  initialization
>>>>>>>> sequence specified in \ref{sec:General Initialization And Device
>>>>>>>> Operation / Device
>>>>>> Initialization}.
>>>>>>>> -The driver MUST NOT clear a
>>>>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>>>>>> +The driver MUST NOT clear a \field{device status} bit other than
>>>>>>>> +SUSPEND except when setting \field{device status} to 0 as a
>>>>>>>> +transport-specific way to initiate a reset. If the driver sets
>>>>>>>> +the FAILED bit,
>>>>>>>>  the driver MUST later reset the device before attempting to re-
>>>> initialize.
>>>>>>>>  The driver SHOULD NOT rely on completion of operations of a @@
>>>>>>>> -99,10
>>>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>>>>>>>> +Virtio Device
>>>>>>>> / Feature B  \begin{description}
>>>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
>>>>>>>> device type
>>>>>>>>
>>>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
>>>>>>>> queue and
>>>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
>>>>>>>> +queue and
>>>>>>>>    feature negotiation mechanisms
>>>>>>>>
>>>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
>>>>>>>> future extensions.
>>>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
>>>>>>>> +future
>>>>>>>> extensions.
>>>>>>>>  \end{description}
>>>>>>>>
>>>>>>>>  \begin{note}
>>>>>>>> @@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General
>>>>>>>> Initialization And Device Operation /
>>>>>>>>
>>>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
>>>>>>>> reset) before removing exposed buffers.
>>>>>>>>
>>>>>>>> +\section{Device Suspend}\label{sec:General Initialization And
>>>>>>>> +Device Operation / Device Suspend}
>>>>>>>> +
>>>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>>>>>> +SUSPEND bit in \field{device status} to suspend a device, and
>>>>>>>> +can clear the SUSPEND bit to resume a suspended device.
>>>>>>>> +
>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>> +
>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>> +
>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>>>>> +\begin{itemize}
>>>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>>>> +whether the
>>>>>>>> SUSPEND bit is set.
>>>>>>>> +\item The driver MUST NOT make any more buffers available to the
>>>>>> device.
>>>>>>>> +\item The driver MUST NOT access any virtqueues or send
>>>>>>>> +notifications for
>>>>>>>> any virtqueues.
>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>> +\end{itemize}
>>>>>>>> +
>>>>>> Hi Parva
>>>>>>> Do we agree that
>>>>>>> a. suspending a device is non frequent operation (in order of N
>>>>>> operations/sec, where N is roughly in range of 10 or 100) per device?
>>>>>> Ideally it should not be often in normal operations, but remember
>>>>>> we can not restrict the behaviors of the driver, so we must be able
>>>>>> to handle the scenario in which SUSPENDING is often.
>>>>> Sure. the intent is slow rate, but one can do at unexpected times.
>>>>> Do you agree?
>>>> I think we don't have an intention of the frequency in the spec.
>>> Sure.
>>>
>>>> The spec only provides generic mechanisms and interfaces.
>>> Sure.
>>>
>>>> Don't assume it(or driver wants it to be) would be often or not, that
>>>> depends on the driver.
>>> As you rightly said : it cannot be assumed.
>>> The driver will read the device status right after it wrote it. This typically is <
>> 50nsec of time.
>>> The suspend operation for a net device to store hundreds of queues, RSS
>> table, flow filters, takes plenty of time (at least more than 50nsec :) ).
>>> Similarly for the GPU to store some MBs of memory takes more than 50nsec
>> of time, for example to store in a file for a software-based GPU device.
>>> So a device cannot respond back suspend=true in next 50nsec time.
>> It's OK for the device to take longer time to respond, the driver simply re-reads
>> device status.
> Sure, the issue is, when the driver re-reads, the device must present suspend=false within 50nsec.
> (because device didn't suspend it yet).
>
> As I explained in previous email, this requires building special circuitry.
> Such circuitry can be avoided if the suspend interface is done slightly differently.
why there is a constraint condition of the time? Are there any similar constraining for other
states like RESET or DRIVER_OK? Don't assume any other states transitions are faster than
SUSPEND.
>
>>> More below.
>>>
>>>>>>> b. A software-based device may not always want to force VM_EXIT on
>>>>>>> read
>>>>>> and write on the device_status register?
>>>>>> Trap and Emulation is the basic of virtualization, and how to
>>>>>> pass-through a device is out of this spec.
>>>>>>
>>>>> Sure, I didn't suggest to put such things in the spec.
>>>>> My question is, whether to trap and emulate or not is a choice of
>>>>> the
>>>> software.
>>>>> Do you agree?
>>>> The device emulator does not know anything about whether trapped or
>> not.
>>>> Trapping and Emulation is a hypervisor thing.
>>>>
>>>> If here "software" refers to the device emulator, then Yes, it is not
>>>> the emulator's decision. And the device should not be aware of
>>>> VM_EXIT & VM_ENTRY.
>>>>
>>> Right. So a software wants to implement device_status as pure MMIO
>> writes. (and not VM_EXIT).
>> This is not always true, there can be VM_EXIT of pure emulated devices.  
> I am not denying that VM_EXIT can/cannot be there.
> I am saying, the proposal forces VM_EXIT based approach in my understanding of this patch.
> If that is not true, may be can you please explain how this can be implemented without VM_EXIT?
>
> We should have an interface that can be done with and without VM_EXIT method at least for any new additions.
VM_EXIT is out of spec, it is a hypervisor and the processor thing.
In non-pass-through case, any register access are sensitive and will trigger VM_EXIT. Like RESET or DRIVER_OK needs
to access device_status, nothing different.
>
>> The
>> HW registers are sensitive resource and any access to them need to be trapped
>> and emulated.
> This does not apply to PCI PFs and VFs which are HW devices (mainly PFs).
> so this trap + emulation is narrow view that we better avoid.
This is how *basic* virtualization work, once access sensitive resource, trap it.
>
> If you think this is the way forward, you should put forward in patch as MUST requirement.
> and that does not look right to me.
> I hope you also don't mean to force this method to device implementations.
> Right?
Again, VM_EXIT is a hypervisor thing,  out of spec. Whether there is a VM_EXIT when setting SUSPEND totally
depends on the virtualization solution. And SUSPEND is nothing different from DRIVER_OK.

Means, if your virtualization needs to trap SUSPEND, it also needs to trap DRIVER_OK, and don't assume
DRIVER_OK is faster than SUSPEND.
>
>>> And prefer to returning SUSPEND=true at slow pace.
>>> This means, the device implementation cannot immediately return
>> suspend=true right after it was written.
>>> A MMIO read will read it back, as suspend=true.
>>>
>>> An alternative would be, to forward CPU loads and CPU stores to different
>> address.
>>> However, this does not work for the hw based devices.
>>>
>>> That means, PCI HW needs to return suspend=0, until the device is not
>> suspended.
>>> In this example, the device cannot build special circuitry to answer
>> suspend=true within 50nsec, or in other words building special circuitry to
>> return suspend=false is too complex for the slow operation.
>> why? The device can just not to change the value of the SUSPEND bit before it
>> has fully suspended.
> When driver wrote, it wrote suspend=true,
> And device returns suspend=false while suspend is ongoing, right?
> If yes, this is expensive because the device needs to operate within 50nsec or less to answer suspend=false.
>
> And even worst, it needs to suspend=true when unsuspending within 50nsec when resuming is ongoing.
again, there is not a 50nsec constraining and please take a reference of how DRIVER_OK work with virtualization. 
>
>>> If this understanding of burden is clear,
>>>
>>> The proposal is, can you please extend the interface such that,
>>>
>>> 1. driver writes suspend command.
>>> 2. driver reads suspend_status, and receives not_completed=(false). This is
>> the default value.
>>> 3. When the device completes suspend, it changes the polarity of
>> suspend_status=true.
>>> This has two main benefits:
>>> [A] This will enable software-based devices to write data to slow files and
>> does not have to force VM_EXITs.
>>> [B] It also enables hw based devices to not build special circuitry to answer
>> within 50nsec, which can get very complicated for tens or hundreds of PCI
>> PFs.
>> I think we have already discussed on this before in V5, and Jason has some
>> insightful comments
>>
> Unfortunately, not. His comment was that it is not specific to suspend.
> But here we are introducing a new interface and functionality that does not need to suffer or follow anything that may not be efficient.
>
>> https://lore.kernel.org/virtio-comment/20240612082055-mutt-send-email-mst@kernel.org/T/#mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9
>>>> this is out of the spec anyway.
>>>>
>>>> Thanks
>>>> Zhu Lingshan
>>>>>> Thanks
>>>>>> Zhu Lingshan
>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>> +
>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>> +
>>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>>> +while suspended, except for \field{device status} if it is part
>>>>>>>> +of the Configuration
>>>>>>>> Space.
>>>>>>>> +
>>>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
>>>>>>>> +access any virtqueues, or modify any fields in its Configuration
>>>>>>>> +Space while suspended.
>>>>>>>> +
>>>>>>>> +If changes occur in the Configuration Space while the SUSPEND
>>>>>>>> +bit is set, the device MUST NOT send any configuration change
>>>> notifications.
>>>>>>>> +Instead, the device MUST send the notification after the SUSPEND
>>>>>>>> +bit has
>>>>>>>> been cleared.
>>>>>>>> +
>>>>>>>> +When the driver sets SUSPEND, the device MUST either suspend
>>>>>>>> +itself or set
>>>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
>>>>>>>> +
>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>> +clears SUSPEND, the device MUST either resume normal operation
>>>>>>>> +or set
>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>> +
>>>>>>>> +When the driver sets SUSPEND,
>>>>>>>> +the device SHOULD perform the following actions before
>>>>>>>> +presenting that
>>>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
>>>>>>>> +
>>>>>>>> +\begin{itemize}
>>>>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>>>>>> +until all buffers that are being processed have been used.
>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>> +\end{itemize}
>>>>>>>> +
>>>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>>>>>>> Options}
>>>>>>>>
>>>>>>>>  Virtio can use various different buses, thus the standard is
>>>>>>>> split @@ -872,6
>>>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>>>>>>>> +Feature
>>>>>>>> Bits}
>>>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
>>>>>>>> Feature Bits} for
>>>>>>>>  	handling features reserved for future use.
>>>>>>>>
>>>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the
>>>>>>>> + driver
>>>> can
>>>>>>>> +   trigger suspending the device via the SUSPEND flag
>>>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>>>>>> +
>>>>>>>>  \end{description}
>>>>>>>>
>>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
>>>>>>>> Feature Bits}
>>>>>>>> --
>>>>>>>> 2.45.2
>>>>>>>>

