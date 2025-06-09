Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F23234
	for <virtio-comment@lists.linux.dev>; Mon,  9 Jun 2025 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456046; cv=fail; b=rvz6K/0xgMc6HasL0WHCYORbxNNreFjJ6VV6pK3N9jzzDw1e1ao4SZpRjwXD36FODF24VpymmT0n5vLEqjnZlLE155JTgV5XH/DWNQ0ZC28pb9yQ8+iP/hk918ljt2E1x0CvqLgKgpa6rZX6vBujzpSVXPfDVaUK3miNIDZNdlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456046; c=relaxed/simple;
	bh=yOroUHfwHeR2RmquEv/fin8hPIxRE1NjDLp8dXOLFc0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rNGx6+nt5k24tA2Bn58pbFngqFHaZbqAI5OrBCofp3ViWkzIAqUQFKkvCskR0OfEmutdIGbAbhbvqTDfcCzqkcC6uo1nu2NzD7DgF2QILiA44PCH3kojZFQkPZ2LsEe2i8MH/sWVKK1DtV6dLqYVuB395+WZV6UVwDyI0KeM574=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vr2ylkPH; arc=fail smtp.client-ip=40.107.94.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vr2ylkPH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAru4mT/qDT9qX8L17vzX94U5WqJetF+zcfrSuRh0nSCwxT6bWdVq5sk4QgIht61CaYPDG/V+gnvSyYsAFxxCfo2L5f4iec1J1YmyCQ7ElcBSfruOuieNtgzbjGljCNG6A1ZT8Ujqzl8bwbBiopZMJTXPCd+Kpa+0vJaEejSVEJqb0GtuUvyj/OSSLYYPTg8/8v11lWMRKxgE0EjEOtol9eZDH9BnooFZOpov5ZJfT9YouJQzY8or1TnoB7Wf7SrcaLh9IVwdX0mIDWg1u2F6bZ/9deIMxd8XghVAscZSUZSkzrqRExaFNZL2almyrtEe8lNXEJtQKqXU9Mc2qpYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PneH0PTevQj9lT/S0bIXAFZtFKYOvnjUhG0AftP68Z8=;
 b=E1u6LemeL9QtpAc0+J/sdNhEipu38Vo2KktAwnCv0InkGNe9jpMbG/QijXHkuTkHBURiXIuN2kmNoPsMesHCmJi+j+vKccFm3W3Th2vR95xuV27scwf6iXrBV1iJHHj/Xu9col4gnFHwJ4oOvD9UGLa+7dCCG41OqJR9mJvKMhR+Zy1tydL25WlykNQbcRVoCz8K0DTsSmOTf/CHeYzQwoCW+mq4E0Ko9xTc/Vbx8DWfvFZ25oOxVck9V9sMQ6VhBEdeNG9BgGLXQmy5Y6s5V96MT7xDqbxsSb/VwbMPJ7brnGAUGzvoB+rIIjj8+tq3NPKTZwXmvZXhTnkQwMDBog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PneH0PTevQj9lT/S0bIXAFZtFKYOvnjUhG0AftP68Z8=;
 b=Vr2ylkPHQaal6aGLNUEQ2cPnbLAx3VJNCBy7TJxqB7a28yKtR6oy4hc/2i0mvEFztFU/SIiT4sUXgsLVzyW+kwP5+SwULbMagXWfdgSotbduD1fHyLj+f3LsWaTDbazhIHZqqEOvCBHF/CKJdwGTjJ7wFxDn6k0MIAnc9CQ6Ohk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH7PR12MB7817.namprd12.prod.outlook.com (2603:10b6:510:279::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 9 Jun
 2025 08:00:41 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8792.035; Mon, 9 Jun 2025
 08:00:41 +0000
Message-ID: <3b27c481-45b6-49de-a660-ea79063cc9d7@amd.com>
Date: Mon, 9 Jun 2025 16:00:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
 <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <45bd7572-9672-49ad-b09e-f57ed6d5480b@amd.com>
 <CY8PR12MB71950056CD7393AADA44EFCBDC69A@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CY8PR12MB71950056CD7393AADA44EFCBDC69A@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH7PR12MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: f095d765-1f1c-4e97-cc5b-08dda72bba86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3pua25vMTNUdkdBY2pwT1o0bU8yd2FGMEpMY2c4OGZ2V0hXM3FSMytyakZn?=
 =?utf-8?B?d0lyMnFMcHdsOEpaMHZBSU83KzlRaHlPd2lrRkZma2EvbHlxd0dHTlhxdmp3?=
 =?utf-8?B?dzFlMmtJVi9WSVJXMlNxZU9JZU1oY0VhY2NhL2FucEU1Y3FCN3h6VVk4d3hH?=
 =?utf-8?B?Y0IvNmJkdGJhcWZ3bEZaK3RjY0FMN1JFaDlTeWgwRUtJU2JSdlZEZmxjMWRV?=
 =?utf-8?B?K012TGlKdHkzUmxoWG55WUlRSncwa0lLMUU0MnZIVk43L0lZZ1hIeVdOa1Fs?=
 =?utf-8?B?eUpmWllaK0I2OEw4Z1dlVUJVdUY4eTNMMnlXSGo2dlNCTWNwNGZFRFAyMXd5?=
 =?utf-8?B?M29CUy9BZnhBd3FjcC9jbWxKMFk3MjgxNGprWklKZjJ5bXNVRTJZQUZuOVBN?=
 =?utf-8?B?eXFoV0FrbVFtQ3RWS09vU0ZtZGpMczlyTDJVdStGK1lhZmZKNC9EdDNGOW5M?=
 =?utf-8?B?V3ZIN0Y5TmUyYjZLQ3RmLzRLTVhSaiszNEhUY2RPRzF0VUVFVGJ1SXJ3ZnZY?=
 =?utf-8?B?ZzBWZTh0UitMVnB6NHpKK0NmK3VNZ203azJ4Z3VxNy9Zdlgrd0hnMEdzaVZ6?=
 =?utf-8?B?emVObVE2MXZsZTNwc01EeDdHZ0lXSXlGK3dqbDVFKytCVWROdldqV0V0Y1NG?=
 =?utf-8?B?YVFWSjJoUGh5NGFXSVRYa3oxN2Q2SVBNN2lFWFdpTE5UeDI1aEVra2tmKytq?=
 =?utf-8?B?YUJ2ZDBFeSt5RFhMekhFQnBERGg2MHF6Y3ViTFJ2L3JuMHVlc3dGbEV1UUFq?=
 =?utf-8?B?Rk1RVGM5RW5YbmxEbnRBcWErcHZCLzdwNGdOM2FFRzBCa2NhVjBUOE5pK1pS?=
 =?utf-8?B?VjliUkg5VUtaaDBwVjdxN0kvUk44bThUWmVoMFFtOXlFelRHYjkwdVJ2eEls?=
 =?utf-8?B?ZllZRXFhcy9RenEvaVRJUzQxZmFsMEt4dGRqNndVUkF4Z0JtdTlobW45Qith?=
 =?utf-8?B?YW8yUmxTQlpJNDVTaXo5em5DMXROR0ZkWXNENFFLSzNSWkUrMmxGTDV3YUdm?=
 =?utf-8?B?U0trWHJLcFkvRVU3VGRjNTVRZUhRYzgrRWdRS0NaNDgvalpxZWdHeDl6R2VZ?=
 =?utf-8?B?V1BzZzBsY2dDRlFGU2IvdWxsZmY3RWJLY1cwZVNFdXdSYk5hZ29vRVlpOHJE?=
 =?utf-8?B?SWY1dXVDSExWWk9WYlM0bGhCZ3IrKzliN2xMaWtvVzV2c240blptUWNwUHhM?=
 =?utf-8?B?bU9oRmIzanZXQ21OZDVXTVEwRVBLWkc1dWlYKzNEclROVG9waGNiRFkrMkVk?=
 =?utf-8?B?YUJGTDhPWVZzUmFYOGdva3RNUkhid3dGR2dEMGIwV3BSdDZRbytpbUlJc3JD?=
 =?utf-8?B?ZGhNSFBuQUZqNys5ZkxzZStQeXJkdE1uR0ZXVTB5N1QwQllEMzJ0NG5sNG9T?=
 =?utf-8?B?ZWVDVmVaRE8zbDBQUkRIQ05kSk1mOCtNUC83R2ZOQzN0c21FNVdnc0dyOFFS?=
 =?utf-8?B?OWpSNlZaUGExa2ZjN2xJNzNISnBNNEFIcnVQakMvSmxxOUhyUFdjRDVrWTdJ?=
 =?utf-8?B?NGRBVDVYYS9pR1daK243eklzd0lSLzQ3UStGNmdsb1p5SnpUS3JReGhDNDIr?=
 =?utf-8?B?SUgxZW1FY1UvTGtNcE5Sd2FRbkFKdTVKZjk3ZEV3bi9MM2o3TXRhTmIvSlF4?=
 =?utf-8?B?OW9wOFN4MG1TMC9uSEpNQUpoQS92MUx1UGZKNjAzMldhck5aMnBtem94Uyta?=
 =?utf-8?B?VUxHdEFvbEFkU21uZmtZM0dBblNhUkRKS0pmMndLQm1sQWZOUG5kM3RTWTdM?=
 =?utf-8?B?MDJEZVdTaVVNVDlqWUJDMWoya2pJNThKZ1p1SUZySlM4RXpaRzF1ay85UUJj?=
 =?utf-8?Q?tzCwS1QzZ4YzhkVgWNWikNYEM5yGdmKYl5edU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clIzc2lOSTF1ZFY1UWhEOVA3MkFVN2VnT2NwVkJLUUwzYisyMmVSVU5FdlBy?=
 =?utf-8?B?dFdqeGd6T2lXbGNEd0hvRlNiR0NzN2dHSWYyeU96VGJYY2NSNFJHVzZxSS81?=
 =?utf-8?B?dnFUbWl5cFd0a0IrMFBmeG5xdGNBeC82cXdxU240MzF4TTFkaTI1M2NxWDlv?=
 =?utf-8?B?Vmp6bWNzUmdRdXQrZkNBM09La1ZIMGM3eU1hSCtUdjBFTWlRbW53aHZiekZI?=
 =?utf-8?B?dGVaMFJwcUpENHoxRVVzanpKZXZVMWFDcDJFY1QzNTY2L3ovVndOK2g1Tzlz?=
 =?utf-8?B?ZW5TaUh6eWRCSkRueThoOUxTSFpEb2FKZzhDamlCR0V5bzIwd1pHdDFpMlh5?=
 =?utf-8?B?MmxaNEwwRHZQS08zeHF2aGtNQjZTTFFmMXhudU1pbERDZkhyV0sxQ1BZZFN0?=
 =?utf-8?B?eURVWHFPUU0zQWRtZWNGK1F5cmxGT2VhWjFtZFJkNVJOZ0YwcVkySWluZnFX?=
 =?utf-8?B?a2QxN2lUZ1Jpc01DNEZUUHVGRXcvZTcvQlJ5amw4OHpzcDBLTDd2UUdHdUps?=
 =?utf-8?B?MXN4QVF2cVVNOUJEREhnSW9QaDFkeit3OU1WT2N1NmFVZzNJbVc3SEVxRk8v?=
 =?utf-8?B?MEhyWUlhN0t4QS9TTTNxUmFzTFFWczE0a3kyWFJNNGMyQnlnT3lKZ3JOUEYy?=
 =?utf-8?B?M0xlbXRHdmxTcCs0SGR2VXdXL1BaYkkvL0NvZnVwWTJsZGlYSm0wN0p2M0Mv?=
 =?utf-8?B?QS9hbm9FLzdUdVplRUZGSCs2bEhOV0NBWXZCRHcvMm1vaDREY0tnSnpac0Nm?=
 =?utf-8?B?VmdrTFRvQzdXbXErZ3hiMVZpYUNnWFlaVUNyaVZScnEyWXBwdTNUVmlUQnRn?=
 =?utf-8?B?RmZUNzRUOWlqbWZqd3ZRbzFxMWFNb3VraDQ2UmUxZlhRSEdGVmpTWmRRZXg2?=
 =?utf-8?B?a0EvL1F6YzRmVVBmbXJaeHdRb09DRHNLUXJ1U1hBT05ySGloM0haMS9aMlNG?=
 =?utf-8?B?cHpkMi93eEV4Z2VqRmowV2UxdC9PaWJNQ3U2bUZVanlQcUh3OVhwNXY3bnJW?=
 =?utf-8?B?d1VXcHY1QTMvTDNTd1JGM0NhQjBLZHFtN1ZONEdVeVdHSTJTWXhySmU5bFZh?=
 =?utf-8?B?dTV1Vks5NEdYUVlndTVYMnpMeU5Eb1lRbUE5R3Y4Z1FJOVE4VndGdW0vRnpN?=
 =?utf-8?B?K0x1dzlidXBpUmhiaUxsY1NNbXBadWQ2Q1VBMVlJakU0YVJyMHowQUY1R1NK?=
 =?utf-8?B?NTQ4dFFZS1dpNG05MmtBcms4SHF4UmZaSTAvZ3pjWm1YSUw2K0FwS3Bwbm5o?=
 =?utf-8?B?czYwd0IyR1ZpYjBOWkp0RThmZk82RHNWLzlTaXVyY2l5VDlQcEJFRkdBblZM?=
 =?utf-8?B?WUxzWGQzQkZ4MjZ6dHYyci9lcEFwUUdUYjZrWEpoRjF3UDVvUXJDTVhCN0lC?=
 =?utf-8?B?VzRBVHZRK0kxUVhpVjFXQzJHYkkrc1NyeVpLVVRzak84YVBFWEx4c2xtQXRr?=
 =?utf-8?B?UmtEK0xhQUQ2cGZBTFZFdVlWZDVJT0RqQXp3ZmRzKzVESW02NUFmcGxkUXBD?=
 =?utf-8?B?NGxtMGVvQWtWcG9hcjVZTUx6blFBTmQxZHl2dlVMQjMxd0pRMDlpd0xGcW81?=
 =?utf-8?B?cmJUUFlzWVpxSzIzU256eHVhN0xmbnp3MHBEWk1hUDQ2OGV5cTllUHlzayt1?=
 =?utf-8?B?bi8vcVFjNktzcjQrV0ZZbE02UWlYdmEvWFNVOWtaS2xOQjc4VTBGUnV3TmFW?=
 =?utf-8?B?RXZHQmJVdkxXSkhWMXA5elZJWjBMTmxGTDREd1RFN2lyN3hTcGttU1BFbDZX?=
 =?utf-8?B?M3JteEpUYjA1YXY0blRLaVY4MlROSy8vMTBNdmZpdGM3bGYxbElRb2FxUjFN?=
 =?utf-8?B?VWFSdzZHQU5sR3loU3BqOTVGckRLSWZTUmNKbS9wbVBEMzVzTEFMREI5TXdN?=
 =?utf-8?B?bDdRRkxPOXZaRlhucHNNVENXamhON0FMcmtYVE9nSTNrdCtuL2hsdlpGd1M5?=
 =?utf-8?B?NFN2Rk9xZ1FDTEs0UGJqVnd2MEdSVDNYbEtIWkw4YVJmWE1EK051TDJhQ05M?=
 =?utf-8?B?YmY0M0RGblJadVNpQnJtVVk5VlpTUllxYVdKbGZZSFNYendrNlhYQ3YxSFk5?=
 =?utf-8?B?RW54Vlc2U0dVRnRhOWEveFZnSjBFS2dBRE11NGd5UEs4ZnprV3lraUcxWVpa?=
 =?utf-8?Q?THAVByc0YfRC6+mGLP/a6CZI5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f095d765-1f1c-4e97-cc5b-08dda72bba86
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:00:41.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPWsqgm6nLmtgU/B4vMmLHxwbXz7Z1euO+0VIwAWr5cGGGuRYuFuN9rz/EspRTfwauzx9q/tGuyf8aNs1YbKYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7817

On 6/7/2025 10:11 AM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Friday, June 6, 2025 4:01 PM
>>
>> On 6/6/2025 1:52 PM, Parav Pandit wrote:
>>> Hi,
>>>
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Thursday, May 29, 2025 1:54 PM
>>>>
>>>> This commit allows the driver to suspend the device through a new
>>>> device status bit SUSPEND and resume the device running by re-setting
>>>> DRIVER_OK bit in device status.
>>>>
>>>> This commit re-orders the device status bits.
>>>>
>>> I overall like this proposal. Few small comments to fix more below.
>>> It is lot cleaner as it eliminates the previous bit flipping complexities.
>>>
>>> Can you please add one or two line on a use case/motivation,
>>>
>>> For example,
>>>
>>> Presently when an OS is suspended, the driver must fully stop and reset the
>> device, and on resume the driver must re-initialize the device.
>>> This can be time consuming task to recreate large number of VQs.
>>>
>>> Instead, extend the specification to allow drivers to suspend and resume
>> the device, without recreating all the resources.
>>> ...
>> Hello Parav
>>
>> Here I think the spec provides mechanisms, not a policy. The user may
>> employ this feature for other tasks other than live migration which requires
>> OS suspending.
>>
> Its not about some policy.
> Sure user may use the feature in N different use cases.
>
> The intent is very simple. For the reviewers to review the patch, why something is needed should be presented.
> So motivation/usecase/need is worth the entry.
> Some reviewers do rely on the commit logs to understand the design intent behind it.
>
> Without the need of the patch, I am not sure why would even one write and review the spec patch.
> Please add known use cases. I am familiar with one that I suggested above.

we can add these descriptions in the cover letter.

>  
>>>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>> ---
>>>>  content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-
>> ----
>>>> --
>>>>  1 file changed, 65 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/content.tex b/content.tex index d3fc6a4..caef5d0 100644
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
>>>> +
>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates
>>>> +that the
>>>> +  device has been suspended by the driver.
>>>>
>>>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all
>> the
>>>>    features it understands, and feature negotiation is complete.
>>>>
>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
>>>> to
>>>> -  drive the device.
>>>> -
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
>>> A new bit SUSPEND introduction should be done at the end without re-
>> organizing rest of the bits.
>>> Please add at the end.
>>>
>>> Is the intention to rearrange the fields in ascending order of the bit
>> number?
>>> If yes, its good change too but than it missed re-arranging FEATURE_OK.
>> oh yes, good catch, will fix
>>
>>> If you want to re-arrange, please have the pre-patch in this series.
>>>
>>> Either way is ok to me,
>>> 1. Either as pre-patch for re-arrangement + addition of SUSPEND in middle.
>>> Or
>>> 2. adding SUSPEND bit definition at the end
>>>
>>> #1 is better to see in ascending order.
>> I was required to re-arrange these status bits, but this is a trivial change, so
>> lets keep them in a single patch for easier review
> Having logically separate patches are always good. Re-arrangement is pure cosmetic vs this one that adds new functionality.

ok, we can split this patch into a series if this is preferred.

>
>>>>  The \field{device status} field starts out as 0, and is
>>>> reinitialized to 0 by @@ -
>>>> 99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of
>>>> a Virtio Device / Feature B  \begin{description}
>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device
>>>> type
>>>>
>>>> -\item[24 to 41] Feature bits reserved for extensions to the queue
>>>> and
>>>> +\item[24 to 43] Feature bits reserved for extensions to the queue
>>>> +and
>>>>    feature negotiation mechanisms, see \ref{sec:Reserved Feature
>>>> Bits}
>>>>
>>> Only one feature bit is used by this proposal.
>>> So it should be 24 to 42 and use bit 42.
>>>
>>> Did you use bit 43 due to existence of VIRTIO_NET_F_GUEST_RSC6?
>> Yes, bit 42 is taken for VIRTIO_NET_F_GUEST_RSC6.
> So the current spec wordings  is incorrect 0 to 23, and 50 to 127 Feature bits for the specific device type

current spec missed documenting bit 42.

>
> We need to says,
>
> 0 to 23, 41 to 42 and 50 to 127 Feature bits for the specific device type
> This should also be pre-patch, so that it can be backported to master branch.
> Another reason for the small patch to be separate.
>
> If you want me to write up this pre-patch, please let me know.
> You can include in the series.

There could a a separate patch in a series says:
41 to 42 Feature bits reserved for extensions to the queue and feature negotiation mechanisms
43 to 49, and 128 and above Feature bits reserved for future extensions. 

which fixes commit 9438414 

>
>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for future
>>>> extensions.
>>>> +\item[44 to 49, and 128 and above] Feature bits reserved for future
>>>> extensions.
>>>>  \end{description}
>>>>
>>>>  \begin{note}
>>>> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>>>> Initialization And Device Operation /
>>>>
>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset)
>>>> before removing exposed buffers.
>>>>
>>>> +\section{Device Suspend}\label{sec:General Initialization And Device
>>>> +Operation / Device Suspend}
>>>> +
>>>> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend
>>>> +the
>>>> device by setting the SUSPEND bit in \field{device status} to 1, and
>>>> the device SHOULD set the DRIVER_OK bit to 0 once it has been
>> suspended.
>>>> +
>>> This is not a normative section so please avoid using SHOULD.
>>> Better to word it as informative theory of operation text.
>>> Such as,
>> why "SHOULD" can only be used in normative sections?
>>
> Because:
>
> 1. To clarify the intent:
> These keywords carry precise semantic weight. When a spec says MUST, it means compliance is not optional. Using such terms in general or explanatory text risks misinterpreting guidance as a requirement.
>
> 2. Avoiding Ambiguity:
> If normative language is used in non-normative (informative) sections, it becomes unclear whether the reader is required to follow it or if it's just background or suggestion.
>
> 3. Informative sections explain context, rationale, or examples. Normative sections define rules. Mixing the two muddies the structure and weakens the authority of the normative part.

There are no such rules.

In the spec section 1.3 Terminology, it says:

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “NOT RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC2119] and [RFC8174] when, and only when, they appear in all capitals, as shown here. 

RFC 2119 says:

SHOULD This word, or the adjective "RECOMMENDED", mean that there
   may exist valid reasons in particular circumstances to ignore a
   particular item, but the full implications must be understood and
   carefully weighed before choosing a different course.


Here this "SHOULD" exactly conforms to the definition.

"SHOULD" has already been used in non-normative sections, for example:
2.5.4 Legacy Interfaces: when using the legacy interface, drivers SHOULD read these fields multiple times until two reads generate a consistent result. 

The spec does not say: “SHOULD” can only be used in driver or device requirements section.

>
>>> If X is not negotiated, the....
>>> And the device sets the DRIVER_OK bit to 0 once it has been suspend.
>>>
>>>> +If the device has been suspended, the driver can resume the device
>>>> +running
>>>> by setting the DRIVER_OK bit in \field{device status} to 1, and the
>>>> device should set the SUSPEND bit to 0 once it resumes running.
>>>> +
>>> The device sets the SUSPEND bit to 0 once the device is running.
>> What is the difference in semantic?
>>
> "resumes running" does not read correct.
> And normative "should" is used...
> Hence the suggestion to re-word it.

Looking into a dictionary https://www.merriam-webster.com/dictionary/resume
There is quite a lot of examples of resume + noun.

And here, "SHOULD" still conforms to RFC 2119.

>
>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization
>>>> +And Device Operation / Device Suspend}
>>>> +
>>>> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +Once the driver sets SUSPEND bit in \field{device status} to 1:
>>>> +\begin{itemize}
>>>> +\item The driver MUST verify whether the device has been suspended
>>>> +by
>>>> re-reading \field{device status}, examining whether the SUSPEND bit
>>>> is set to
>>>> 1 and the DRIVER_OK bit is set to 0.
>>>> +\item The driver MUST NOT make any more buffers available to the
>> device.
>>>> +\item The driver MUST NOT send notifications for any virtqueues.
>>>> +\item The driver MUST NOT make any changes to Device Configuration
>>>> Space except for \field{device status} if it is part of the Configuration
>> Space.
>>>> +\end{itemize}
>>>> +
>>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization
>>>> +And Device Operation / Device Suspend}
>>>> +
>>>> +The device MUST ignore any operations on the SUSPEND bit from the
>>>> +driver if the device has not been completely initialized by the
>>>> +procedures in \ref{sec:General Initialization And Device Operation /
>>>> +Device Initialization}
>>>> +
>>>> +The device SHOULD ignore any write access to its Configuration Space
>>>> +while suspended, except for \field{device status} if it is part of
>>>> +the
>>>> Configuration Space.
>>>> +
>>>> +A device MUST NOT send any notifications for any virtqueues, access
>>>> +any virtqueues, or modify any fields in its Configuration Space
>>>> +while suspended.
>>>> +
>>>> +If changes occur in the Configuration Space during suspended period,
>>>> +the device MUST NOT send any configuration change notifications.
>>>> +Instead, the device MUST send the notification when it resumes running.
>>>> +
>>>> +If the driver sets the SUSPEND bit in \field{device status} to 1,
>>>> +the device MUST either suspend itself or set the DEVICE_NEEDS_RESET
>>>> +bit in
>>>> \field{device status} to 1 when it fails to suspend.
>>>> +
>>> Even though you have the driver normative, it is good to have device
>> normative for suspend and resume operation:
>>> Something like,
>>>
>>> When the suspend operation completes in the device, the device MUST
>>> set SUSPEND bit to 1 and DRIVERK_OK to 0.
>>>
>>> When the suspended device is resumed, the device MUST set SUSPEND bit
>> to 0 and DRIVER_OK to 1.
>>
>> I think we already have similar descriptions in the beginning of this section
>>
> I didn't find it in the normative device section.

+\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device SHOULD set the DRIVER_OK b
it to 0 once it has been suspended.
+
+If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device SHOULD set the SUSPEND bit to 0 once it resumes running.

>  
>>>
>>>> +If the device has been suspended and the driver resumes the device
>>>> +running by setting the DRIVER_OK bit in \field{device status} to 1,
>>>> +the
>>>> device MUST either resume normal operation or set the
>>>> DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to
>> resume.
>>>> +
>>>> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
>>> It should be MUST.
>>> Otherwise it can crash the system accessing memory that may not be any
>> more accessible.
>>
>> Not sure how this can crash system memory, but "MUST" is OK
>>
> Ok.
>>>> +the following actions before presenting the SUSPEND bit as 1 and
>>>> DRIVER_OK bit as 0 in the \field{device status}:
>>>> +
>>>> +\begin{itemize}
>>>> +\item Stop consuming more buffers of any virtqueues.
>>>> +\item Wait until all buffers that are being processed have been used.
>>>> +\item Send used buffer notifications to the driver.
>>>> +\end{itemize}
>>>> +
>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
>>>> Options}
>>>>
>>>>  Virtio can use various different buses, thus the standard is split
>>>> @@ -872,6
>>>> +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
>>>> Bits}
>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature
>>>> Bits} for
>>>>  	handling features reserved for future use.
>>>>
>>>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>>>> +   suspend the device by set the SUSPEND bit to 1.
>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>> +
>>>> +
>>>>  \end{description}
>>>>
>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>>>> Bits}
>>>> --
>>>> 2.49.0
>>>>
>>> Apart from these small comments, please add the line in v3 commit log:
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>>> ub.com%2Foasis-tcs%2Fvirtio-
>> spec%2Fissues%2F&data=05%7C02%7Cparav%40nv
>> idia.com%7C0ef2b01694d942339bb308dda4e5365c%7C43083d15727340c1b
>> 7db39ef
>> d9ccc17a%7C0%7C0%7C638848026619639978%7CUnknown%7CTWFpbGZsb
>> 3d8eyJFbXB0
>> eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
>> CIsIl
>> dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0st2osYsAxascHHmHj0RgSyYAn9l
>> yQRKqxOl
>>> aIjE8dk%3D&reserved=0<issue_number>
>>>
>>> This will help to link the two sides.
>> sure
>>
> Thanks.

