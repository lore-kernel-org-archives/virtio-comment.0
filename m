Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF80176ABC
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098399; cv=fail; b=iZzWcS8mqYlrAeR9ac0RMwnH+Iil4Y6zIsO1K5TfxObNCIII7Lx+L568Tjhru7lEnmK82Ii3Q/VAyR8pk6eDlTeVSOct95u19aqCsyh1bKpr4W3HMt/IuI4qqImVfN8u07R+k74XAzwVKxefXZRSSXxPPX2f4wzfElXYCCAp3ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098399; c=relaxed/simple;
	bh=uW0PP7SBPWzYn9meIrQstUO+LxVDJrouswGW1GEqqgA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GFm69hw4csY8mNsg7aV3CmmAD4FZKAwrkqArd/zgfIizgw1v1STO9bNkIlpDhcbx//Kt6vUSHmMbo3a33q4abEoY/PeG4nFV2f3ILoIEMR9iCW+ZR5FI2RC/gVEGtlq9pKaFZfdH8I2Y2sQUpuvp266m6IuiUlDOAd3n2NRcWdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SUXa6MyY; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SUXa6MyY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwyFr+x58Nbn9g+mRBJSvs0uPifLEcSSmu380DMNjb8BdSVLuQx0XmNLiV/q96S5xe38fCw77xQ9nrGgqDfVTiFn6a5FDN/NbG/U2B1uLohPZJnkSit6REXIuz/C84t2gaM6ZrWjr5UKO2M5WsK+U6KU7W5VaDIy57sv1oB/FI5wYZDEGMIM/1QV9x7F6kVh0BrHc2f/YZxIPVO3l6dTtf/2S/WuvO92K3FBnEOyRU5U623UsPTwJxoI3k0l1YxnRnvCDiY+sodceMbJEuD+A+w2x4BLe2DL92NOwze4Xg0AIPqDvrzdJ0NQr7wcfcKr8FOzUNn8yk0PojbfwXaYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2k0NcrMlAXkklb+Sup5RwuYS85WFz9xVuFipOc4L60=;
 b=FZ2okayPUKFhpbo4KPzQxecdmsKTIlTcNeXjGzD7xsJ9FpzRbyyLd7mnH+wZNr8ObQ6sqRsKjEYW3679m8bxsRG4WdIm/oJkxw2IhvtT3V85JgMx32Lv5F94Gy2rRXs5319qNbrlLjENUE56swTElbICOPQ7omMo4aduW/z1Oah/TJePQ5mlfzBm01pD2zmst6u9TECvFynrlITKrTZbgtn/A39orcEhLu+Dp6Anmw1IPWnFseC+Frsa38V9eBL+1xVApo06EfkUl2AKTcsavOsKtw1m/nG/KKUvC8beqMIeKPOrohhyPaG36G3kQjTTEvjiy1ujyduQr129szDmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2k0NcrMlAXkklb+Sup5RwuYS85WFz9xVuFipOc4L60=;
 b=SUXa6MyYHihQrtlhEOet4riW1eSoNt1m0LXS/3BVJUjNATUk6INZG211ck60svy6RuyYQEud0toMSImUI2VNxCQy9zJk1Vk1TErEEyxjAcfKYwmin18+jaHaJS3GX/jXS9hgESLpk565sy/L10hB9lWkeHTkxr8h9zYwp+W6ExM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 09:33:10 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 09:33:10 +0000
Message-ID: <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
Date: Tue, 11 Jun 2024 17:33:03 +0800
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
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH2PR12MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f0aeda-639f-4124-4f2f-08dc89f98207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Umg1cCtMdUJiOGFiWnpBWjVNZWZjYTd3TUxKbFkyWkkwSXhaTlFscGQ1ZUYx?=
 =?utf-8?B?Vk1rcy9wd2VYNVV6NktsQ2FtcEJQeDROZ0VpR2RJaHRFSXZ6MGx5RnVvT0pl?=
 =?utf-8?B?alk3NHpIM2VKdVcrN0VrM25jendqNGlra2trNThmSXpvRndJd05TWllsbUs3?=
 =?utf-8?B?bkowWTJxVERiYndUYUpDZndzemhBY3ZGTVlNa2NVdm5idnYrVWdpNFZKSzN2?=
 =?utf-8?B?dmEyMFBDTE5iYmViNFFSc1NmNnZxYWRxWEVZWHFWVGlJQVRwUjkzNGxVWjVG?=
 =?utf-8?B?MTQ2YzhabFlBd1F5cVUzVVBpdGxHN0t6YXU2VTUzZW4yNjFUN0NpZ3g3RUNa?=
 =?utf-8?B?SzNxZnd2T2x4azVzVXpQVHNha1BOZUhUOGsrRExYRmFwTHNSa0UwendDeEMw?=
 =?utf-8?B?cHdtWmpta2dTK3QvOUxzZTk0MncwRVZaM2Vtd0p4bDhSNURuOW0wTGVXQWFC?=
 =?utf-8?B?ZjF2RVZadGxmRnBvTnhpYTVxb1ZIdDIwb2I4Q3B2bnkvQ3RJWWx1VFFqenpI?=
 =?utf-8?B?RUFVMFdYbDF1TnpIM3hYa2lkM2VVOW1tTlR4amlvQXhLS3JoVDMzSEFIVG8r?=
 =?utf-8?B?TWhJb1F3MGVGNXVscDZ6STJGT1hOMXNFWDZITWdTbDl0SXdxV096V004SGdy?=
 =?utf-8?B?dUVkZ3hUQ2xnY0l6QmUwQzRVenlUMDArT0hEempwVkc2eDNoNzVabGZQR0ZR?=
 =?utf-8?B?QXNHZGZjTEtMSkR6UHRDbWhYU205TVRpMk1BUlpFTGRVazJhQ245dFVGeFRo?=
 =?utf-8?B?K1hvMW9iMk5MekxmRHNsQXBnbFRmbnkweWc3SHBGQXFub2VPcnV3TE8zZXZF?=
 =?utf-8?B?cHpmc3R6elJnRUhtSXE1bklSTUxJMFZyWTRFSUhleGJDMG1mblNMNFd5Slkr?=
 =?utf-8?B?OWN2ZTdrV3VkTTlUK0lOMHBQZS9ybDZJc0xHRmt3ak1JSndQV0FTZGt6UGJh?=
 =?utf-8?B?OGIvZFB6L3VPa0FVYkhyOEs5QVlWSWtNUHlhT0N0RHBQZ3E4aE1mY1hDUTR1?=
 =?utf-8?B?YURHangzdktwM0lObHZUdXhCa0dTRnFzU3hYR1lJeDVVdy9ZbHBwVU9EM3Er?=
 =?utf-8?B?YjVSNS80d3Q3Q1hWUTQ2SjBDSnRaTXNoakhKQUtqV0xrSFRpaVE4UE1qVFBG?=
 =?utf-8?B?K3kxNG5wMWJZS2htOVJCWnRTV1IxSGh0bE04eWkwVTUzc0dXTFR0TEcxdHhw?=
 =?utf-8?B?bHhmTVVaR29tMDAvN2g3dnYyTkJVMzkraEJPQVk2YnBQbXREZUg5Y3pVU250?=
 =?utf-8?B?SGpTTHU3ZFY2WWZGZi8zOUlBVU53UXpHREdsZEJTMzdJVjFPSHBFREJ4OGJT?=
 =?utf-8?B?YzBJSTlyS1drTDBLV0lHODRnNW0rMFYrVUFoNnA3bFRDRFk1SEJWSndYd1Vs?=
 =?utf-8?B?K1pvVDhRMm12WUdiSi9MV3dFNTZ1eWcwMFljeGo0bkxpRVNqa1Baa0dYKzE4?=
 =?utf-8?B?TjViTnNEaFRuUE9Fd3RWZ0tKRERUdHVtVUxqYmFveERiNENQanJoZDkzQ2Va?=
 =?utf-8?B?QzQyQUNKc3g0bWl0THFnbEswSENJLzBiRzJtUGlkM3VOVFEwc1FiYVhvVmV0?=
 =?utf-8?B?ZWtiTEVQZGdmQ1pYODU5UU5Dd1pRUksyUmtNWDVTN1MvUmhscnFRK1pLck5j?=
 =?utf-8?B?aUp4bU1qSEFnWkN3ajVSSHNaSktNYXZWUlRGdnNBYmoydXJ5VStLMkk3SVdX?=
 =?utf-8?B?aEFWRjBDK0krck5tYjMwTlBLdXdUVEZZNU5CS1NmWHZMZ0tuOWJFUWk2QVhN?=
 =?utf-8?Q?GsDq4X8MPubwqFriPZWIwrdWjC8ws9oSsPmKJjB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OExnTUQ0ZWp3YmhrRHVBVHpKMmV2eEhXV2NMMkQrNEFtT0hTZnM5NWtPQVQ5?=
 =?utf-8?B?NzJaejhTQjl4Q3ozbFhDeGhtZ1QvT2U1RG5HaTUwWjJwMmNudmVhck9rcmE4?=
 =?utf-8?B?RDZRaU0vby9kd2pxWVVtamhJS0FZRDFxVEc5dEt2OU4wQitrWHRwYXpMTURS?=
 =?utf-8?B?U2JUaXU2S2w4di8wWC9qMmpvUnRUL2p3QWdZUUpkR0VCSExSVzRVTndyWEdT?=
 =?utf-8?B?MUV5NFcvWlZTL1ZESkFyd0ZGbFZtVWRSd0pBQTVqS2RubVVRYlE1czdmak9z?=
 =?utf-8?B?R2RybzBVeitqcEZzTmo4TjlIUFpkS0VabkpzMmE3a25wZkpuRDQvcTNRNmFC?=
 =?utf-8?B?QWdadkM4WnduTTM3Q1JxbjhvMHF2Ym40Zk12NVU5cENxWHphcUtnZDZ2ci9Z?=
 =?utf-8?B?SC9XYVdFSzh5Z3J0OUJsaktxQk9NK1FwVThWekpUbXJOdnBrdHRwVlVsSG1D?=
 =?utf-8?B?bFpHS1ZQdENuQ0pmajM1U2lsQU5hSVNKMVFLWXFXMXJ6KzBYZWVSSGUvZHEv?=
 =?utf-8?B?RVhrdEo1aE1WVDVhVjQ1dXkyYVlVclpTRHM2ZFFOUDVvd1JnTDdkSjhTZ0po?=
 =?utf-8?B?SS9nLzkwbXJoanVTV2hQOC9vWk9sVGVuWFNFdWtEN2dyR0JxTzlvMHkzMklJ?=
 =?utf-8?B?c2FpSzU1YjN3MG92TEQwUHZMbnpkVEtHK1FnUWQ0OC95WmdyUzJsOWNrbU1I?=
 =?utf-8?B?RGJsakVFYkpHUmF2Y3dqaTBPY3RhTWdBSU8xMTcxd3RvaVNRTVJtVXZsMndr?=
 =?utf-8?B?OFQ1clhxVDd6OCtPTEloU05EanlLSHRuWTRQQ05Fc1NGTHVTeCt6dTd2SXpB?=
 =?utf-8?B?WXRMY1dYYUNPbDhhYnY0Q2JDbkhrK2IweWhIcFNFcFBXN0lhUW0yOXVHV0lD?=
 =?utf-8?B?cEdVaWtnUUZaOHBMVkxBWDNNUEVKYUVLczk0UmoxejlyejBVQlpIZk1lZFBI?=
 =?utf-8?B?VXdBeVZmS011NDgwaG10K01qMCtTYmJDQjkwSTB0RGxFcnlTTHJ2WTQvNlVS?=
 =?utf-8?B?M3oyOW1jTXo4UmsveEhtUHRUMkdtclQ5enlkZnVyUWpaZHlaS1ZuQy81OTNk?=
 =?utf-8?B?ekdPelIxcHdvNTIxNTFjcVVKc0duVmEyQWZ0SUNTVGZpTzNadGptb3FmanBV?=
 =?utf-8?B?MEVMcEs4ejJaM3ZkQk10MVU1YmZ3M1VOcnlVUjhaTjE1MGdVWDYvYWVvNHFq?=
 =?utf-8?B?M3hhMVFUTWYySFlZb2tMa1ljZkQzM0haMENERHlBM0pySTQ4SUhaRjlaUDFR?=
 =?utf-8?B?cXJHc2lZb01WeWVKTGdlOTROWXR3b0tYalNFTU1tR04xVktOaHRQaS9ZVjdH?=
 =?utf-8?B?UnRlRlFVWERZcm12VHlsYWxTdGo1bzlVK0gyOXQ1dlhQdVU1OHp0d014aXNY?=
 =?utf-8?B?U3J6MlRqVmlqcHQ5dWhWaVZkL2VTbXZjWkZ6OTJtR24yWEo2R2o3UTZZT0o1?=
 =?utf-8?B?WGo3VHpwQlN3MzRsNml3ZWVLSWprR1Z5WUIxWFg5QWlsUXJTQ2lKSVZ6L2Jn?=
 =?utf-8?B?L1BneDY3T0hWTzhOdDlUR3hNUUtldmJHdzJROUJ3YUxDNW1HNlhiNkFnWTFw?=
 =?utf-8?B?bmllNm1XNlB3MC9GNzRRM2hzSUhpZko3anhDcnovYzF2WjRFYjJKU052RVVG?=
 =?utf-8?B?MXFZclA5S1NRNzhRbE4rcXZoSVo3cFk1dVRSNkowRm5pV054Q09vOFFnODBK?=
 =?utf-8?B?em83QStmdzhSeWh2RWt1VGhYL0hGaWdmYnRkNWxld0NTZnRRUzBnTjdpMWhB?=
 =?utf-8?B?aThueDVvQXVsL205RmVhMGlxZjR1czFYU2tWcm1DOGJFMVZxWGt4K0V3bkpq?=
 =?utf-8?B?NUNqMkxBMWpnSGhBSG9YS2RYOUlaYUpqaHFmU1doRzE2QTVpL2JlRVFJcXVE?=
 =?utf-8?B?TzJ5SVBnTDVDNCtKM3AxRC9OR0x2TWRJVjdNeTcwT2ZkRVI1b3NPS0lBeDgy?=
 =?utf-8?B?RmkwYmYrRWFNNzNMZ05DeTdIakJydUZVU2Z6MFU1NjFwWHd6WWw3Y3Y4b2Iv?=
 =?utf-8?B?bFFGeEFRKzBoYTNMeC9YMy93RmUwQjVPRElZWVZvMkttNEVEQnEyK1I5RUZj?=
 =?utf-8?B?RTVCeXJQZkxvKzlCa0xWTklOaHlYRkRId3hkcklSZUN6TlMwdzRYMFZLUUhV?=
 =?utf-8?Q?bf+Bl4pdG73SQiYxzZJR29dZi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f0aeda-639f-4124-4f2f-08dc89f98207
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 09:33:10.3318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZyNtQeZVrmcWTkY0R65YaqJtRDGTIn3ZEntCbv8PA+20gznACuJIlDchP9aVAjPWp4Z60TBF9gnmznYaJyLTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119



On 6/11/2024 4:48 PM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, June 11, 2024 1:57 PM
>>
>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
>>> Hi Lingshan, David,
>>>
>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>> Sent: Monday, June 10, 2024 9:34 PM
>>>>
>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>>>
>>>>> This commit allows the driver to suspend the device by introducing a
>>>>> new status bit SUSPEND in device_status.
>>>>>
>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND which
>>>>> indicating whether the device support SUSPEND.
>>>>>
>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>> ---
>>>>>  content.tex | 69
>>>>> +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>>> Can you please add a changelog? Especially as some of the previous
>>>> discussion has been lost due to the broken old mailing lists...
>>>>
>>>> (...)
>>>>
>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>> +Initialization And Device Operation / Device Suspend}
>>>>> +
>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>> +
>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>> +\begin{itemize}
>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>> +whether the
>>>> SUSPEND bit is set.
>>>>> +If not, the device does not support the SUSPEND feature.
>>>> That sentence is a bit weird: I'd expect the device to not offer
>>>> VIRTIO_F_SUSPEND in the first place in that case... could this rather
>>>> happen if the device is not able to handle the request at a specific point in
>> time?
>>>>> +\item The driver MUST NOT make any more buffers available to the
>> device.
>>>>> +\item The driver MUST NOT access any fields of any virtqueues or
>>>>> +notify
>>>> any virtqueues.
>>>>
>>>> "send notifications for any virtqueues"?
>>>>
>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>> ...except for the status field, if it is part of the config space?
>>>>
>>>>> +\end{itemize}
>>>>> +
>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>> +Initialization And Device Operation / Device Suspend}
>>>>> +
>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>> +
>>>>> +The device MUST ignore all access to its Configuration Space while
>>>>> +suspended, except for \field{device status}.
>>>> ...if it is part of the configuration space.
>>>>
>>>>> +
>>>>> +A device MUST NOT send any notifications, access any virtqueues, or
>>>>> +modify any fields in its configuration space while suspended.
>>>>> +
>>>>> +If SUSPEND is set in \field{device status}, when the driver clears
>>>>> +SUSPEND,
>>>> "subsequently clears SUSPEND"?
>>>>
>>>>> +the device MUST either resume normal operation or set
>>>> DEVICE_NEEDS_RESET.
>>>>> +
>>>>> +When the driver sets SUSPEND,
>>>>> +the device SHOULD perform the following actions before presenting
>>>> SUSPEND bit in the \field{device status}:
>>>>> +
>>>>> +\begin{itemize}
>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>>> +until all buffers that are being processed have been used.
>>>>> +\item Send used buffer notifications to the driver.
>>>>> +\end{itemize}
>>>> So, is there any opportunity for the device to fail setting SUSPEND?
>>>> I mean, if the driver is supposed to look whether it sticks, there
>>>> should be conditions for when the device might clear it again...
>>>>
>>> Additionally, a suspend operation usually involves saving things to a slow
>> memory (or media).
>>> This is because the device implementation wouldn’t know when exactly the
>> device will be resumed.
>>> Few examples, are:
>>> a. A gpu device with 128MB of video RAM when suspended, QEMU needs
>> to store this into a (for example) rotating hard disk as 1msec IO latency.
>>> b. a NIC may need to store its RSS, queues, flow filters configuration for
>> several tens of KBs to some slow memory.
>>> c. A block device may prefer to complete some IOs to a threshold level
>> instead of maintaining large list of outstanding IOs in some suspended
>> memory.
>>> d. May be more in future.
>>>
>>> Additionally, suspend operation needs to be synchronized with certain data
>> path hardware engines to suspend DMA operations (read and write both)
>> which are inflight.
>>> (without causing DMA errors). Same would apply to the sw backend
>> implementations too.
>>> Therefore, the suspend operation that is initiated by the driver, should get
>> the acknowledgement back from the device that it has been suspend.
>>> Some of the good examples if you prefer to follow, a driver<->device
>> interface needs a suspend register which should behave like below queue
>> reset register.
>>> Spec snippet:
>>> "The device MUST reset the queue when 1 is written to queue_reset. The
>>> device MUST continue to present
>>> 1 in queue_reset as long as the queue reset is ongoing. The device
>>> MUST present 0 in both queue_reset and queue_enable when queue reset
>> has completed."
>>> At minimum, we need, something implementable like,
>>>
>>> The device MUST suspend the device when 1 is written to the
>> device_suspend_ctlr. The device MUST continue to present 1 in
>> device_suspend_ctrl as the suspend operation is ongoing in the device.
>>> The device MUST present 0 in the device_suspend_ctlr register when
>> device has completely suspended the device.
>>> The device MUST resume the device when 2 is written to the
>> device_suspend_ctrl. The device MUST continue to present 2 in the
>> device_suspend_ctrl as the resume operation may not have yet completed.
>>> The device MUST present 0 in the device_suspend_ctrl register when the
>> device has completely resumed the device.
>>> At this point, the driver may resume notifying the device and accessing the
>> configuration space.
>>> Can you please enhance this part?
>> Hi Parav
>>
>> Yes they are necessary contents and we will address them in the following
>> patches.
>>
> The register polarity is critical.
> In your reply to Cornelia, you descried that suspend bit cleared in the device after driver sets it (until the device is suspended).
> This is ambiguous behavior of the register. Queue_reset register was like that before it was fixed in 1.2.
once suspended, the driver should not access the configuration space except for the device status, so it should not reset any vqs through
configuration space.
>
>> This patch focus on the basic facility virito suspending, not transport or
>> device types, this is to make this chageset focused and small.
>>
> If suspend bit is part of the device_status, it is already covered by the PCI transport.
> So it is fine, but its polarity is an issue, that we need to fix.
Oh, I see your confusion.
All transport have their own implementation of configuration space, this is not PCI specific.
PCI config space != virtio configuration space. And this patch focuses on virtio layer.
>
> i.e.
> One driver writes 1, it needs to stay 1, while the suspend is ongoing.
> When suspension is completed in the device, the device to turn it to zero.
>  
> If the device_status register does not fullfil this, a new register is worthwhile to add in this patch.
The driver writes SUSPEND, once the device is suspened, it should present SUSPEND in its device status.

Thanks
Zhu Lingshan
>

