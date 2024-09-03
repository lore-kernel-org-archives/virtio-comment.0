Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6ED1C7664
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725353495; cv=fail; b=kGH1QoEybtVZbCgp19Tf8hWZdtdh/vIgKRwJsPjH5AdXA8HPCos2rlHOZyQ1UIgFMqP/cx85Ee1Zx320zJRAokyu6jtFg7wI21EWFQgt0WESqkjVibwJ+m49wiQ/WCjjHbe10NpreOSmtWZe48Y1NDHKBa4vhEiOEgjz5dTRmMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725353495; c=relaxed/simple;
	bh=oXfjTdQLwlgXwajK76aO3QswQ0gy+V9DF+qd7BPiPc4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QJr4had2vdTRBy5hzT4OEpssyklZKk/A5O+AEsWPeciltxdfPpMkaXJK1WxZaj4DB/ju67M3p1e9EWT+xhDVeLe5uaMki/vSWH5h5JidHJAVfMh+zEVFR74gJh8x6O85VLzLs2qhRWOHVKKjACWyY7rnHqkWq2vLNpFespWEyNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jT//V55Q; arc=fail smtp.client-ip=40.107.236.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jT//V55Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLFM1tl8qPQlosQI7e5nCI8SLqKVpwUuYZr0aJjCEcZ8NeV24IPaOXVOuSfisGgkTYqpt0vbf+qnKqQY3MTiT+en/AKE/nN7ETMgKvo+7BQ1aOUs6DAHDTG01oxGBePoQ16fj3aiim1OnQO/1I3d/Zamw/a3QWJvRxWI+Tu7EaYsQZ8zjG8JOTN170HAhY7SIM8c1UYy0BHTVyQZK9o+blYZ3QQhFW4qcRiCtguVayB8qjjcg5EgkieJb8U5LZb9DpcZRBrdllYVXqZ0lxM2XU789aa+KcNiJWFn76T0f4hcf2MhXiIrLYWXqpDghCAKHwHQhS9jUq5IfDZeDqmZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXfjTdQLwlgXwajK76aO3QswQ0gy+V9DF+qd7BPiPc4=;
 b=bo8jFntqpSfzMPAu8ULvHRbW6J8IW0yeakiBVe8U21m+B+37DdG7b6hXZQ5i0ctKNqVBwKei/36pdH/yQM6SA0CAcQdDXDPyZPZPtdxP7aWt8q6urUKZiu3oviiPFRakpnKeajt7M8Srj2rxMRjClXXhyS4GF+vyemq91UpM/4Wc3NhpoSeum50vaPjVJ46x5kkZWEdsKPWtyazNuNawn/XUafTCfmBL85n4JxMob0dDGVBjl+n8N9jm6+TXML0Tp72TWyFmxf4vziTwfU55qQFdX1cSU5OUlG6gbUhViuk7MuXUBgWApVPrVoPfPgvbVjGaFA1KN64Kbt7cnIFCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXfjTdQLwlgXwajK76aO3QswQ0gy+V9DF+qd7BPiPc4=;
 b=jT//V55QRRAOBsDRvpFIIQEy5VCVJmT7LAz7TCP7pPsB+TlYEADLXAg9RfDyDrN1ycdGboJHwKBK0bx5h/qc1AcV6ep5IUISyPw+ru2oaoWVh+HEV1QnAA77tenJPxVpg373mLnhUrx2OTJ3qDOXCR8EUq/0FdhdYqUbddPfcx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:51:28 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 08:51:28 +0000
Message-ID: <3bbab011-d4b6-463a-a092-cc3d4535cdc8@amd.com>
Date: Tue, 3 Sep 2024 16:51:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815110443-mutt-send-email-mst@kernel.org>
 <bbebed0c-c4d1-4e9f-95f7-da0d1c12d220@amd.com>
 <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713FA354FBC958CAA85BD80DC972@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcbc62d-b724-4563-f065-08dccbf5997e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGtQdkZwUGZXamIvZDBsYmNDYTE3eC84UkVjdmY0ZlBTZlYwRlJEb29iL2x1?=
 =?utf-8?B?cHU4Q1MzVWJTWlVjQkJqc25HUmlYbzR5aVZUYUMweDRSYXRrRjJMemlaY3Zo?=
 =?utf-8?B?S0RmVEdEeDlwWlQyVUtaUXJuRTFsbkhJQlVFY0V2Wk1heFZjZEVCcXByTU5G?=
 =?utf-8?B?WjhvSTc1K2VuSU1yd0J0RGNPMW1jVm40YWtjRDhoQjhicjBualhWRHFnbTh0?=
 =?utf-8?B?VmRzS2N0NHZVTlhEaUFrRzE0QTRrN2h1Zy84K09HUDIxMlM4R2tkQ2R6RTg2?=
 =?utf-8?B?S0g5WU9mV1k1cHNyUE82T1I3OHMvVTAxNGV2MG9XOVpzRnRjeml4Z2JNQXdB?=
 =?utf-8?B?ZEJZZDl6dzE5VzhpZ1F5ZTVlWjZqdlJ0b2VyT0d5NVFHZW0xRWtFQTVuajY0?=
 =?utf-8?B?V3NSRDhoenBjQnpSd0JHZm5uOE5Wc2ZoTENaRzNhdHp0ampRM01Eek5FUUNN?=
 =?utf-8?B?OWhqK0VaTC82NUpCSE9RVFdnbGZQbWdyS21PQzB5VFhMNHAxT01vRE4rS2dX?=
 =?utf-8?B?dlJHK3czTFlSakNNUHF2NHJzL3lrVXluNVB1bXNBcnhEN0VpK3J1MGlPdG9w?=
 =?utf-8?B?c2FxU2RrTnhnUkw0Q1Q2N1R3T2RkSnhmMWtVU3ZHQVFVQVZWcU1Ma0RtanVG?=
 =?utf-8?B?Nk1oeGw1enczb3pwS2dVeWRDc1ZLWDA0Z3NVSDFJME04U2pXd0VQZ3BTSHdZ?=
 =?utf-8?B?UnhsVDcvL0h5S2JZQ3hqZm5IM2JXUHY3cXFYQ1lSZUlJdW1TbjlpZ0N4Wnkz?=
 =?utf-8?B?c0ZVVDRQeGpPUVZIYjRINUpRSkNsTEdPcUhvYUkzbldXSGM1S2dob2xxaTN1?=
 =?utf-8?B?RW1zN3d4VGxMN2F6ZStLWGs0MXc0eDU3RXBsZ1FoM0pqNUZPV3ovT0FLeTJz?=
 =?utf-8?B?VkdDTms3ZEc2cEs5N2pxWGxTTkFIN1JNYXIwZHM3Sjl1b0RmZ3hTU1JpeXh2?=
 =?utf-8?B?RWxEOFJFVzdsc29wTnhiMFFkenVOSzdRUlc3YllCRFMzN3NmLzdTU2ZrZWVP?=
 =?utf-8?B?cmt2YzBQdm1MTkVYU1hOVk1tU25zWm1YVC9YVnBkb2pqY0hHbnVwMlFVN3lq?=
 =?utf-8?B?Z3M2YnFhWThqbk8vVlhVZTI2aERXZnJ6cjFiWCsrdDZrSXBzOXBwUm1PeTNF?=
 =?utf-8?B?VnpEeVp2dzc5T1lQUjI5bG1tM2lKUHlURXV4cDM5YzhBY29PcGkwK1V0NHdw?=
 =?utf-8?B?NlhBRXRqcnJpZjd1dlYvTzNWWUp0Y28yVHNabTV0UXhPM0dQd2E5UkpBZWQ0?=
 =?utf-8?B?azlqZjhVQUZpcHA5enNycXJtUkxzSzd6NWh4QUcrN2ZxeXd3U0l6SmFQYjBn?=
 =?utf-8?B?aFg5MDFmaW5tUzNBc1NlVVBBODZsZkxXNnNpWFl5SnFTUEFpblFoZVdMblhG?=
 =?utf-8?B?TFdIODM1YjdmU3FlOC9SNkRkNWhjUGdKU3hwYUxjRVpJakFVWTMxbEZoMlJM?=
 =?utf-8?B?S1NLMW8zMkRSWFR4UjVycEwrU1Zmd0RnRzVkZEpmTCtncVlMdERkS1E5M2xq?=
 =?utf-8?B?THJwUlY5dHVZQTlxSzc5VmJLbmdDMkluTml4dFFGNkk5UWZiemFxbXkvZlNn?=
 =?utf-8?B?clF0SlNBdGhxN3QvVXp0WEV1ZUsrRWN1ZTFhclJTL1lla29NK0M5RzlGUTJZ?=
 =?utf-8?B?WmJBaVVabDNYdG40THlIWVU3a1BHUUpxT29ZemEvWGN0UGtQanFSUE9GZ0NV?=
 =?utf-8?B?bFpkbU9LQzJVdWhMaWg2amVtT3BoeU5wVjdCS04vNGVDVFpyRzQxMkRMQTNX?=
 =?utf-8?B?UkRPbVM2aHc4QVU1ZE1HV25WL1ZlWXpDVGRYbmhGdHEvWkdwQi9sNzN6Wmov?=
 =?utf-8?B?blZSRjR0ZEpVWXdVQ21TQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFEwMXNvS0pHSGUzblpqSEs3UDVSMi9lU0FMNCtLV044bUtybTNhc2tEUlVs?=
 =?utf-8?B?MFc1UW1leVlSVGtuYVY3ZmthZk10bVFuWlgySkZnMmZlNHk1MDV1MUJvT3I1?=
 =?utf-8?B?dzB2aU94c0g1RDdaN3hxZE5kWDQ0R2drU0VDaFNKTDlWSW9GblA0OXllQVMr?=
 =?utf-8?B?ODEwZkVTRGkxV3kxVEk5SmU3bmQxNnpRaXYrNDVhaU9FaC9ESDZhTUp5STlt?=
 =?utf-8?B?cDFsLzJnUktHMVlCeTcrbkJEWG9SQjd0NlJQOHNKSzlkUGU0QnZHTE9pK2Z6?=
 =?utf-8?B?R3hrZjFoaEQvVjdGTUJFMmhRSGdveENXYWt2eXBhbzFKUjVRSTZtd09jeU5t?=
 =?utf-8?B?QlB0SlIydmJ0UTJFTEFCK0I5b2pzZXVtcExjTDJML1FmR09zRzlacFhCQnow?=
 =?utf-8?B?Nms3SzBYOGErWWNFbnF0ZUVKRzR1RkpFMW5oVElvSjRNOVUrSFZnNS9kVThj?=
 =?utf-8?B?Y0JFRlVTYWRKZWRXcTVrUTA3VWpyOVJyaTJLVDBEditXYTA1azRrcFBxVFdQ?=
 =?utf-8?B?UFhSMlBOa2VMUDNnNmJTS2pNaWdsOXErd1Q0R1ZwQ09UZ243MUF2OUlJQmlL?=
 =?utf-8?B?UVRFZXp0NHB5OXBwK1p4a21YSnQwR095MDAwRWVNb3dUU3JQZjZUOWJTWkdv?=
 =?utf-8?B?RDVsRGsxb1dOSXZpUkhPVmNWcGduNnF1UGI4NEV2a21wT2tnVWluMkJIRThi?=
 =?utf-8?B?TXJlQXp1UGJxYVB4OUdZMUcrc1FyV3pHU3E0cFFjSnBST1lCU1Y2U1dJdE90?=
 =?utf-8?B?MiswZ2hSYnlORkhDMVBZUXZlM3RIR0hXaWhJb3hKSFUyYW9uaWd3Qzdac2lJ?=
 =?utf-8?B?ZGgyZk15Y3hqU0JpUGFkQUNoZ0ljemhzckhOV09xc0o3czlKZjNseW9FaGZO?=
 =?utf-8?B?NzlPa3lKa3NWN1FjdWtTcGR0T0V5dXpPeC84ZFhCTUd4WnIrME5Ja082b3BX?=
 =?utf-8?B?TXZEV1ZLTWxnT2kyQ2o0bVc4dmtkWkJ6ZlFlZ1p4b053RktmU0NlTXpON1Yx?=
 =?utf-8?B?ODJKMGVvWFl5ZjdOS0ZnM09UYi9md2hDSkdMNEIxNS9VbjMxZytzbHBUQ0o3?=
 =?utf-8?B?b092VWxlbXRCem9TRnJVbDRlYXpGMmJqbjdQUXVKYVA0dkdVV2doSzZSS1Rh?=
 =?utf-8?B?V21VeGxYYUFzSHRLNzBPZWtUSndGZldVM1B4TlZ2UXdwcXE3Qm90dW9XVjc2?=
 =?utf-8?B?dGRCQWlScVdRVVdxa21JQ2VsNmhOOHp5NDMzckJFWXE2M082N3J2ZjhHVkJy?=
 =?utf-8?B?TTIzWXRNM2x2TFZuZnR6dFM0MVZzNWRZYjNMclA2V3ZXMi9TYVNzV2YraWxY?=
 =?utf-8?B?Q0w3Y1BxZVVaVVl5MG1JN1RIZDhpNUxlem1zSkJwdE1INHNlWlVGWXhEMzYr?=
 =?utf-8?B?RXduL1hqV2N0UjJwL0xDd01sZXpBRWpxRlgySTlLNXIzeVhBVi9adWo4VkhF?=
 =?utf-8?B?TytFSE10Z3dUdWNERlZsbCtmNW1kNXVDa1ZzaXVnV0xUV1p2TDErSmN3RlN0?=
 =?utf-8?B?VnBsZnV4N0ZkVVZjQ01NUXV5OTE5dWZ6NW9wQUkydllBVUVYRWZoa1l0QnBH?=
 =?utf-8?B?U2RBbnVTbFE1TFU4eFBtNEdHZjNQWW45U2pPMlEwOExscHNSVmhKWXRiVlRm?=
 =?utf-8?B?VjVQZEl3OTZLTGJKNHRPTXIyN1FBU2NPbVB0enBqOEpIZVVlUlcvSllRaXlF?=
 =?utf-8?B?Qld2cTM0QUhCcDAvcm0zQmpQRlVDM1EvZkVZZlJ3Q3BJS2Q4TERNZjhlY1VP?=
 =?utf-8?B?eDRBOFB1N0x0ZVBjVGNoSGNRd0RjTE1HQTM0L1JzZ2xQNzFLZlo1WUJ3Ri9Y?=
 =?utf-8?B?eTJJdmZWWUVaKzlmVjJvczQ3cHROOXUwajJtTFhuWU96dnZ2ZXpiN0owb2Za?=
 =?utf-8?B?U2wzZWFmeWtBa0NmNWxOY0xRUEFneWpCSEVSclJhVGJPWXc2Sk8wMFdFMEl1?=
 =?utf-8?B?TllPZ3NSRmkxWVJoaFhwQWNhV2JoMEo1d2huR2h4bFlSUVE3SXNwb0pMYjBH?=
 =?utf-8?B?bFB5TDhyWU1rL29FeVF4QjRGMDhmblhvZGtqY1dEa3BENWs5NmNGUkdpUWpi?=
 =?utf-8?B?R0ZRLzVUeDlJMWxBSDdwK0ttSHo3UzZLNUZjZmdiK0Z2YVduV01MbnI1NmVp?=
 =?utf-8?Q?hcIvqPackDtjL3gONc6gMY9IC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcbc62d-b724-4563-f065-08dccbf5997e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:51:28.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ODXuQQ6lRqllhiJdP68kO41S1K5E0225vriNHLFiHYBaO/mF/+SxDy/EEW4MIlBaOoTgczsiRwpU/p4VA0r6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391



On 8/30/2024 11:10 AM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Friday, August 30, 2024 8:07 AM
>>
>>
>> On 8/15/2024 11:07 PM, Michael S. Tsirkin wrote:
>>> On Thu, Aug 15, 2024 at 10:59:45AM +0000, Parav Pandit wrote:
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Thursday, August 15, 2024 4:23 PM
>>>>>
>>>>> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
>>>>>> That means, PCI HW needs to return suspend=0, until the device is
>>>>>> not
>>>>> suspended.
>>>>>> In this example, the device cannot build special circuitry to
>>>>>> answer
>>>>> suspend=true within 50nsec, or in other words building special
>>>>> circuitry to return suspend=false is too complex for the slow operation.
>>>>>> If this understanding of burden is clear,
>>>>>>
>>>>>> The proposal is, can you please extend the interface such that,
>>>>>>
>>>>>> 1. driver writes suspend command.
>>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
>>>>>> This is
>>>>> the default value.
>>>>>> 3. When the device completes suspend, it changes the polarity of
>>>>> suspend_status=true.
>>>>>> This has two main benefits:
>>>>>> [A] This will enable software-based devices to write data to slow
>>>>>> files and
>>>>> does not have to force VM_EXITs.
>>>>>> [B] It also enables hw based devices to not build special circuitry
>>>>>> to answer
>>>>> within 50nsec, which can get very complicated for tens or hundreds
>>>>> of PCI PFs.
>>>>>
>>>>> I read this several times, and I don't understand what is proposed.
>>>>> A special register for suspend/resume? Is this the difference?
>>>>>
>>>> Yes, a command register for suspend/resume operation.
>>>> And device_status new bit that Lingshan defined returns the status of this
>> operation.
>>>
>>> Ugh, it's all quite messy IMHO.
>>> We have 4 states:
>>> - operational (resumed)
>>> - suspend in progress
>>> - suspended
>>> - resume in progress
>>>
>>> What I'd do then is a two bit register.
>>> To suspend:
>>> - write suspend in progress
>>> - re-read, waiting until suspended
>>> To resume
>>> - write resume in progress
>>> - re-read, waiting until operational (resumed)
>>>
>>> How does this sound?
>> This can work for sure. but is it a must?
>> I mean, the driver has its own knowledge of how it operate the device.
>> When device presents SUSPEND == 0, It know whether the device is in
>> normal operational state or in the progress of SUSPENDING.
>>
>> But if you think we should add a new register which applying for all
>> device_status transitions, NOT only for SUSPEND. we can surely do that.
>>
>> Thanks
> New register beyond suspend+resume can be useful too.
> For sure it will simplify the suspend + resume flow.
There should be no difference in how the driver handles SUSPEND
and other device status like RESET.

If we want to add a new register, then it is not only for SUSPEND,
but for all status transitions. 
We need Michael to confirm we should implement this new register
that apply to all device_status transitions for common interests.

Thanks
>

