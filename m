Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7036A2E62B
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521473; cv=fail; b=ZxRBQUq9sPGvo3//32GIQiY6yUGnRUXjqPj8ZSuUuu8AbWm/vuNjQPjmoygosXtBbmH0cCj1WXrzsasmtt16bzDGj4BEOM5w1G6/4s6n+cCxR/wvlf6NtdoegfExUtcMoXG9zI/u5m2HUewUKBoEZJvUWajsAR9Oml9ERrf+dPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521473; c=relaxed/simple;
	bh=Aozp1aXK3Z6HJxGZb1VnkxigWyytsHuMK0W+atVUaio=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KOsfML5ATM4YmSCB+B9MVCWS+oRhCiZjvHPyh7pe3k3ikXKxGBm9lBgUc9JYHQKWA1jGKXKKRZbdnuPyiLZy1BNf3L5lJ/PTC5/T00e9E+2RlOCaYiQRuc8AO2dTR42HUmS5fxHmkJUzcX93EOhV2IsXVcWuA2mSTFm8GfvQrKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VnBLQ8ov; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VnBLQ8ov"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovN+c4WQfOn8Wt9gHsi5kvJI5yxGoSooMNaXQpB83UZ9d+H6alkq58Lf7+mZqmFrW+TPuPAHu0fHCIusT42xF7r5mq9Q1MiieFBBcyDlpBqMndBBi4lT6qEPnFxbHAPK+pXdAFhJEqrbdKqxq1TEiWHDVF+0dvWvQOvhtko5zON7AEMRehvd2WmeQIGG4Rw+BSNLf9MV2tFF0C0aGRjSPiv7syVeesU8QTQAz3bugEKtY1gBXCRubabeL7jfLyPjX3+sDZep4O6iED8dDTPjT3QjuAjpr4qKNSCoqb0kq4836E+evOLPsdewiNymhFHXn4DqhQdi1fgvZpzW5190nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbiJpnq9m+q1KFq4NMqDnmpiL3I0FQyZ203QDZ9A8Zw=;
 b=iW5kxwPEaWB2cveUY3szEggkhPj8rdGRhtFNPyR6w9JkVAC6BogLKXQHN26PENyV81ZtxKG8VbgEA6ZI1hhxjkmWGu7Vxy9Z0e/FyFriXIYyXQKRYRTBwtKTckfBkqyenusSA8xZAluuhs4Cbr8ffU2SKld1+Lp/t63lxRlx9egnOzJNqgvdA3MSkoW3qLP/5xSnl/ttnmkCqx7GaReGeLCtTA6P4lv2OnNEwJJckt4M4mlvOchBILnVHuSwxkXrnasn+mOsDNjVo1kaXpiQYKgeYdKZPKeDnza5ypUBQYpkSOOzqr9fgpLP+79WwCXXwZ5QKlle9plLVfhatKUjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbiJpnq9m+q1KFq4NMqDnmpiL3I0FQyZ203QDZ9A8Zw=;
 b=VnBLQ8ovmyYJaoz5f9/6UmXJwoYIB0PIXAAz9zuqN6jiRNBSKVWMZC/sIH01hWnMD8piXBfx8A0ZVSom2uvxQNkDA65AAgoJQE0z7B5dvvB4h55tfXsnuVRJ9ZGe5gH1FSGc9Ohxaqav8MpSd7X7V3OE8G2L+/jfH84dUtfad6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 07:31:09 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:31:08 +0000
Message-ID: <80b44d74-ebb1-4522-9009-09fe1ff9910d@amd.com>
Date: Thu, 5 Sep 2024 15:31:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
 <20240905031617-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240905031617-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: fd560d50-4d10-49b5-8042-08dccd7cb59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnNYR2s5SmlNMFN0Q0czbnIrcy83aXhBQU9UT2xWc2RvelFPTkRCODVLNE05?=
 =?utf-8?B?TTVSdGpBenFRWHdvREhMN3BEZ0QvVFJVWDJLbEV3ZnVKbEF2RHAzOVZtQjB5?=
 =?utf-8?B?cXJzMHFVU2xLcFhETFEzNUZxdXBwV0RiRnlHNUhEUHQrcUZoQncwaHZDeXV1?=
 =?utf-8?B?ZkpYbmlhcTNSQ09QZkgrMjNma25lTXhzZ3ltU0Q3VHlVNG9NWkM5UmZGMCtM?=
 =?utf-8?B?Y1E2YllMelQwaGxmbXpKQjlOWDZVS20yVUNLOTV4UHBPZXVoTkw0YkxxYUww?=
 =?utf-8?B?QmJ4NDVueGFsMytBemFoc2R0MENzWEl5VTZvYXBjNzFxdS9oeU5yWmhhUHc5?=
 =?utf-8?B?SjkxWDhoUzNVWGpmSWJxNUVmbmVFNkdzOEZOZUJJVG5FdUJMOVhlb1pYektT?=
 =?utf-8?B?cGxRVEJmcHoreUdsYnhmSCtCQ2F5aHFsTjBtK0IvdDZ5RjBDdWs1Z1hBaWdN?=
 =?utf-8?B?NDJPU2NvV2NoMCt2cGFxelpBMkZjWThQOGQzUFN4M1REVzNCZnN3Wktidkth?=
 =?utf-8?B?MmozNFJxUFhPLzg2dVN1MmVqdmVLa1BQVHB5NnN4TWUyRHdueWowV0tqakY2?=
 =?utf-8?B?NTUrU0w0d1paNnlnUVl5emlTVjhDRFY3b1ZBSlhVV2E4VHV3WnV1TUFTTHN6?=
 =?utf-8?B?ZE1FcXg5N0xpRTNaL3hKS1EycDc0bVdqdkltYjVQeWMrWUVRdm4rNkdIOEsy?=
 =?utf-8?B?M1JFQkltR0VoZWRrSjZ1MlM5MEEwQXBUSXNDU3RQQlFRcDg5dW1oWnZndVhZ?=
 =?utf-8?B?UlNlNmJ3dUZGTllGK3hoZ0J5a2FDU2szUUp3NXM5d0VBU3UwcjNYczZCY0U1?=
 =?utf-8?B?czdlTnZwKzdwRkx6TUFJWlliZGJVWm9PQVNuZzJSZlZoeGxxUmMydFlSSUJF?=
 =?utf-8?B?SXhTN2hJbFUyYUR6eGUxbkNNMGUraXY4eVVjUGNnQmFtOGovVGw3T2JscnZ1?=
 =?utf-8?B?MUprZ3Z6d3dSSTE0QUU1dWIrVEcrZ3VDMjRzcVljNzZReUJ3TlpVSHMreFJD?=
 =?utf-8?B?NndBZUFsQ0hvaE5MOE9SR0JlY21aVWFFYWozMVpsb21mcjd0STBaZ1F2cUJZ?=
 =?utf-8?B?WGhlODluQUpBNmlWbGN2Y1J3d2FZcUZkQkNGVm0xbWViVTFCYXp6WHNuZWVG?=
 =?utf-8?B?bWM4Y0thV1NpdkI3aTU5Q2VmODlqeFJueXdZQ1ErSFV6K2R6R1VaTG5DL2Nh?=
 =?utf-8?B?ckhVQ21kUFpFZ1hmeWNCT3FTSXNBamEzU0tMOEs5TFdnVVI3T3hybC9EVnBE?=
 =?utf-8?B?MXVDdkRhYVBqM3N4NWZzcGtsSTZnWi9xR3pxTUlmY0FHVy96WkJha1JJK0g2?=
 =?utf-8?B?NnBqcTdOUUdydjFyaXU0c3BLVEkyS1VEc1RkOHNvOExzT05YdjBEMU5DRCs2?=
 =?utf-8?B?c0dld3RUWGR2bDJCK0x4VGNRTnZsOXo0dlkwK2NCTzZ5VnczRFpQLzB1SVpo?=
 =?utf-8?B?Ym16K2RObS8zK0lZWmFzVEVDQ1RUeEEvZHZPZk1jRFRodmsrUFJWZHZQOWpC?=
 =?utf-8?B?MnVzUU9KTFJjcGdpbkNOM1BWQmdBV3YzdjJXcGNRcXRmUW5lRDJyaVBMWlA0?=
 =?utf-8?B?Y1YxQXlnZUFIRjlTYUJjcVhOK3JIeHA0NzB0UHYzWi93dGxkU1h1dzhDeHpP?=
 =?utf-8?B?UTdzKzluTjZTcmtSTkwrOWJUWmtMN0NEVTYzZXUveXFtdFh6QURsc0pNcGNX?=
 =?utf-8?B?TWJZRXJlTVMwekJJajQ4ZjN3Y3pEaUZGNjhLS0ZvWmVINDF2M3NYRy9scHg5?=
 =?utf-8?B?a2RmWFZ0SVVxRWxEWkJXNU1zK21IcTgxMXd4RkNRd1NJK0JvNnJIL0JlS3NJ?=
 =?utf-8?B?SytTUkt5U1JBbUJUSk95QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmtVOWI1aVk0Zi9QZmNEYUNHZmpKOU5vWnJ1bk85anhqaDBrZGwyK1h4a0Fo?=
 =?utf-8?B?WHFXam14NDVodHFCL3BOK041MWxBa3locWRHbTRLYzY0VFovOHE0UWlhM3NV?=
 =?utf-8?B?VXllN3lPQ0kwbFI2UjYyajREZFdFYmdkd21tRVVoT2Z2UElpcFQvWXZaZ09K?=
 =?utf-8?B?SWcwNExyV2NWOURZK3VMUHhFWkVJOXZRZzRGdWFic010aFNpeng0MGJvRS8r?=
 =?utf-8?B?US9USnpnemZ2VEJvaXhKMXFhVjhVcWRMQndhbU1PL1FsVzVvd0xGRk5BT2Yy?=
 =?utf-8?B?UU5ob0NOeHppWDNTT0l5S2wrMXU2WEg1SU11RUZWZkRkd0VtZmRKNVp3ZUUy?=
 =?utf-8?B?NUJ1SXlpbHlFZVcwd1BPdkg3UDJFOWlZVitiaUJpVEp4bmg2a2JNOXVsbkdn?=
 =?utf-8?B?ZXhSOHh4UGl2emN2NUpSL2t3V2w1dFBXZnk1VS9jOVBRblNjWU40UEczb3dk?=
 =?utf-8?B?a2JDd0RWalpSOEdhMHpPWGRHdVF6T3ZId3dpdkd0bXhaaGMzRFZaMDdCeG1O?=
 =?utf-8?B?WW1TMlc0MDFSWmFDTmQ4RnpTbjJhSzFZKzhiQ2xxYlRvYlQ1OEx4OUhGRXNp?=
 =?utf-8?B?K3J2Y0Rhc3hEc0ZYMnpkUG1CTEZWR3Q0RUo2dVY0L2tjdlJUTDlkbGxMWFZz?=
 =?utf-8?B?azdBbHhZdHovczVXY2d6L2lzY2ZkbG9TV1U2R0w0Nzdia2pwY0MydWJSTFM3?=
 =?utf-8?B?WklEWlpESVh0bHZSak1XaUJLUFk2dXkyQW1PbkMvM1dydTlSYzlRMmw0NnF0?=
 =?utf-8?B?Vi92Qk9nNFpnREVvL2ZPcGdMMnYzLzJCOUFwbG1ZTWp3ekloVldLejloMTVU?=
 =?utf-8?B?WkhqNElUTnEwSWhkSTJVZnJZWndYb0t4Q1NtTG0wVVorV2FsaVcrMmFhQU1Z?=
 =?utf-8?B?di9aRUxyVmNmclBaeUhQSXQ4ZGVpNkdXdmRtZS9pUWZvaTM2SXBzb2xjVFZF?=
 =?utf-8?B?amlFUnhHcWJ3MVFlZnBVb0EwTXdDNlJtVlFKUUNZZTlVRnI4WktFNmRLWEto?=
 =?utf-8?B?a211R050NnZwMUFkUHY1T2V5eEVzNGZUT2ZmWm5HMEY4SWNiQmR5WXVtbUlV?=
 =?utf-8?B?YTZjb3JDN3BjNisrWDVsTy9TVEY4T214N29keTFkcVU1aWIxbUNBRTBMNVhX?=
 =?utf-8?B?Rnk5S01qaTFXMUlXeU9SUHRnb1dKd3Nuc3BOenhlMi9BYms2dDRTcnFVZStT?=
 =?utf-8?B?U2pLbHViMGpsTk91SnRmc0pkSU1EdE1jUFh2d3NkbXFubTRsNnMyUjVtTlZS?=
 =?utf-8?B?WHYrK29FeHVPVktOaFFGMlY2SmdJQklvOE1MYldBSmQ0SUFFL2RuelZwbC9H?=
 =?utf-8?B?YVlVMUkwZG1kUjZFQVJreGpBMEc5ZzhyWXM1cG8xQUgvd3NKeDdmU1dlcTg1?=
 =?utf-8?B?Y21hZWdzOVhNdU1yQnlvdWRNNGVOZXBhTUxOeHR0Y0huZytKRjY1OVMydEJC?=
 =?utf-8?B?V3k1UXhzcGNHK3BLMjdKMkRCUThTd3dOdWlmdElZRHZ3Y3VMYWtTM1JqMDJZ?=
 =?utf-8?B?OXpoQWwwNWdVbGlma0F3VzlSTVozcTRuMzJlUzBHZ1krdGVJZUgxalE1TWc5?=
 =?utf-8?B?R1d2dXliMkpmTk9aRnNyTmIrSU5EWHZFeDNVeU9sWGw0TDdDbEhHRVJ2cTVk?=
 =?utf-8?B?Rk52UDF1RGxxS1oxc1d4Q0lhSmdsZ2xCcEJIdU5sU1QzaEkxTng2VVZUNXpM?=
 =?utf-8?B?dE11aFhTcElFeStmN3d1cVB4NTdDbGRVSnVEamw5bVZLaEdBODFFcmpOY3do?=
 =?utf-8?B?VnA5U2owSitJQVNFeDNQTzFvYndSNFYwRFRNNFVES0hEVkh3UVVNV0RJOXA5?=
 =?utf-8?B?Rzh0S2RML0F5TThOOHlRUk5TdnlqTEU0YzUrb2I3TlFvanIxREh2Qk5ublow?=
 =?utf-8?B?OW16Y0UyNkFjWFdIQ05ZRlFCRGpHRCtkR1lsd0h2dFQyNzZpQk95TWtldzNB?=
 =?utf-8?B?dUxnMmtNOGVkY1ZEVlFjalJuYThPNzJpVG40ZDZtYUNUVGdKRnVhbjVieU1R?=
 =?utf-8?B?TVhwWFd4dzRRYjhYa1c0STFtN3dtaitWMkt3OFF1SGcvVFZvZG5tWTg5OWlM?=
 =?utf-8?B?Q1VvczNrQ3JBeHRyNDFkSVJQMWU1cW9LQjlBWTdxc01FcE5SZ3Npc1oxTXhD?=
 =?utf-8?Q?aB/hJLmMnuX9aUM/90zWrvJXX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd560d50-4d10-49b5-8042-08dccd7cb59e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:31:08.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctFf9fVO+IIkpF6T1Kt62yCinkNxmbmEPbLjFgcRpA52aed1lNV8KZaeIXzAlFChG4hMLolNg2y1MbFPK5fGRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505



On 9/5/2024 3:17 PM, Michael S. Tsirkin wrote:
> On Thu, Sep 05, 2024 at 03:14:45PM +0800, Zhu Lingshan wrote:
>>
>> On 9/4/2024 2:46 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Wednesday, September 4, 2024 12:09 PM
>>>>
>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com>
>>>> wrote:
>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com>
>>>> wrote:
>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>>>> But I don't like it that looking at the registers, one does not
>>>>>>>>>>> know the device state. Hidden state is bad for debuggability.
>>>>>>>>>>> We have 4 states:
>>>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>>>
>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>>>
>>>>>>>>>> This is why letting the status tell the status and control register to
>>>> control thing is elegant.
>>>>>>>>> No argument here.
>>>>>>>> Or, to be more precise, our status is driver status.
>>>>>>> It looks like the device actually otherwise there's no need for
>>>>>>> re-read or poll for things like reset and others.
>>>>>> The need is there for complex device state transitions, which can not
>>>>>> reasonably block a read response.
>>>>>> Another standard approach with PCI is to specify the time transitions
>>>>>> can take. I consider that less elegant - is this what you are
>>>>>> advocating? The advantage is that driver does not load the pci bus
>>>>>> with constant re-polling.
>>>>>> The disadvantage is that it is hard to pick a universal number.  A
>>>>>> combination of these approaches might work, e.g. a recommended
>>>>>> timeout then poll.
>>>>> We've already had msleep() for vp_reset(), anyhow we can increase the
>>>>> sleep time, if it can overload the pci:
>>>>>
>>>>>         while (vp_modern_get_status(mdev))
>>>>>                 msleep(1);
>>>>>
>>>>> We can do the same for suspending.
>>>>>
>>>>> The main blocker for timeout is that it may break migration and
>>>>> complicate the hardening. Another proposal in the past is to have a
>>>>> notification.
>>>>>
>>>>> But what I don't understand here is that suspend/resume should be
>>>>> lighter than reset. If we can afford a reset, so did the
>>>>> suspending/resume. If we want to have something new, that's fine but
>>>>> it should be orthogonal to a specific new status bit?
>>>> I agree, if we want new status indicator, then the new indicator should not be
>>>> specific to SUSPEND.
>>>>
>>> Sounds good to me as long as new functionality does not force the device to react in 50nsec.
>>> In the current state it forces the device so please upgrade the proposal as Michael guided.
>> Trap and emulate is very often in virtualization, of course the sooner the better for emulation.
>> But there are no 50nsec assumption and no one can force the hypervisor to finish any emulations within
>> a certain time 
> The spec should not assume devices are virtual, there are baremetal
> deployments of virtio. In such setups, there is no one to trap or
> emulate: driver must do everything itself.
sure thing, I am also confused why VM_EXIT & VM_ENTRY and is a problem here...
>
>
>>> Thanks.

