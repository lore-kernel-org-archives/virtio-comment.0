Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EF217625E
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723710221; cv=fail; b=eDWrHFRWOjkLb7kLcLlGzjOaKJZFf7kXBY8ITQ+KOhWoYAB6wVGiWPjN+SVLY+8D4Yulfgb4O/ciYuuBp6Agvz/HT1bW9V+ZTyHDO4h0dut8PX8YNAZJg9MfnKmxtXD2fe3w8NVA7DUSmq1UQVN3w7V2bibOt3NUQxXbd7kPPvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723710221; c=relaxed/simple;
	bh=zDfoG96HPFT6JaywBsq+dudbCUd+Ybi01aJ7SxwORUU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DuAa/Mm8gubZMu6KXXtJcjJEwu5VFiP6EEPq0tCfPoZztCmffN8jdLbagO2gz3Rl1AJ61KWqgjgv4mCNHGIjZvzASYOnmUCcE5Fhk46SFuSaOwLDIwMTpGf6Qo7lwDG7s8++oaqLGY50tUYuWAu4qK0TPNlBv6eTYfOw9ylEKqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WPQT2YHj; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WPQT2YHj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1fOY4dU1e+cFt6i7MNpbMmJTDwAOVFbIml8DRcrfBFAY3NiPwGrQ7pGzGJ0FYri9sdTi1a9uX2bO4sFWNL9bdBhzE7CLK3Ypcs0sOeymPOID7wOzTT2AWyxKd87QisDxPT/2szrlRyqB59QPAwVAsyPqTfevsK/ITMkmyTq5fOjB6iWWK3kLl33dF4cSBZF3ZsXFmYaM8WmQiZYm06ZtVz07r6LHJ9hJ1ryf0uRDGc6hAnvjkkXkzA447r1op3KvPnBYS2jK9Zz+gZFRC8Xl58+GsJF9WnUWiPOC5MuinuqFjFFj7MjFKeDgOJF7PpxtOlyvNUl5VD3R8MiuMBS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+302JP+JA4G/ML1JiMx8EHNo5R4Gctxa8gee58cC/so=;
 b=lmk6oRBIVJQDBK77Uu0YFyUtkIjbdI0qU6/s73CD4Xpt9V00Dg5TP+2V3mES6YxDK7ERNRYBSSK5OYx+FYJxtbLWtgJ52NZpoeiRHSjM0ChzZiIdm7UeaD4jAPjnQPyG68Ty2fzyxsM01mk0dt1lwBbAZDN+acqLuBQ2PTimM0rvyu44QeL75PNefqMDTn/1kz2kFIYgae6StueRZTvPk6pWbi+C77gtzGIexv0z7INYYiNykwjwtWa/RxkMbgUpJ0OCLbZd49JIYC8okYHRVdrMu6wfMlUn+5RuIpF/HDjxEi4vPIQF83G/e4LHrPgVx7Ti0NlKxKjN7flNUOWYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+302JP+JA4G/ML1JiMx8EHNo5R4Gctxa8gee58cC/so=;
 b=WPQT2YHjtOP4qim9bJM3yjKVI7/WBZxKdXBUtdceTHQyk9e/bejkRaQau2bGfP0HQjtMNP+rq8w+MLm5BgZcAREJmlVC0SxhzjpUOjlfqSwPoWqFX++EH7WEZo11vkzPqGKyZSctUj4+KCXynqofViEsl8xfllb8L918YeRx0wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 08:23:36 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 08:23:36 +0000
Message-ID: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
Date: Thu, 15 Aug 2024 16:23:26 +0800
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
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: d16bb4be-b258-429e-39d7-08dcbd038ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk40MzViMktka1pqT2pmZ1F0ZmpuYWxqRjV1NXJtcy9HSy93S0dERUt4S0FH?=
 =?utf-8?B?SkdLLzN0OCtFMGVFYjFVOWlpendkRHFETjZVek00R2h5cVltdkV2M1dJNkZq?=
 =?utf-8?B?RWg3SnV6a01XbDQ2R29qUGlyL1JaV1E5WTcvK2RqVDBaMEVLcUZORVQ3TUZp?=
 =?utf-8?B?bW10a3pPU0FqcXZKL2tIMEdhWXkvSk5RVWZ5NVkrYjZPS045Vm1VTVNwNUU3?=
 =?utf-8?B?em1BY3RMSWNHdlAwM242MlNvWTBuS1RRWGhEcEFYYUNvWXpVem5pbHozOFZR?=
 =?utf-8?B?c3RZeHRIZkcxZlcrbGdhc2tsbmV6LzQwLzNWU3JIMjF6NXhENE9LMkdFMmxI?=
 =?utf-8?B?ZHJWMmdxWmRzdGJSTzRvYjNPaVZCWlJ0VVB6Tlk3ODZjeGdHTGRQNlJDeUdt?=
 =?utf-8?B?c3ZaSVoyTkQ5ZFpLdmNIaXB1OXdpVWNrYlc3UjI2di9wemg2Y1NXZWIxMkhp?=
 =?utf-8?B?V1dLblBpaHBQMjIrMXJROFdUOE9yV1ZEeWdtNVF1Q2pxdVZWTGRIVXByUDlC?=
 =?utf-8?B?OXpjeGlCcVUxSUNmR0QyOWxZYlVkMTJucFVsUS84TUFXS0dFdDVhU1VBbjZs?=
 =?utf-8?B?Q2ltRk80S2YrazBYeFRma2pyWWI0Q0ovc1VucEZqR1JFZWEvM3RqWG9IWkd4?=
 =?utf-8?B?YUR6M0NUQ2JvU1lHTWZLLy91SDFacjVrejJncVNzbnJFaHBjMTlXV1NkR0t4?=
 =?utf-8?B?UDVkUEpRYU93RW1EalpZUlduSDRJTnRtNDl0SlB4MEZZNHZkTXVaREZ4dGpz?=
 =?utf-8?B?UEFLdTZUR3F2RUxUK2JHQU1oUEVPR2ZaSGtDNmlqOW9rb2tvQUF5aXJKbUZL?=
 =?utf-8?B?L0dLTHlhWHBadXdUZjRvc2J4NFFUeFNzb1ZSc3FTY1Y2WDdFWW8yTFdSTUxY?=
 =?utf-8?B?dTFZbWFsbDl3RVdwSnRNWG1KUk1aU1N2SnpiSlZzMjJOYjk3czlTTUN2bHJ0?=
 =?utf-8?B?ODlPU3pTb2JpMDYxQ0hRVWFtY3IwSWF6Q25OOEZJOFdMRS9ycDFGT1hTYkM5?=
 =?utf-8?B?cG9UQjVXQXRVL3FTWE5iQmw0QU00dk1pQzJXYkpQbXRINlhVNGE5bkZxVzVH?=
 =?utf-8?B?V3B6U2Y1Vk5yOEJ2dk02ZnRhZld6ZTZ1VXNlandVZjJFSVRHd1BielgvYjVN?=
 =?utf-8?B?bktzQnhWaXhrRHkrRDBuK09JUTNaeFpkNE94VTFuRVFtTTVlQVJqZG9uY1Zw?=
 =?utf-8?B?b1hHZjJYQ3FSSCs1ZkFWMk50Wmg1QXZUZzVsbjhJaXd4ODlNK2FKUEY2MEtr?=
 =?utf-8?B?VlVNWDkvM3lJWTJRT0x0VDE2RU42b3hQNTYweU9jTnJWaGd3QmxBRjd2TCs5?=
 =?utf-8?B?RVVMbVUxOUNvbmdoTmhvaWc2eGZDYjM4YXNNQ3dEQ0lwQnpzblFyT2VBUTFn?=
 =?utf-8?B?NTNGV2Jjd29qVEpWaXl0YkpINi8vK2JOckp2M2FFakZkRWNmWDhmNGIxVG1P?=
 =?utf-8?B?MlFKY3RVWExSMkFDOFVtZi9yWG5nUVcxOG91YzhYN2RhM01aNytXblkxQ2hT?=
 =?utf-8?B?S2VScmo1KzJBekFoWno5VXJCeDFPZG8xb1RxRG5sQ0dxZ1hCS2ZvRllmQTBS?=
 =?utf-8?B?SHdDYjFBQW9jK2IzenVhd29NSjlMSnhJS2c4RVhRaTFGRWo3cmFUZmlNL2Vy?=
 =?utf-8?B?RzJIM2dTMXIwcDVaT29IMFBnL2FQVWhLd2QyOTYvcUpjNnpLQ2M0V3hXZEw1?=
 =?utf-8?B?VDJXbDYvcFdhV2MzNlcwNXc5NU9PNlpTUThJSE1FeTVxeXFIcWhqdGU5MEM3?=
 =?utf-8?B?TGhiQzZQd2g5NCs0WUlMNk0rKzhhVzExTG40N3craGF2bjBYOXNQME5ldGVq?=
 =?utf-8?Q?AJg7fQS+IzWybZumwnxRW06zy+FhpvgeTh+yY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REdOY0xINGFsbFVKbTdYYXhQTmFJZ1c5THd3dStTdTJnOFM2Q25kb0djeHho?=
 =?utf-8?B?aHpmc3ZwL1BwZ1VPWUpnT1Jxd0hEN1pHcDQ5Qm1DWmM5bU9ZMXYyWU1wVkJM?=
 =?utf-8?B?K0I3RmdyNCsycUdBanBIcTVVcEpXQldoWis0VGJQQ243UnFKdHJKdW9mY3Rw?=
 =?utf-8?B?eUNtekpjRGVjZElXYTZqbWsvSndiZ3paMzNrSk82WlVNVi92UkU2M0N5Zml4?=
 =?utf-8?B?Y09hTVZkaDhGVUZPc09yRnp6alhseWVKUEdmdTJUN202T0E2NGlYZVgvejQ3?=
 =?utf-8?B?Ry9JQ0NPQ2JBRG04VGYxd2t4aUt4aWErcUFYRDg1Uzc0TnJxaFJ5bG1QNlJw?=
 =?utf-8?B?cml2Y2UyQmJRdXFBWDBrV3JNdGdTblc0KzRDOFd1TzVJRjA2NmpTbjF4QUJS?=
 =?utf-8?B?RERoTDlRcndKMzY4R2ZVZVZPNnRsTVpTeTVKV0tyelc3WUVTVzd6YnJocytF?=
 =?utf-8?B?MHpIVURXZXorODRhUTZkeERTajEyK2pFT0xsM3JiSUIrZGF3SHFDYXFhTnRL?=
 =?utf-8?B?cmJjT3ErM0VMWlBrUXREK2l6T09VWXUrMXRIWGg0M01YWUZQRVdGOW1XemJQ?=
 =?utf-8?B?dTBvUFp1bjZLdTJpbFRQbEs2M3U2a05VN1hvcVdtMndSM2QzOGJsOHNlNGlS?=
 =?utf-8?B?MUVhRTZlS0lHZ2QrMndxMnEvVk12SFVZT2UxWGo4TVBYcVRyZ0Z0aHB2dVZr?=
 =?utf-8?B?UHh2WXJuaGdvclZVWENuUnlXVjRyRGxwU3p3dHduQzcxUmY3QUZTZlRXMzV2?=
 =?utf-8?B?SCt6WlZCWm53MmJBK05uMkJ2TEVuQmJHck81OGE5TGQxS3ZKVmxDMkRPTGlW?=
 =?utf-8?B?aWFTVjZoQWI3eEpiQXVjS3FsdGp6TGJ6RG96YnlaK1FtT0o5aFlWakZKR2JI?=
 =?utf-8?B?M3hLTUpScXV5RFBQWnZQUnNaaVJqd0hYSm9MZDhrTjRxNUtEbk0xeEJ2SFA5?=
 =?utf-8?B?NlRWbzk1Y0JUZm9GbDBoU2U1Rlk4OXNmTGpVeDhDNGMyQzFSb0RUUGpiY1FB?=
 =?utf-8?B?Vm9uMUpPZUdPdERPaldEQnJlSTBaVFJHaFYzcDk2K0t0aUFuSDVHTzZrYVBj?=
 =?utf-8?B?SlIyQUxGK0duWGVCZzhGR1ltSUhKTEQzdDZySHFVWHdhMHZBclpSVHE0U2l0?=
 =?utf-8?B?Q2N0T2UvK01iWW5XcWdmTDRKWFJSUkgyNWNmc2VOa21nTnhQZTVvNGhSWGlO?=
 =?utf-8?B?SDVYTHNGZWU3SVVUOENweU5sdXNIRnF0M3R4V3dmSTVXUzhncVA4ZmlaOFJZ?=
 =?utf-8?B?ZUVwSExNNGhMalErSlVzSjgvbFo5YzdqNS9YZkphRzd6QUpma1drOUlVbjZT?=
 =?utf-8?B?QWQwWHZmeVM3NDdZN0NCMUg3WkpaL1ZoaTFHZzF3bmpwRXBWNXRUVGx1Rk5C?=
 =?utf-8?B?WWxHUWNnQXB2b3krbkc1d0dPMUlrNjJ3emJ4WHVLK1k5QzZEK0w1WndlRVpy?=
 =?utf-8?B?NjFMK1YrNmlsSUYvMG5HVVlFYVh6N2hHQk1SM2JUU3cydHBuQ0RMK25vWnU2?=
 =?utf-8?B?elFLY3loamdQbVdpbVdXek41d2VBN2VXYWNscmxJRk5TWE1DeWNENThZaUIr?=
 =?utf-8?B?WEs2ZUZlV2xhcGhJbDZZY3QxQUJtQzVwdUtpdi9TQ1J3aVZ3cmYyTlkxbWlF?=
 =?utf-8?B?enFpejdoM3BCdk01ZHJrNW1zYm5hdmw5T3NZc1REQ2FlOEZ1V3ZWbFdMTmx4?=
 =?utf-8?B?MU1JamcxelRkTmNleGM3Tm1RdUFNUTZvdFRYdnArNUNxZXVRdUNLT3NPdHRx?=
 =?utf-8?B?ODFLKzAwbExhb2hTZ0gvNCtTQUZLdGIxT1dFZ0tvY3V4a3ZuNytKL3JjMXdG?=
 =?utf-8?B?K0swcUNwcEJHYXV4NjFzZjFJV3hwTXYvZ1pXR3Y1NkUzNE5TWm5VSFBCZVVU?=
 =?utf-8?B?QTZwUkFRTk9QZlRJYmxFNUVNaEJlUnU4aFZta2tVMjRDd1cyb0NaRnlDelRN?=
 =?utf-8?B?VTJ4OXJqKy9QSjkvM3BzYWIycHIyaTlTNnNLV1JpaURaU21sdHZmRnlqU2xQ?=
 =?utf-8?B?eFU1OFpqMWdMcm9XSit6Sjc4eUkva1l6cjhoODBEN2RILzdOMHVJRHRlRXUy?=
 =?utf-8?B?Tk5DSWhIM2tVT0JtOUpMMkUreXpmQnZtVmgxcU03eUl4TzB6U3hHY01UOTJT?=
 =?utf-8?Q?AvI4r6DK6Pqim/3i3fgBDZUA3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16bb4be-b258-429e-39d7-08dcbd038ede
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 08:23:36.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUM2g8mzOnXGH8worMpzJ4rArpuyJ9HJtkp2qXu9j0E8bnLikH51RKFMZZGnEkaMISSf/nCZstPZ118UaMKygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

On 8/13/2024 2:55 PM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, August 13, 2024 11:44 AM
>>
> I removed the unreachable intel email id as every single email is bouncing from it.
> Please consider dropping that email from v8 as it will cause all reviewers email to bounce.
>
>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Tuesday, August 13, 2024 11:15 AM
>>>>
>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
>>>>> Hi Lingshan, David,
>>>>>
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
>>>>>>
>>>>>> This commit allows the driver to suspend the device by introducing
>>>>>> a new status bit SUSPEND in device_status.
>>>>>>
>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
>>>>>> indicating whether the device support SUSPEND.
>>>>>>
>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>> ---
>>>>>>  content.tex | 75
>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>>> ----
>>>>>> --
>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> Changes from V6:
>>>>>> - the device should hold its config interrupt while SUSPEND,  and
>>>>>> send config interrupt when the SUSPEND bit is cleared.
>>>>>> - while SUSPEND, the driver MUST NOT access Device Configuration
>>>>>> Space
>>>>>> - minor changes.
>>>>>>
>>>>>> Changes from V5:
>>>>>> - the device should present NEEDS_RESET if failed to suspend
>>>>>> - allow the driver access device status in the config space when
>>>>>>   suspended if it is implemented in config space.
>>>>>> - language improvements
>>>>>>
>>>>>> Changes from V4:
>>>>>> - re-order the device status bits section
>>>>>> - kick vqs --> notify vqs
>>>>>>
>>>>>> Changes from V3:
>>>>>> - allow the driver clearing the SUSPEND bit to resume the device.
>>>>>> - disallow access to config space while suspended.
>>>>>>
>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
>>>>>> 100644
>>>>>> --- a/content.tex
>>>>>> +++ b/content.tex
>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>>>>>    \end{note}
>>>>>>
>>>>>> -\item[FAILED (128)] Indicates that something went wrong in the
>>>>>> guest,
>>>>>> -  and it has given up on the device. This could be an internal
>>>>>> -  error, or the driver didn't like the device for some reason, or
>>>>>> -  even a fatal error during device operation.
>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
>>>>>> +to
>>>>>> +  drive the device.
>>>>>>
>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged
>>>>>> all
>>>> the
>>>>>>    features it understands, and feature negotiation is complete.
>>>>>>
>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
>>>>>> to
>>>>>> -  drive the device.
>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
>> indicates
>>>>>> +that the
>>>>>> +  device has been suspended by the driver.
>>>>>>
>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
>>>> experienced
>>>>>>    an error from which it can't recover.
>>>>>> +
>>>>>> +\item[FAILED (128)] Indicates that something went wrong in the
>>>>>> +guest,
>>>>>> +  and it has given up on the device. This could be an internal
>>>>>> +  error, or the driver didn't like the device for some reason, or
>>>>>> +  even a fatal error during device operation.
>>>>>>  \end{description}
>>>>>>
>>>>>>  The \field{device status} field starts out as 0, and is
>>>>>> reinitialized to 0 by @@ -
>>>>>> 60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
>>>>>> Facilities of a Virtio Dev  initialization sequence specified in
>>>>>> \ref{sec:General Initialization And Device Operation / Device
>>>> Initialization}.
>>>>>> -The driver MUST NOT clear a
>>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>>>> +The driver MUST NOT clear a \field{device status} bit other than
>>>>>> +SUSPEND except when setting \field{device status} to 0 as a
>>>>>> +transport-specific way to initiate a reset. If the driver sets the
>>>>>> +FAILED bit,
>>>>>>  the driver MUST later reset the device before attempting to re-
>> initialize.
>>>>>>  The driver SHOULD NOT rely on completion of operations of a @@
>>>>>> -99,10
>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>>>>>> +Virtio Device
>>>>>> / Feature B  \begin{description}
>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device
>>>>>> type
>>>>>>
>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the queue
>>>>>> and
>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the queue
>>>>>> +and
>>>>>>    feature negotiation mechanisms
>>>>>>
>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
>>>>>> future extensions.
>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
>>>>>> +future
>>>>>> extensions.
>>>>>>  \end{description}
>>>>>>
>>>>>>  \begin{note}
>>>>>> @@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General
>>>>>> Initialization And Device Operation /
>>>>>>
>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset)
>>>>>> before removing exposed buffers.
>>>>>>
>>>>>> +\section{Device Suspend}\label{sec:General Initialization And
>>>>>> +Device Operation / Device Suspend}
>>>>>> +
>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>>>> +SUSPEND bit in \field{device status} to suspend a device, and can
>>>>>> +clear the SUSPEND bit to resume a suspended device.
>>>>>> +
>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>> +
>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>> +
>>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>>> +\begin{itemize}
>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>> +whether the
>>>>>> SUSPEND bit is set.
>>>>>> +\item The driver MUST NOT make any more buffers available to the
>>>> device.
>>>>>> +\item The driver MUST NOT access any virtqueues or send
>>>>>> +notifications for
>>>>>> any virtqueues.
>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>> +\end{itemize}
>>>>>> +
>>>> Hi Parva
>>>>> Do we agree that
>>>>> a. suspending a device is non frequent operation (in order of N
>>>> operations/sec, where N is roughly in range of 10 or 100) per device?
>>>> Ideally it should not be often in normal operations, but remember we
>>>> can not restrict the behaviors of the driver, so we must be able to
>>>> handle the scenario in which SUSPENDING is often.
>>> Sure. the intent is slow rate, but one can do at unexpected times.
>>> Do you agree?
>> I think we don't have an intention of the frequency in the spec.
> Sure.
>
>> The spec only provides generic mechanisms and interfaces.
> Sure.
>
>> Don't assume it(or driver wants it to be) would be often or not, that depends
>> on the driver.
> As you rightly said : it cannot be assumed.
> The driver will read the device status right after it wrote it. This typically is < 50nsec of time.
> The suspend operation for a net device to store hundreds of queues, RSS table, flow filters, takes plenty of time (at least more than 50nsec :) ).
> Similarly for the GPU to store some MBs of memory takes more than 50nsec of time, for example to store in a file for a software-based GPU device.
> So a device cannot respond back suspend=true in next 50nsec time.
It's OK for the device to take longer time to respond, the driver simply re-reads device status.
>
> More below.
>
>>>>> b. A software-based device may not always want to force VM_EXIT on
>>>>> read
>>>> and write on the device_status register?
>>>> Trap and Emulation is the basic of virtualization, and how to
>>>> pass-through a device is out of this spec.
>>>>
>>> Sure, I didn’t suggest to put such things in the spec.
>>> My question is, whether to trap and emulate or not is a choice of the
>> software.
>>> Do you agree?
>> The device emulator does not know anything about whether trapped or not.
>> Trapping and Emulation is a hypervisor thing.
>>
>> If here "software" refers to the device emulator, then Yes, it is not the
>> emulator's decision. And the device should not be aware of VM_EXIT &
>> VM_ENTRY.
>>
> Right. So a software wants to implement device_status as pure MMIO writes. (and not VM_EXIT).
This is not always true, there can be VM_EXIT of pure emulated devices.  The HW registers are sensitive resource
and any access to them need to be trapped and emulated.
> And prefer to returning SUSPEND=true at slow pace.
> This means, the device implementation cannot immediately return suspend=true right after it was written.
> A MMIO read will read it back, as suspend=true.
>
> An alternative would be, to forward CPU loads and CPU stores to different address.
> However, this does not work for the hw based devices.
>
> That means, PCI HW needs to return suspend=0, until the device is not suspended.
> In this example, the device cannot build special circuitry to answer suspend=true within 50nsec, or in other words building special circuitry to return suspend=false is too complex for the slow operation.
why? The device can just not to change the value of the SUSPEND bit before it has fully suspended.
>
> If this understanding of burden is clear,
>
> The proposal is, can you please extend the interface such that,
>
> 1. driver writes suspend command.
> 2. driver reads suspend_status, and receives not_completed=(false). This is the default value.
> 3. When the device completes suspend, it changes the polarity of suspend_status=true.
>
> This has two main benefits:
> [A] This will enable software-based devices to write data to slow files and does not have to force VM_EXITs.
>
> [B] It also enables hw based devices to not build special circuitry to answer within 50nsec, which can get very complicated for tens or hundreds of PCI PFs.
I think we have already discussed on this before in V5, and Jason has some insightful comments

https://lore.kernel.org/virtio-comment/20240612082055-mutt-send-email-mst@kernel.org/T/#mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9
>
>> this is out of the spec anyway.
>>
>> Thanks
>> Zhu Lingshan
>>>
>>>> Thanks
>>>> Zhu Lingshan
>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>> +
>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>> +
>>>>>> +The device MUST ignore all access to its Configuration Space while
>>>>>> +suspended, except for \field{device status} if it is part of the
>>>>>> +Configuration
>>>>>> Space.
>>>>>> +
>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
>>>>>> +access any virtqueues, or modify any fields in its Configuration
>>>>>> +Space while suspended.
>>>>>> +
>>>>>> +If changes occur in the Configuration Space while the SUSPEND bit
>>>>>> +is set, the device MUST NOT send any configuration change
>> notifications.
>>>>>> +Instead, the device MUST send the notification after the SUSPEND
>>>>>> +bit has
>>>>>> been cleared.
>>>>>> +
>>>>>> +When the driver sets SUSPEND, the device MUST either suspend
>>>>>> +itself or set
>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
>>>>>> +
>>>>>> +If SUSPEND is set in \field{device status}, when the driver clears
>>>>>> +SUSPEND, the device MUST either resume normal operation or set
>>>>>> DEVICE_NEEDS_RESET.
>>>>>> +
>>>>>> +When the driver sets SUSPEND,
>>>>>> +the device SHOULD perform the following actions before presenting
>>>>>> +that
>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
>>>>>> +
>>>>>> +\begin{itemize}
>>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>>>> +until all buffers that are being processed have been used.
>>>>>> +\item Send used buffer notifications to the driver.
>>>>>> +\end{itemize}
>>>>>> +
>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>>>>> Options}
>>>>>>
>>>>>>  Virtio can use various different buses, thus the standard is split
>>>>>> @@ -872,6
>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>>>>>> +Feature
>>>>>> Bits}
>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
>>>>>> Feature Bits} for
>>>>>>  	handling features reserved for future use.
>>>>>>
>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver
>> can
>>>>>> +   trigger suspending the device via the SUSPEND flag
>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>>>> +
>>>>>>  \end{description}
>>>>>>
>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>>>>>> Bits}
>>>>>> --
>>>>>> 2.45.2
>>>>>>

