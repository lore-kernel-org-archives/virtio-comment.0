Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55B21D5B6
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 06:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751955028; cv=fail; b=GohRPJqWZtqE2pHlTz8K9ZGvkqSA9Qn8zFHIHOfvqZeShNG5eRlLH8XtwgiJyBVlSxcsTQGlWwNXmV/gEiAePEYeDbu94PFkrhEhuJtN8THu0y3AaWDRc1b0yzmxm26taGmd37vmOQrFDuq5VB9GgXI2zQ3/2C0JXTNYc+9KFTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751955028; c=relaxed/simple;
	bh=jgIW/+Ssz9TxWcjVhdOjg0xCumA/7XMm4eRAkdP1ULo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o7fJZdKwtF8d+8mKfAsEC1XGLGrrY5J7U+ONdiAGlfeYjzU9TE5ihUx8dwHE/XpdBhg2R9sSoEZTzq82p+YDSD3W37Da9OUjRNy9jEVxqSi1E1T/v2jfwJHxW1iRXSqPSVdb1AfeOLn3KOshC4l+vt4lb2My4pY/oOnb4LGRf2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Spz/jOYd; arc=fail smtp.client-ip=40.107.92.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Spz/jOYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g56BEc4q5ctq2nBWDZlMvj5cQVAXvRSVm1RpQbggq/FGS35BSlHOKzrjfnldopzAKYHCb7EFN1CoZ5mDlfnhLyftCBrIulZ2KewbTPsLHZRHLzdS9za27te/M7LUeQeqwlV+LZsg16FRFnIIqmDWGkeUlb3vgnRyW4jSbNw3I1hZrDW6JxqGTtWI/eLGsWJFyfWhcb4WDfKdXhvm+BQGJkLkQy/JDfOK1zLfgwocUr3jFeLEKyUBBrxjyIgD9Jc9KexcU7HVg4dqQKCvvjKqC52w6xT4xrmd3gmlVc1Nbs1P3UAtvHfxIL/9deXTQ5a54SZLGL4ZWJioEs0e88w7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uG+VSGmTRQQIawUWY4KR8Bg6djiMbmdtmeFQfAKRvM=;
 b=zKN+ynoyFOEW6JVH68tEeCtrq12Cw8A3EoKnk2saI5ONym0t1bBpOd8FsQ/yRqDiH0Pk9rsG/WDwG41wzOV+CqGekVXxG83U3wJvdjrPA9U3S38imenTd1DuxE08j1gNSAO9FFmSuK/A2YHaRt+OML70G6/ETIohu/ATjvsZrbdVDRfpfi+5rVS8LaqrXcHQtErbjCOOkynikivi/pD34QNA40NRuApr2KcQX/rNxR/L1vM+5WQLKN///ytRKbeMJCXZYtKaAv9nd3acsLqcXCp4ChQl5l0TnkNGisn9K8QDfVHDCF9AguUQO2ODkGHVKj1XZNKAS47lzElTktjxSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uG+VSGmTRQQIawUWY4KR8Bg6djiMbmdtmeFQfAKRvM=;
 b=Spz/jOYdyZ5S0l2s4S574JIUYGLZkPaKlCFiPyewihmr/PkkeUBfoEGW04SYZ2Q7BFAE1sIw7aUdEf961tYrjloM66bsa7ql8dkk8DSC8MHzmkD1x1ay48sjlWWL3HjlsDBanQkbYcq9Om2z6j6jEO3PWoWOktsNZbLtvVR500g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:10:23 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 06:10:22 +0000
Message-ID: <d0042413-b385-49e3-8dfa-831c9110e80e@amd.com>
Date: Tue, 8 Jul 2025 14:10:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Implement virtio SUSPEND and RESUME feature
To: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.linux.dev, Ray.Huang@amd.com
References: <20250704101739.354522-1-lingshan.zhu@amd.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@amd.com>
In-Reply-To: <20250704101739.354522-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f6bc60-bfaa-4ed5-1ae6-08ddbde61f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTF4MXI4bks0TXllVlhaN1dzcHVYemJ6RWRiYmcwTVFWeGlJck9rd1VIbkg1?=
 =?utf-8?B?VnhRWlFWK0NteFlaTEpyeTBFQ0lmckEyK2NDcnlVT2xGWEkxdDRPR2ZjQlkz?=
 =?utf-8?B?UEJSWGMyNGQ0OWpmcnJwOWYyU2dndFh3N2xxQ29XVFNFQlkrTHBnb0pLdFpV?=
 =?utf-8?B?cjJGdmIwa1lQZUhOcHlNZzV0T2lQWGFHWEpJZ1VSYlEwakwwOW40WUpUVm1R?=
 =?utf-8?B?Tyt0SkFSbWR0MHNreTBvb1Nja0ltVWNBWUE1d3BTY2Z6VWhBOXE2SytPbTY2?=
 =?utf-8?B?YTdqb0ZycG85MHlWNnJmcDlvbHA1SUlra1dwMVpnd1UwZ2RmZmdjUGdnWmlM?=
 =?utf-8?B?dE9WbTd3L1hteE1jUzVrSG96ZXl4Z3FlNUFPV05CWlBzSDRoZlVKZE52Sy9o?=
 =?utf-8?B?MVdZdDZIcERKM09aMXhGUVdFVlRnWEZqdy9wRmR5THFkME5iR0VhU1BmUnBi?=
 =?utf-8?B?dFFHdU5pUFMrWXRuamYxc3RBZXlWcUVhVzBBQlBJVXNpbWViUHJnRDVGYm5Z?=
 =?utf-8?B?bnJHZndDSXhManNpK2pOSm5xUXpCdU96cFNDcmQxWStqT1FOZ0szeE1lRHlr?=
 =?utf-8?B?NVh3enlSdjFoWWZseUJFWXIzMTJraG9CQXorZWJxTHc4K2YwNzJEYlpaWjFa?=
 =?utf-8?B?NUR5cmhlQk1mU0tTU040TnVwbTJ3Vkx3YjhFemlSQkdaS0QyVlR0emlrZ3RU?=
 =?utf-8?B?TU5rUlVqRmVVL2l1c3NyemlyR0MwODErRUhIVlBzNHpkc0ovZ1FhQTNqVVRt?=
 =?utf-8?B?K2Q3Z0RycEVqVGYxWE5MdEwyWHBTQ3VFVEhpQlZIV2ZPYklUdlRsSytsOHYr?=
 =?utf-8?B?NDlhaHFQVlU4cENFem9qMnUxNTNWTXYvOW1XRFFvSDY4dFlMV200b0xVbXd3?=
 =?utf-8?B?aDZHeUg5QWJqbWRqc0xnWUpCS2xqVnhiZTN4cVpkZGFnU3craFNORjVuaXJR?=
 =?utf-8?B?cjlPT2MwVkZuVTRxYlQ4UXExcnp2MTZSa1JJenJTdWhnRnJFRWtyZUtsaDNO?=
 =?utf-8?B?UytZSWpKNHBGVUoyaTluZkFvMTlOcWZPaDJ5bGdqMmMzSWNkNEk2V1BIUGM5?=
 =?utf-8?B?WHA1ZjZVUzJaM3liRmZoTGhka3U1NE44V3hrVWhBTHRQU0hqNjZWa1BET0VE?=
 =?utf-8?B?bUhMSmkvZFJLa2p4MDhkbE5yZTF2d1EwclMwNitKTy9BMjM5eUxZNDV3d0Jl?=
 =?utf-8?B?NTluR21DQnF4QlRoeHFKZ2prbUsyMWVjMG9TZWkvWGNBUlpVbWRnak9kL2da?=
 =?utf-8?B?RFkxSWFwbUhzVHcxQ2NDQkt2VURSZHRhQVBIdUFpd2pjZ2dDUDI5aWlFbmRl?=
 =?utf-8?B?L3hUNkZjamxGalM1eUszU3h3dEJJRWJTU21PTFNqOStBZUEvK1Y3TE1BMGg1?=
 =?utf-8?B?eTRQVllMeEJKNnVQUG00dzlFR0NDN2tjVkJpWS9WY1dzZEhrWmhkVmRBbVJR?=
 =?utf-8?B?eEwrM3FLZTZTU08yUnQ3empLMWV5dTdxVlp2RkZSa0s1UmN3MGZNbW9SN1Vp?=
 =?utf-8?B?blgraXNkQlExZjVTZWhGRXNiZzV5czFlNlg4c1NLSy9rUGxWUVROemN5b3V1?=
 =?utf-8?B?Tm8vN3NEVXl4L2VDWUhReE5EbDJvTm05RFBqS2VqZU1YN1lXRE9rUzlwRktJ?=
 =?utf-8?B?U21UdEtqVnZpM3VFME1yK1NNWGpFdGlHYkhoZExFR2tnU1huL2IrUEpYbEJs?=
 =?utf-8?B?V09nWVIzTGdsOVVBZi9kVEUxcHJoRlZBdGxUL3JHR1YxdFVoa2tydWhhYS9l?=
 =?utf-8?B?cG9YTitiTXhyNitsOTBkcjJROU9XMU9uRS9BaXdTYTYvemZiTzhsbFVoR2pa?=
 =?utf-8?B?RHFNNzRmZ092U0VPSjE3M1ZNbEtqQTd3dVo3NE1ST3RXZnZkZzBxTUp6OFZn?=
 =?utf-8?B?VnFJQW1GSTF1WFMvWlVQWks0RUtBcTlQcWVPOGFjczJ0cWlqbXhRcFgvcThQ?=
 =?utf-8?Q?OR2lfwbCIKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm5jTUZ1ZWl6S3lDcVAwZjZMSDh3RDNocGQ2K3ByYk0wdlViMmNqN2l3VWtN?=
 =?utf-8?B?cXR0aENEZ3NvRWovYmRXSUd1b2YyNUNSR3UweCtDQk9YUys3eXEzaEdpR3FR?=
 =?utf-8?B?emtYWDZlVG5CZ1FRanZEOTM4RXI4WEp5RkM3cC9mSkJJV3ByRENTVE9aUXdS?=
 =?utf-8?B?RHJBRE51enJ1WndYZW45NTd1NWpzTXJpaDdvU0t0UlJXU2JWZkwyZUNHclBU?=
 =?utf-8?B?UnlkcGJYWnFYYjQ5MWVXM3Zwc0Q0V3dLODF0NjVYeHlEK21mTVBHZXJ2aTl5?=
 =?utf-8?B?VGpLRjc2VFF2SE9yNGJhVHh0U2VwUTFmbGxXSGwvM2s0YnRuUW9Uak5Rbmti?=
 =?utf-8?B?Rlp6Q0xtUmVTRzY5ejgvbllCQncrdE1HRDlCbWl2ZkRZaVVWbGlaOElhSFdO?=
 =?utf-8?B?MFhrZGdPRVZWdlMwa2RHclhWcDZ1UDNiNzJMMkdxU09RbDEza2ErckM2bWQ3?=
 =?utf-8?B?WEJaay9qM05ySkFrZVREWHJvZ1NNY3A5c2c1Ky9BU21IV0FxdVUzblVTMjlJ?=
 =?utf-8?B?WXp4ZDlmRFYwbExPQ2oxT0FqUXlGSTdkL2hxWjd3SVc5K2hWV2NCd21ETSs1?=
 =?utf-8?B?Z1NLM3NXdUNvNFAwYmJFeDRXdHB0VXNTOVJaQ2J1QlVFQm9QSXBFM1BXYkJJ?=
 =?utf-8?B?RzY4OG8yNnJld3ZnVTdMQTh1cDI5STUvSHlQMVFrYW9BYW82QzhJelhGenRR?=
 =?utf-8?B?MDh3VGowWXhBYjJOc2tKeTM2NDBzTTBHOVRDMEtWVHNrQ3dxcDJNSlp6Q2k4?=
 =?utf-8?B?L3U0aXY3VDUzM0dORnRSNVdPbDFtOUN3SjFUaVRtZmttdjJadlI2R1U0enVK?=
 =?utf-8?B?YU1xbEpZWWs3TG9ic1E3c0hKbTMrSnNCUGYxUFZwWU84UnZqV0IvOGIwNW5a?=
 =?utf-8?B?ZndYdm5HMVVBd0gwYk45TDJWZ3hNbFE1YUk2NkZHSG4yRnBPQmlPSzBRZUth?=
 =?utf-8?B?cndubHVyUWZGbEtYbWFBdGVpU0xKVU5uenZsUno1ZzVJMHVBUjJBNzUrc2xm?=
 =?utf-8?B?Znl1VlpGdDlLdzBCSUtYZ1V2dzZWaFdzU2Y3TjR2OUpoeklHSUI2MnBtMlpZ?=
 =?utf-8?B?eStyMVlNclp1UUl3dUdjNVFsa0I4RDEyeHBOTTRsR0thR0tZSW5idGo4UzJ1?=
 =?utf-8?B?Tk5LWitDTEdGaGVxOExONm5TalNuZEhmOGdSNTNLSW5tWHBRY1ZJTDVMT3NZ?=
 =?utf-8?B?cWVSOGNydmFVbnR1NU1mM2J6NFNOM1drajgwZWs3M2FPM2VqSGk5YTdEREt4?=
 =?utf-8?B?UERueG5BaWFsbU5RSTQzS1U3NmZpNnA4YU91YkF0SkZOSW5VWjdlY3g0QTZr?=
 =?utf-8?B?NXYweHRnMDg3eEJBUnhEUHRGYUNjMFpXRkhZOGl4djVHV3V6YTVqRktpamV0?=
 =?utf-8?B?bUs3K3d3QkJaNHd2c3h0OWRpL1dJTzluT3NucFNBTmNWSVJJdUhEczVBUVZq?=
 =?utf-8?B?WWNRMkk0eDZLdnUwcFJqcjJWdUVxVDh3MDFMOWZyQktCKzMzcjBOa0xmU291?=
 =?utf-8?B?a1JOUm1jSVpPOFlFeGk2Y3NlcmQyYkk5K1Q3VkdSSEpaVVlwYTNjeEoyQWo5?=
 =?utf-8?B?ZkZ2WkNGWTNJOXNGckFhRURVbXhtZ1NSYzVoYUk0ZCs1bDdNMlRiRCt2czNP?=
 =?utf-8?B?MHFkQ1d5TG5ROThrQi8xZEovZEovdEJOWml5Tm5LOGxJbnZ4UW4zZ3dMemdv?=
 =?utf-8?B?SmdoWGl4T3lIbzhQVUF4NjRPdG4vU1lKSEh3ZkdTNGk4Y0JXdHEvTDhwOUta?=
 =?utf-8?B?ZEwwWkllU3MxMkxKVFJwcjNVTnlGUnpFVG9xeHVTa3lnbnlraXZXVkF2cXpC?=
 =?utf-8?B?azFYU21SakhEMVpIc2IvUDdKc3lKcHF2Vlg4bmd6RHpQWnFhQk9sR1ZKcmdr?=
 =?utf-8?B?cHRnbDQrejJnTTFLaEhBS0hDeFMwSERaN0Zid1FQUXpoTXQyckNmbmxFU09N?=
 =?utf-8?B?K2RBQkxiNms5ZlhRcW54ZThqY3lERW55QTIzSjJrQmZ5dDhWQ0VCc0lLRzFB?=
 =?utf-8?B?Smd2MHZYajVhTkhoS3ZlK3FvaE5oNGZEM3FPOGFGOUlYNkFzRytkTjVkRE9E?=
 =?utf-8?B?Z3NsMTNRajFqeUlUNXJZR3p0MFBwTEZ2a2FSOFpXcVFlYjNUQ0FnalE1N0or?=
 =?utf-8?Q?bS0OcpvGEauKF7m4nOhzPkE6F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f6bc60-bfaa-4ed5-1ae6-08ddbde61f7c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:10:22.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yc8MTiaaP/0h5Znl2cFy5OFpLTSQtpdw5Jygy7RVDoTHQKJF/baPkQEPQm8QCW1YuG9sg1xGCiXa8Y8INvr/ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

Hello MST,

All comments have been addressed in this series,
shall we vote so that this series still may have
a chance for virtio 1.4 release.

Thanks
Zhu Lingshan

On 7/4/2025 6:17 PM, Zhu Lingshan wrote:

> This series implements SUSPEND and RESUME feature
> for virtio devices. This feature could be used
> to perform live migration or take snapshots
> of the devices.
>
> This series re-orders the device status
> bits, and documents feature bit 42.
>
> Github issue link:
> https://github.com/oasis-tcs/virtio-spec/issues/229
>
> Zhu Lingshan (3):
>   virtio: re-order device status bits
>   virtio: document feature bit 42
>   virtio: introduce SUSPEND and RESUME feature
>
>  content.tex | 77 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 68 insertions(+), 9 deletions(-)
>
