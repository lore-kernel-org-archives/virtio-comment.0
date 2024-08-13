Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398163D3B8
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 06:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723529656; cv=fail; b=CV/jKTlhMZh+O4MtDOfQGjHpiRNi2Pu55JvW9D6SPf3QaGaMEEVNdGI/QGFDfDi8zGQOwrJCDNTRliGnTmDYAedTQDnf1Xa9VQhEAmmxGLI8hAFqAztRpbxkbNjK6ATvFDkp9+4salABpp4n7AXW9g20o9RWtj/pEZ3e3YY6wj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723529656; c=relaxed/simple;
	bh=1VPRx9eVkMcFkenser40R4smBldnhhO1SaVqbo9CxYA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U+tPFNP6f8zyTrN3A4oC73zXbSUUsmomihDeACQ2I4sGKikjKtNgw8d2kXhC8+yd5mC6eSundDMNqgzqwzcMxkds0bWXn47TIK1gC7RiQSz+UyTUfVqL4tnHmC1I/pzaeaE4lvEqo2Ou8YL9D4CyJ1S9Y5mESNcBRL/vE/oJuS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3BXjdfBK; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3BXjdfBK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHQlwCkW1uAB3+qfGlt9ojTbaimtUwXxSOGNOaX4oggXo5m99kI8vQr+62oheDH837bUH/ScUBdVFzofPCmk2LUq5DVZsAR+W8Zvt6MM2NN+ZuiwnHtvw61yWPh1SZqSGEti5j95AcXLT32p/gcgEfg4tzEv0PQq7DgXH4Ua9AOB4HrY/alH9rH+unje7pC305O4w457QFtVAWN3v1WFVaWqMug38yB6E+uGn9pYK8obsjX+BLP4tHBhq+VlkBeSPn7Y8bFzEOo6volXZpcO2vEFBSZH+Pgq2/vXJQRn2apSei8Iyy0ysNSWvNzAm8uY4FODVOT2QgGCW5wmD+SYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ot8PiuxPzjiNVW3Eyg93Mn+rM5C9j3NpAwhLMniFqPA=;
 b=YECMtsZ+ADdmPwf6Dk9KM4LNT0E3qw2MN5pzsawnWMzYNIoS30h7M8WAcrJt7JoE+dLrBP/R6VFIpS/tpHRoyPgsnGrNzd60K8LTFUJWA56iwUBmGXZTkyadC0GlHnpgrDa+CBrpC+g11TAK5hddk9yg9JqY3Xr+EMiZUhGpqXDOd7imK44QzhAnYq2d5TbzRtcnc/7c9GavecgOBWOoOrAgf0Egkx9jkGBSDmtLHcPkFnf7uZMHWkELvhAm22j44EVtcjcf1qN3EoRG8KpWv8ED1pjEhuuNpOhwlfUgqm7k72jz3SiCKtXrL+JuZwdTiXVjtz3ayZIrMtMSXml0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ot8PiuxPzjiNVW3Eyg93Mn+rM5C9j3NpAwhLMniFqPA=;
 b=3BXjdfBKi/KBnvO96xWhnSuXh0JV8k84X1S6iJcOy4DYgI1+EOZJ3Fu9Cz5LMvTtzMzLC+sGiL8C+vRpQwdfUowu3LTOi1BzZ2zRbqNW0YS0jm9Vf0vy1+H2UanP6xJtqYB45MjpdiijUldftgauZGFc1ZA8wH0Eq1+kCzA0Zmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB9275.namprd12.prod.outlook.com (2603:10b6:8:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:14:10 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 06:14:10 +0000
Message-ID: <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
Date: Tue, 13 Aug 2024 14:14:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Zhu Lingshan <lingshan.zhu@intel.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: f79492d1-6fff-49a0-11e2-08dcbb5f2547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDd2Zjl4OTlsNDEvSG9EcDRQRjU0c0Frem1BZXB0eGVSK1RRZWlrcGZXNjZz?=
 =?utf-8?B?UStMY3FGdXJ0dDNWUHkwNDdIOXJmUldkbENoRVQ2TURBdFJtelhTTGdsMFZB?=
 =?utf-8?B?S3BwR1Q1TVVjR2RUcUdRVnZIY3BFelMvenJzcnZoUUFSR3YzNkszTWhsTlFr?=
 =?utf-8?B?bHhxazRObWpiczJiVGpsc2NGM2tpQnBaNGxDWjNqUVhJUWNPYjdkZXI4RmY5?=
 =?utf-8?B?RTNiQlN3bS9RWktpTXJLenhjaUdKdHdlSzRyaVNXd1hvV1NjZWZ1a3EzM2VY?=
 =?utf-8?B?VkM1MjVXZ0lZWmR2UDFwcGlYUUtmTmNqOXhYQnBsSUdobHcyRTFMUkhQT0hM?=
 =?utf-8?B?UVk4WURacVFVd3MwRXUvZ2orQTVub25uc0NUWVJ3YTFVUVlrYk9wZG1tSXRI?=
 =?utf-8?B?KzBySDFlV0I3d1dhd1RtbFdoZ0RUZU5sNjRYS0RFYnZrUGt1UFk5MjFDTmRC?=
 =?utf-8?B?TEJ0UmlvMkplY0V2YlQ1K2FDWnAxQ1dvVlh0SHU2NkpEUzU4ZWlXS3JNUHJQ?=
 =?utf-8?B?ZzRadkNtbEZrNTg4MTU5Ris3Q1ZaMGhiRFpvL1lneWoyN0FBYzZDTVRYaDZO?=
 =?utf-8?B?aGNoemFCMWo0V0pMT0U1YndsK0VRRm45Q3hnTTVnM2hRZXhzQkhsR29TS1RT?=
 =?utf-8?B?OWtQRVkyZ3duOG95QmN3N1ZKbURzeVZmaVozcE52bHpaR3NTR2k1OXdFVXEw?=
 =?utf-8?B?WG1udWhoOGQ0d1Fua3g2UWc1bVZzSnEvTHJ4cWh1ZDdUU05SbmwwY01mazFY?=
 =?utf-8?B?S0VPaXVZNXIyVFZGQm4yVWU4eXpaSmZtcE5VT1lSNEdqMVp0SU1seE9sd08r?=
 =?utf-8?B?S1ZlYmVCTXQxdXlHQXA0OU1CaEpMTEwxdzdMbHZGcC8zM3FsVkxzeTRnemtK?=
 =?utf-8?B?SDdOSjM1ZWZST2J5VFJxS0YzVkZ5aFFvdVlkaHVLNW1GVGhJTGd6ZVY5clF2?=
 =?utf-8?B?aGN3UTNQTEZqOWdDaktwSFhBZ1VoRWd3WDdJc0xvcjlKd0M5L0JqWlBHbjV0?=
 =?utf-8?B?M3pvT2hPdnNIeXRHV08vMlZhT1lrMlZsSFo3WEJtSUVaOG1RbTlYMTEreElq?=
 =?utf-8?B?dFhsWXV4R1MyOEVwa0J0MlBFYWVPSk5zcTM2VnBiS2t2L1R6ZUFRRmhZODBT?=
 =?utf-8?B?RmtPc1hRSXByVDlJUlhQYllaRUErcFloVUp0dVltblQ3ZGtlVFQ4ejlySXFw?=
 =?utf-8?B?RiswZmtoRDI2OGRqSkozaUxiRFdpUlNKNmVqc09zQ0FoSUtUNWRvcSswNjNz?=
 =?utf-8?B?YS9LUVpoc3oxMUpETXVYVEZhNU5iVWpKMWhRZytUTnpxVXhoVWFGcFd2ZmhK?=
 =?utf-8?B?WGdrUW1qTHpjc042NzRBdndvN1BMQWhrRlJ4U3FyUU14REVHTHg5ZnhQejFv?=
 =?utf-8?B?RG5SWVRWVk5HTnlQREhUM3hjb2RRSXVtaWpaYUVITDJCMzdMK1drWGNwSXRj?=
 =?utf-8?B?cW5YS0pZb01EYjc0WUdnQm5uQ24rTEc2OFJTckRhdU9nd1g3YUFyRkg0SG9r?=
 =?utf-8?B?SkRKb0JaSHBuc09ZcFpuUEpxalBwVGxYcUkvS04yKzdYWW1SMXorSzJveDR0?=
 =?utf-8?B?K3BPWWNrdHVVWlpUMGNyT3BFdXFMYmtDVENRdUdXZEdvajFlVy8vYjR4N3N0?=
 =?utf-8?B?TXFlVVBOZ1JRRDJjOUtvcTNpTXJTb1BQaFhWNW1VRDVsNFZjL3preFYrOWpU?=
 =?utf-8?B?TXZxZ1A1MWtpb2JhczF3ZnF2TGZiUEIvNkdvOFNNNVNZd3lrbnhqdWMzbXVj?=
 =?utf-8?B?NmgzckxTb1ZZUTYvTjNpTzQzcW10SEJUcjRnQmI2QXp4dStvVjRDWFV5azJa?=
 =?utf-8?B?RmhnL1R2U3NXUG1uenh2dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0l6NHpTOFRIcVJLYUxmVW1URDRocFdWRnB4djRqaEdCRGFaZ3JPMGpCYTRX?=
 =?utf-8?B?Y1BPSDBzMSthYms4MldiOVhBTFNYUWNyQklWekZTakRXNDBOSHBLRlhvUGVt?=
 =?utf-8?B?L2VqVVF6dDgxOUpqNTNnV0pqZWVNUUlydVppVEg0Mi9NL210Q0hXTVBHbXdn?=
 =?utf-8?B?eG8xcTRJd0p2c21QWTRtckNUcEUyYnFUck42Uy9JbGxqdHNNM3llbDN2Vk15?=
 =?utf-8?B?d2M3WFVqRHFRc2l5OVJHcy9xdndaUUVTY3R3ZW9XbXp6aGlYamY2MVNFb2ht?=
 =?utf-8?B?M3hBYlVKVTFaYkh6R0lIdWJkS2QyeXYyc0dUR1ZST3dxeEdrZlRWWGh0KzAz?=
 =?utf-8?B?b0Q0ZGNTVGovVDhHUDVFRXVqakRSYkU2QkFiYVJZbTVsYlhYMDdpRU9mRGRL?=
 =?utf-8?B?SEVWVHJ6QW40ZnpURTZ2OUtCYzhUYnhQSjVZeDRZbmViTjY0MDRqWkx0OHlW?=
 =?utf-8?B?TjQ3MzdJOUZ3aktYUENDL2pVY1ZqckhYUlk3Wk01a1Iwd0tER1dMdmY2YTMr?=
 =?utf-8?B?L1duWS9SY3A4ZVlrWkxCaGlidWxCVDNhbHRBN0Rib0xYNVVkWUZZMW04STMz?=
 =?utf-8?B?MThYODNuNTBBTXhMa2N5NktYdmoreUtjdmdWdkJvTEdlSTZPOVE5aExWaVYx?=
 =?utf-8?B?cm9QUVFybElwRUMrb29jaFVxTjJaajRPUFZhdzZjTWZhL3N3SVV0R0t4YWI1?=
 =?utf-8?B?d1YyUEFKaE5BN2tMaytLVG96QVpFZU5PY0pvTXR0ekV3UWtRTmpLMlVQRWFY?=
 =?utf-8?B?b2NhQzNmS0YzQU5YNU92eEFUREVTaUlMcjVzS3Z6N3RxRFpnQ052ek90MEN4?=
 =?utf-8?B?Kzc3L216U25sODdtM1IrNUVRd3E5SHFURUN4dlJZVU1PaVNuWmZpN3ZtV1ph?=
 =?utf-8?B?cDN1Wk85OWpFNEZ1NVVsOUxhL0cwcnM2Y2d6Q3lnbjA1a05RY3hyNnBDT0R2?=
 =?utf-8?B?SWEyYWV0UUswWTQvb0twZGRoZDdtZGUyR3doczlhK0lheXdkWFVYZmlhMTVP?=
 =?utf-8?B?ejM3S1N5NDM5czBmNjZ0MDZ6NVMvTjV2ZWs2YlV0MEZFMzgwd1VQb2pNOGFn?=
 =?utf-8?B?emRpVGF1UGV3NG5mZXNPQko2WDVxcWh5ci9HQWtGT083RTc0QTk2WkY4cW1B?=
 =?utf-8?B?b3N4YzNXVzB2T2hxNWx5d0NOaVJWNC9MczhqekZRcFhMa1ZUaEhyUnRxUTFx?=
 =?utf-8?B?S1Q4RjNqNEh0UVhZL0lmSlB6SGZxOVdET2lQd3pXQ1pERWVFVjVpWTRVNndR?=
 =?utf-8?B?MTBROCtJa3FXZEZQTVNrZmtUS2lGSCtpZWpkOVh3aEIveDNLa3J3UU1rSDVL?=
 =?utf-8?B?TkhROGZvYjU3NUU4ZTk1alQ3d3JRdkFRcytHUGhLd3NhQ2VIYzd1TTFORVR4?=
 =?utf-8?B?ZmRXK3N5WjFTN2VPYmlOVms2dUVDalgxeUt5b010OHdURDE0NzJSVEFsNkhK?=
 =?utf-8?B?MVhnRHNsV3lQRXlheHcveVNrZ2x3RE1IdW90N2dCclY4Ny81VkFLMTI4UXpJ?=
 =?utf-8?B?Q3BpenpiUEdHZXl2a3RLZ2hZUGxXZ0Y3T28yOFFyVTZWQzFqVUltK002Uk9Z?=
 =?utf-8?B?VkNzbitHS0dOSWUvcXEyeFM0N29Nd2E0Y3E4YWNrUTBLZitXRVNiY0tEU2Jx?=
 =?utf-8?B?Zi9sUDZZOFBNMWRMOFdxUjgxQklmRmJhMSs5K2czZURSWjRzRUVoQ3QrRGRm?=
 =?utf-8?B?MFU4SGNTUjhIQWx0ZWFxR0xkWDBId0FlT3Z2OEhERWFiejZUOXNyQmV1dkJF?=
 =?utf-8?B?OHNzbFF1SVlEcjE4akM1RVVsOFlZdDNoMXJsUkgrTi9ZSlgvTU92L1IrbjRP?=
 =?utf-8?B?U0xiK1VNNlQ5Zlp5cTBoRzV0YzNIY1owU0cvdFRyN0UyVmxQcUg2Wk0rU1NG?=
 =?utf-8?B?cmpXQWZ1Smk4OUdjakNBRmErNkJ3bmRZaWMyYktTbm9aOHdYZWdNVVcvTzlS?=
 =?utf-8?B?UkxlNDZZTlgzb3FnRTRWQW5PRnRwZ0pSR2VmZCthdXpSUS9oRng0bC9QeGRp?=
 =?utf-8?B?UHV5d2JPZTBGSTdNVzI0Q3ZtTXA5K2RiWGRkclhmRDlZNzRvQmtKN3E3eXFU?=
 =?utf-8?B?WUNWNU5jYkpLOEVMd1RpNk8rR1dCOFJ3SjVxRjlhQm80SE92bm81UG1wWjRF?=
 =?utf-8?Q?oqujT3kv8df6vjdyoP5gkbfuO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79492d1-6fff-49a0-11e2-08dcbb5f2547
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 06:14:10.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31Bb7aIrumNZnhAyg8YcqrpS4BwqBNZ7NYwA3l2kKKWri1Gzz2gqYb3uDoDoSxHHmIUrYES/uh1gG97mztNtXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9275

On 8/13/2024 1:50 PM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, August 13, 2024 11:15 AM
>>
>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
>>> Hi Lingshan, David,
>>>
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Thursday, August 1, 2024 5:05 PM
>>>>
>>>> This commit allows the driver to suspend the device by introducing a
>>>> new status bit SUSPEND in device_status.
>>>>
>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
>>>> indicating whether the device support SUSPEND.
>>>>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>> ---
>>>>  content.tex | 75 ++++++++++++++++++++++++++++++++++++++++++++++-
>> ----
>>>> --
>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>>>
>>>> Changes from V6:
>>>> - the device should hold its config interrupt while SUSPEND,  and
>>>> send config interrupt when the SUSPEND bit is cleared.
>>>> - while SUSPEND, the driver MUST NOT access Device Configuration
>>>> Space
>>>> - minor changes.
>>>>
>>>> Changes from V5:
>>>> - the device should present NEEDS_RESET if failed to suspend
>>>> - allow the driver access device status in the config space when
>>>>   suspended if it is implemented in config space.
>>>> - language improvements
>>>>
>>>> Changes from V4:
>>>> - re-order the device status bits section
>>>> - kick vqs --> notify vqs
>>>>
>>>> Changes from V3:
>>>> - allow the driver clearing the SUSPEND bit to resume the device.
>>>> - disallow access to config space while suspended.
>>>>
>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8 100644
>>>> --- a/content.tex
>>>> +++ b/content.tex
>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>>>    \end{note}
>>>>
>>>> -\item[FAILED (128)] Indicates that something went wrong in the
>>>> guest,
>>>> -  and it has given up on the device. This could be an internal
>>>> -  error, or the driver didn't like the device for some reason, or
>>>> -  even a fatal error during device operation.
>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
>>>> +to
>>>> +  drive the device.
>>>>
>>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all
>> the
>>>>    features it understands, and feature negotiation is complete.
>>>>
>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
>>>> to
>>>> -  drive the device.
>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates
>>>> +that the
>>>> +  device has been suspended by the driver.
>>>>
>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
>> experienced
>>>>    an error from which it can't recover.
>>>> +
>>>> +\item[FAILED (128)] Indicates that something went wrong in the
>>>> +guest,
>>>> +  and it has given up on the device. This could be an internal
>>>> +  error, or the driver didn't like the device for some reason, or
>>>> +  even a fatal error during device operation.
>>>>  \end{description}
>>>>
>>>>  The \field{device status} field starts out as 0, and is
>>>> reinitialized to 0 by @@ -
>>>> 60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
>>>> Facilities of a Virtio Dev  initialization sequence specified in
>>>> \ref{sec:General Initialization And Device Operation / Device
>> Initialization}.
>>>> -The driver MUST NOT clear a
>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>> +The driver MUST NOT clear a \field{device status} bit other than
>>>> +SUSPEND except when setting \field{device status} to 0 as a
>>>> +transport-specific way to initiate a reset. If the driver sets the
>>>> +FAILED bit,
>>>>  the driver MUST later reset the device before attempting to re-initialize.
>>>>
>>>>  The driver SHOULD NOT rely on completion of operations of a @@
>>>> -99,10
>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>>>> +Virtio Device
>>>> / Feature B  \begin{description}
>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device
>>>> type
>>>>
>>>> -\item[24 to 41] Feature bits reserved for extensions to the queue
>>>> and
>>>> +\item[24 to 42] Feature bits reserved for extensions to the queue
>>>> +and
>>>>    feature negotiation mechanisms
>>>>
>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for future
>>>> extensions.
>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for future
>>>> extensions.
>>>>  \end{description}
>>>>
>>>>  \begin{note}
>>>> @@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General
>>>> Initialization And Device Operation /
>>>>
>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset)
>>>> before removing exposed buffers.
>>>>
>>>> +\section{Device Suspend}\label{sec:General Initialization And Device
>>>> +Operation / Device Suspend}
>>>> +
>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the SUSPEND
>>>> +bit in \field{device status} to suspend a device, and can clear the
>>>> +SUSPEND bit to resume a suspended device.
>>>> +
>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>>>> +And Device Operation / Device Suspend}
>>>> +
>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>> +\begin{itemize}
>>>> +\item The driver MUST re-read \field{device status} to verify
>>>> +whether the
>>>> SUSPEND bit is set.
>>>> +\item The driver MUST NOT make any more buffers available to the
>> device.
>>>> +\item The driver MUST NOT access any virtqueues or send
>>>> +notifications for
>>>> any virtqueues.
>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>> +\end{itemize}
>>>> +
>> Hi Parva
>>> Do we agree that
>>> a. suspending a device is non frequent operation (in order of N
>> operations/sec, where N is roughly in range of 10 or 100) per device?
>> Ideally it should not be often in normal operations, but remember we can
>> not restrict the behaviors of the driver, so we must be able to handle the
>> scenario in which SUSPENDING is often.
> Sure. the intent is slow rate, but one can do at unexpected times.
> Do you agree?
I think we don't have an intention of the frequency in the spec.
The spec only provides generic mechanisms and interfaces.
Don't assume it(or driver wants it to be) would be often or not, that depends on the driver.
>
>>> b. A software-based device may not always want to force VM_EXIT on read
>> and write on the device_status register?
>> Trap and Emulation is the basic of virtualization, and how to pass-through a
>> device is out of this spec.
>>
> Sure, I didn’t suggest to put such things in the spec.
> My question is, whether to trap and emulate or not is a choice of the software.
> Do you agree?
The device emulator does not know anything about whether trapped or not.
Trapping and Emulation is a hypervisor thing.

If here "software" refers to the device emulator, then Yes, it is not the
emulator's decision. And the device should not be aware of VM_EXIT & VM_ENTRY.

this is out of the spec anyway.

Thanks
Zhu Lingshan
>
>  
>> Thanks
>> Zhu Lingshan
>>>
>>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>>>> +And Device Operation / Device Suspend}
>>>> +
>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +The device MUST ignore all access to its Configuration Space while
>>>> +suspended, except for \field{device status} if it is part of the
>>>> +Configuration
>>>> Space.
>>>> +
>>>> +A device MUST NOT send any notifications for any virtqeuues, access
>>>> +any virtqueues, or modify any fields in its Configuration Space
>>>> +while suspended.
>>>> +
>>>> +If changes occur in the Configuration Space while the SUSPEND bit is
>>>> +set, the device MUST NOT send any configuration change notifications.
>>>> +Instead, the device MUST send the notification after the SUSPEND bit
>>>> +has
>>>> been cleared.
>>>> +
>>>> +When the driver sets SUSPEND, the device MUST either suspend itself
>>>> +or set
>>>> DEVICE_NEEDS_RESET if failed to suspend.
>>>> +
>>>> +If SUSPEND is set in \field{device status}, when the driver clears
>>>> +SUSPEND, the device MUST either resume normal operation or set
>>>> DEVICE_NEEDS_RESET.
>>>> +
>>>> +When the driver sets SUSPEND,
>>>> +the device SHOULD perform the following actions before presenting
>>>> +that
>>>> the SUSPEND bit is set to 1 in the \field{device status}:
>>>> +
>>>> +\begin{itemize}
>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>> +until all buffers that are being processed have been used.
>>>> +\item Send used buffer notifications to the driver.
>>>> +\end{itemize}
>>>> +
>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>>> Options}
>>>>
>>>>  Virtio can use various different buses, thus the standard is split
>>>> @@ -872,6
>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
>>>> Bits}
>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature
>>>> Bits} for
>>>>  	handling features reserved for future use.
>>>>
>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>>>> +   trigger suspending the device via the SUSPEND flag
>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>> +
>>>>  \end{description}
>>>>
>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>>>> Bits}
>>>> --
>>>> 2.45.2
>>>>

