Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856608F66
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527391; cv=fail; b=Un3GwC6zEJiaZmGougF6vk/6zH1YzSxJc84mtbdkIAAEclqjCISqMxOXgtUAJ2ptz1y86aVNc+GfpFcebJ7oUidmR3mpaaoS2q6Z2E6oVX2+mnKCuoTfHE0hI6rC9PaPHuX+VFb3WfzUM78rUj2yBTgRORjX72YPuqYRX5hnnFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527391; c=relaxed/simple;
	bh=7c5v+udRSrjtBZrHBJxL09JYUDNssMVlC8F/2wRL0qw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qQfFGw1QVamLFZXu3KpcM3faQyJPMRMJE++evGmVjVEExNtG01Mi9aKUGPr3ajrLOYkkxjNYWcPsB52WPDc3Be225d+ncx1XnJ5VRN9dRy2MrUYD54nBWYow9s8HZFLfG9/wc3FPnKpkIY6AW4kokN5MKYWF+pjrjrpm1xWDpq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WYCqMNXb; arc=fail smtp.client-ip=40.107.93.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WYCqMNXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBOgaVCCjfbLTMrFx4btXxYz1l0tudPdH/FKT8RZD3U+mPJhKqf7cN2CBL7yhaztNv5whvb5d0i1SCKFoI+pN56nBn+/M0G4WxW2cKlMrSWZ69kg9tyAzDg1DOdydtmJuJiea1jG4MHVhWzZpExLHqWpKlQ5Mc6egEUaveNiC+LIxDMgtxCD7k3AU8NlA4LG6BfLXNkdoT6K1ur8d8sNRfPIIrzskHuDNvnrCETNjrcYg0CvY19lsnpwvzHPsjpcs2NOZKG9OJanpjDrDttvnUlb/rUwb/B9iKOoNEw2mZ/tZnCisSHmff1Nj6yk0J6bh0gbDhNmyONjiNLPNaj1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEAYT+mXC7fIK8MAQMj1lnThQ3tF+cAuMtOilqYFDKA=;
 b=H3o+FVXHkyRHuaLBFXotIYUmMc0GHI2O76wWIDOMkIj4h6hKevDPAT/O5Cjw+hfiwmYV7zYq8MjDJx/g+u57rkXSu2QloN9kq4h7IeXLdLzMPHc8WpcBw+KHczhqAHHxc5GADvtiPHkU4aFFAXqkZI5p3HDpDuIHiNDGS9R4cx4I2bXwoyQd96Bf0c0i2AOm2hofhhw6123goiI7pGj2WJI08yw45cn2js1vSYsVLt0EA+quCwF/rTMufNQD68CoyYrkDhT2bCilq35DsaPYLecibVy+YQmTS+TdhguYL1qauFm9BgFuVRFtxyeSTUNiDqbyHt8TI8u/hdWRGLol3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEAYT+mXC7fIK8MAQMj1lnThQ3tF+cAuMtOilqYFDKA=;
 b=WYCqMNXbzK3u6gcN3wOu7zp3PxdLdUjoz46mhSU3oiJ9hEZxkedvKuF6/6mMn4L/bHt91bH6UPlNT8AT6/0+DHi4Mx9nzN/WsRWj9ngAOzckFmYMYL3WRUfHHtBMPtrskR/Z26ET2r1DdD6YQAtmS3w78e2WftlLMnY+7iRXocg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 09:09:46 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 09:09:45 +0000
Message-ID: <bae7e0bf-4baf-4a36-8fd3-0f99e86a89ba@amd.com>
Date: Thu, 5 Sep 2024 17:09:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
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
 <20240905024935-mutt-send-email-mst@kernel.org>
 <47b21a27-d34f-4836-9af4-b009001536ef@amd.com>
 <20240905031759-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240905031759-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:3:18::24) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b48157e-bfdc-49c5-3cc7-08dccd8a7c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NG9DZG91YVlLZ0lTRGNBRHlMWDlkM3Vtb1QrY052YzcxV3BrMVoybGtQd0Vq?=
 =?utf-8?B?bVgwQk02aGgyNXFMdUwwZXZCQ0lNa3hKTzRHRUpzRXhaV2crVitNaytNMmFR?=
 =?utf-8?B?R1FBdG9yUGR0UW1xRDBRbjNrSkoydmpLWTB4RzgrNHhheXNWbC9JeEVBYzZx?=
 =?utf-8?B?aXpST2MyWXVQNDVCaDNQRXAxNVpmYW1OeFB5L2lGSEZQVlRySW1hTnEvRURu?=
 =?utf-8?B?Q0podExtMElMWWdoWXZtWkRPMVpnWnVCejQxZGlCUlkyV1hIcTRCTkltSnR6?=
 =?utf-8?B?K1pjYS9kVFo4MHI3Q2JsNlBwRVFreERXUmtFSC91ZW5GMEV0K0JycWxVSEhR?=
 =?utf-8?B?WWZVS2J6SFVxMGJUQjJCaEdZK3BPSll0Rko0L1A2eTRFUnhRU0tqMm1PckxE?=
 =?utf-8?B?Sm9aVVExbkt6R1dvalhUbkZUQmRZMTZSNXlrSzhlZ2R0UjZseVc2cWNzNERP?=
 =?utf-8?B?YTBiWG1XMG1LSjZ5SmhSbU1ITkx0L0dYY2RUb1ltQ2EyMk1JZFRiWE92WWI3?=
 =?utf-8?B?UzVSZ29tSFYvL1dMSkxhbEJRLzRpWnIwT3IrS0RPaTJHUTRxdldRYlpRWmRo?=
 =?utf-8?B?KzJOSWp4T1lRdGl3YU5CSzE3TzdaZm9YanplbzBFM3FyYjRpL2g5WVl6TkVQ?=
 =?utf-8?B?STRtUUJqQ0RwY0RkbC9hT1FJaDNzSTlxT3VyYldnVXJJSTJlWDNCbENxYmMr?=
 =?utf-8?B?YmkrNnpsdTVIMitrazhSQVNPVHhUS1JYY1BtRjdMSHRCWkgyM09hV2ZQU2di?=
 =?utf-8?B?UlN3UjF6TlQ0VjVXOEUydGgzMlBVRlNPMElydjVHei91VzhZRFAybWlaVVlC?=
 =?utf-8?B?SzBlRHdUYndGNXdmZ2hMWGduYzg2eFlZMXpkUTc5OGszWVY5NFpkMml3MkJn?=
 =?utf-8?B?N2JudkdWOVFmVDRjYTV2NXJXSmI4QmNzdHJ0N3hzMTFYOFpYbnBtRlZUbDdz?=
 =?utf-8?B?dXVHOWs5L2JSa1paKzhhVlZ3bGxzYllDcW1OZXI3M090WnRWT2E5M3VTdVVY?=
 =?utf-8?B?ckdDaWFBZU95ZVUvT24zUlNtT2tpTm15SnpubksyazlJNG1BNkhVNEZTb1hY?=
 =?utf-8?B?NEdOMWNRZzVMRDRWeXhBY1lOYWpxVG1vZHlzZGIrTmN2TTcvMVd4OVZRTy9i?=
 =?utf-8?B?a2dldzBPS2p1SFRYQmZKbUh1UzVoTjFtbGNlQUVxU3FsQytmb2pHZ29Sb2pp?=
 =?utf-8?B?WEhlNlhXZFFSdEVtZXc2UncxRHRwRjU5eHBrTWhkeUREMDg2U29VRSsyNU1K?=
 =?utf-8?B?Z1JQRVR4VlFyTGV3alNsZWNZQkluSjRpcE1tc2tmcWk3NTR2WVNOYWhldEYz?=
 =?utf-8?B?WXNsK3dsN0U1TW1lUW5HRzJOZjRrczE5WE91cnRuSmJnM0JWRXkvbS9aOHVV?=
 =?utf-8?B?Z1Bjcmx0ZDA5WWozeVliYTFvMXJ3QkV5a1h6em5xRWlXY1V6TW56empPK2hM?=
 =?utf-8?B?dWd2S0VnbmFJS29DR2FpTmhaWWh2aHhEdnV0WGc4MGNLYkJaMG5wcUs0MU4r?=
 =?utf-8?B?LzEzaVJmQ3BpZUYxR3d5UktQN3U3WFVYRDdhYytMbDJFQ2xBM1FvQWVZVmc3?=
 =?utf-8?B?VmhwOTVoVGVSUUdVRHBBNUE1cGRXdTNacy90NG9ac3dPaFlDVnhBV01yR3BK?=
 =?utf-8?B?SmFzRGtPZHUxb25kZWpibXBhejE2L3lyV01YNkllcGRtbDZkaW5qdnkyNGJ4?=
 =?utf-8?B?TEpBa0I3VnVQV1lsTS9zOHVOc0wrc1ZPNlVTSGM1bHVES2Z1Qm96ZjN5Q1ZW?=
 =?utf-8?B?c1NxclRCSzlhbWE3WmhFcW1UenZnbDJ0bzFUekM3VXh1SlNvQWs5Nm53SGFN?=
 =?utf-8?B?RFZCVGJzYUk3RnBFMHFoUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRhNzVudDI4eEt6Mkx2NnRNUTJQQXp6b0Q3MG01YnBQTU5sTis1OE1XcTRh?=
 =?utf-8?B?VFZaR2ZETnpLQlp1Q2RUWjFtNVN2eEl1OElvYTB2NGVQc3RnTU1VNHErMEF0?=
 =?utf-8?B?ZDdUTTZGVU5HdUppcVp3dVFqOWRGM2V1ZEZuZFlvaGYydFFSYzdITHJWZXVC?=
 =?utf-8?B?U2MyeUtSUHFseGFYbGgrb1czT2FqeWgrbXlubTdRMVR1eTEyc3BIc213TDFr?=
 =?utf-8?B?RTE5SDVvbzJNNnU1NzBjTFhsY1Vjd25SV3oybnVRRUJHUDQvaTdqUzc5YTVH?=
 =?utf-8?B?V1VXZktkdGZDd0dPcTZMUjJ5azhndDQ3NkpmeUVIWmc4UmhiSVVyc3VTbGxu?=
 =?utf-8?B?T3JraG9NQXhsTElpd0JDN0thbTQ3OGpsNlZVVFQrWWY3NFBDV29TcFdBcFd2?=
 =?utf-8?B?cjR2MTFjNEJVbDN4UEh6Q2lQbFNoT1BJQitEdHU5aHFTalpOMG5GSUNBekM3?=
 =?utf-8?B?Z3NYZ2tmejUyejdBMDBINWdGbmc2b3dYOFJoTkhyY1NSdkFtRExSM01ieDRS?=
 =?utf-8?B?MVV4eTQvWEpPM3Y5aXJBN3ROYm5sSXNUK1BnS04rWENOMG1HbFZmZ1hLMzJm?=
 =?utf-8?B?dlk0MVFaUlcxbTIxbTg1TWRpVFRCYmVDVGlVQlFmQ09ZZjRGbkhSdmkxU2hN?=
 =?utf-8?B?RzI1dC9uWnZnK2ZBZlY0WEVKY3JVQW1iQ0p5TXpWUmhCNUJMWjB4THNZZGlD?=
 =?utf-8?B?WjBjUEdqei9NcnhGV0pmWXpNeDN3SUo4NTEyeGNKQldwT1RkUVBKS2JxZ2JM?=
 =?utf-8?B?TmhnTW5NSHRiRlM5ZmpQdU5ONlMwNmRIRnhMZnZkNkwyMGt0NTlMUUNlWTV5?=
 =?utf-8?B?cHFnQ3ZEOEoyK2RINGhqVkNUUi9uRlMveVBjU3ZWc3gyYitzSWJkb0o3ckgw?=
 =?utf-8?B?UUgzNnJoeTRrQ04wdHlLcmtRYkwxVWxlcncvc1hnOWtaYnVjT1dRZnV4OVN4?=
 =?utf-8?B?OWxBSHZTRHQxWFZSZzliNUpWSW00S0J3WUkraDlRbUtTZVhzSTVtK2NQUUoz?=
 =?utf-8?B?L3FqZGJTTlB2aUZiajhGWGhWNWpBSUx2Tjk4eHRFUFREcjg0bzQ1eG9qWjZT?=
 =?utf-8?B?aElub3N4U1ZjTmU5NFFWR3V0Rk5DNmZDNm00WFJoOUJmZmZ0SVJjaE9VYzFG?=
 =?utf-8?B?OFR3Y1FNejMxR0F5V1NWNmpjWGhLRTg2VW9kN0J1OGN6QU9OaXUvSUJRZC9v?=
 =?utf-8?B?UExER3AvTTUxR2R3K1FOWEJ1NFNRR2taUDQvMmxUc1dsSndqcG0xaHpXaExW?=
 =?utf-8?B?OW5KeThQcStrbm5YSGd0bEx0L0x5bVM1R04yOGVUTEduUXV6dUNld1EzaG5m?=
 =?utf-8?B?NHdDdEVDLzlQWEdWaWZqNGdyYUJad3hEWkVaS3gvMnBLQy9DZWhZNHplZjYz?=
 =?utf-8?B?eTQ1c0hjL1pic1BIRmtYcnR0eVk5UnNoOERYYVRON0ZjamdUbitJS0dsVHdF?=
 =?utf-8?B?RlBqbGNSTXVZRXZvUmxMMFZNWUdoVmo3aUduaGVDQzQzb0ZOTlZiOENRMFZG?=
 =?utf-8?B?dm5adFEzSE9JS051S0tpWjZLa0NXRWpKbXFnaUFmUFFqYjhpcW5BZUk0NmtQ?=
 =?utf-8?B?WWNvODZ2TmdUMm9ObkUyRTNIWVJicnN1UVp4UjhlS3FGcmxLN0FqSXR2MXR4?=
 =?utf-8?B?RUtuL2I0RmE5bmV1akludkFrV1doT3FEUDhuVjdXNmJGM2UxMlQvcU5pY0VT?=
 =?utf-8?B?RmlINDlZcm1LVE8yaGVhOFNTOUhxV1o0ZVFKbVJVUURONENoTHR3NDNjL2VI?=
 =?utf-8?B?Z1RHUWNnWjBWZlZKaXFtSFBPamI0MjlFVVA3WXBhbml1ZTFFRzVlamFhczVs?=
 =?utf-8?B?dkVYZjBGS0pQZUlzblZDRzdjbk9pdC9JdHRhSjZoS2lrMmV2cllhaExENWZC?=
 =?utf-8?B?WUtZQTBFblhlV21XUDhndFBRMzVqbXBuTTd0M00wWmRlbUdXd05qNVo5M1BD?=
 =?utf-8?B?SEVyQTNTeXF4OGJaTUVBWmtPeVo2d0MydWxyOUs5S1ZRL3JmcVBYYVpWamov?=
 =?utf-8?B?MTlkd2FldkhRaFFXcktzWnF2ZU53QkhzcTdPNE5JS1VOQlVNdkNmNktrd1JB?=
 =?utf-8?B?U09SNGdqd3NyZjYwckFpSkFJY3JudGpMRnZDaXRDSmJIZDVzZjZuN0ttc3Mz?=
 =?utf-8?Q?tUeDTlXiUKizDQEVk3TWyFBAx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b48157e-bfdc-49c5-3cc7-08dccd8a7c62
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 09:09:45.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4lfl7dSoe6jA1mdghUTMs332d2YHYKnbbbYuJH9kYXhnumZhOWGGUC5zhE8g3Otzn74L11yl0cA8JpFU4PS4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489



On 9/5/2024 4:12 PM, Michael S. Tsirkin wrote:
> On Thu, Sep 05, 2024 at 03:12:41PM +0800, Zhu Lingshan wrote:
>>
>> On 9/5/2024 2:51 PM, Michael S. Tsirkin wrote:
>>> On Wed, Sep 04, 2024 at 02:38:36PM +0800, Zhu Lingshan wrote:
>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
>>>>>>>>>>> But I don't like it that looking at the registers, one does not know the device
>>>>>>>>>>> state. Hidden state is bad for debuggability.
>>>>>>>>>>> We have 4 states:
>>>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>>>
>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>>>
>>>>>>>>>> This is why letting the status tell the status and control register to control thing is elegant.
>>>>>>>>> No argument here.
>>>>>>>> Or, to be more precise, our status is driver status.
>>>>>>> It looks like the device actually otherwise there's no need for
>>>>>>> re-read or poll for things like reset and others.
>>>>>> The need is there for complex device state transitions, which
>>>>>> can not reasonably block a read response.
>>>>>> Another standard approach with PCI is to specify the time
>>>>>> transitions can take. I consider that less elegant -
>>>>>> is this what you are advocating? The advantage is that
>>>>>> driver does not load the pci bus with constant re-polling.
>>>>>> The disadvantage is that it is hard to pick a universal
>>>>>> number.  A combination of these approaches might work,
>>>>>> e.g. a recommended timeout then poll.
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
>>>> Thanks
>>>> Zhu Lingshan
>>> If you mean reset, we have a problem.
>>> Specifically, reset has to work before feature
>>> negotiation. So we can not do as we would with
>>> SUSPEND and use a feature bit to expose presence
>>> of the indicator register.
>> I guess the driver can reset the device even after DRIVER_OK.
> in fact, unlike suspend - at any point at all.
>
>> IMHO the indicator should work for all device_status transitions,
>> not only for RESET or SUSPEND, it should also apply for FEATURE_OK
>> and DRIVER_OK.
> I don't  know what kind of transition is there for DRIVER/DRIVER_OK.
> FEATURES_OK brings with it more issues, e.g. it can fail.
>
>
>> So we don't need a feature bit, we may just
>> place it in the common config space as you proposed before to
>> define common config space for all transport. We can do this for sure!
> I have to say, this project is really ballooning out ;)
>
>> Of course another approach is what Jason proposed, the existing
>> msleep and poll, driver knows whether the device is in progress
>> of status transitions because it is the driver writes device_status.
>>
>> Thanks
> or just a register for suspend transitions, worry about
> extending it later/
OK, will implement it in V8
>
>>> Regrettably, reset will have to still be supported
>>> through clearing status just because this is always there.
>>>
>>>
>>>>>>> Anyhow driver know
>>>>>>> its own status.
>>>>>>>
>>>>>>> Thanks
>>>>>> indeed, the status register is there to inform the device about
>>>>>> the driver status.
>>>>>>
>>>>>>
>>>>>>
>>>>>>>> If we need
>>>>>>>> to reflect and control device status, we need something else.
>>>>>>>>
>>>>> Thanks
>>>>>

