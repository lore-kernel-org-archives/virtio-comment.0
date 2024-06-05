Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC036F9E9
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717567194; cv=fail; b=mZqiEm0TMiLsa075oTSl6g42QA4iHJ1ki1xc0m4M+pkxmKJ8BDlUR+ClFGi2CdnEBa9SyJceHJ32GmlZxNBKmQIlxuxJUXKVA+nS5q39qcVzoBbCoEu67yTMJJiayUeCk//8tLMRIPcPtgtLY7OFfjWMMPPF6Bd0CNk4CBajf5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717567194; c=relaxed/simple;
	bh=TAF5Gr81/osoWoQcUfhorkbyYKmWoSLGTIDqrM7CsWM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ti+AM1RULDDAM9YLWZGMgZgUjaI7zIviusj1MrYTKANdtoBiJDFEflume/OnmwDM9/lkpfwIFJzj1n5s0HtjeneJ1EWUZPiJSqx0hSyzViretiUP7V2mrxWnAFGG2T3/eIfNeRZaNclEcUIXOFb9l4Ouw/zfaxO9rUCWX6lBqnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PFQrumns; arc=fail smtp.client-ip=40.107.92.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PFQrumns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN6QIbTOxcyFoqkCA35JOLA8irDlDRY2i8mJdOANUxl3P3OttfUYAqzNvxXKGdFnsTkapiKD1jwIEWd9XXl6UdXhlz2X55a2qgoUJILv9MoHerXEiP25z2COHhl5jZj9vJ0GPZ7HwsM4lxqCD5iJCxQWFxXTWH//NXexMdbc4eg2MYTO+vGrCuS3otX0NOQ8WqLHT4IlI29vWH53nvlpKhCbMe7Yr03nYtjCfVwWtX+BZbp9uXxcR58QBNW1oye502EdFKblwdh45ZsW4bfYTwlj0jiwfas6KZJYNAzmmhcGqjmW2czW5eMaZBE7eWmo8OxDznfbSs5V/8/YJ252+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRYDBw9AL8b3lvP/p98GUOyZjXPtSM5A/9SacWxQ230=;
 b=ER8wgBtVE8D2EXbJr7MOrv7ahC7Tl+Npr2q4PAoZlRxX9HzA2uSycmqxXRBfGgLZu7VHnnowjnoy+L6FMC0iVeuIhaVzdNcy01jfy47EMaEjW7xtcxFsklIUJrXEIj/+fvfT0NvjhoV9KEhR72nOS0rbetAsweemGN46S0KDVl2OHOMUxzH2jSL2fXU2OYliSrAjW+CEVGL07FB+1q+RaoL5vXae/UoLdyhrilz558NyANqAVReH5jkXOV/HjMGiR3wZl35AqYqpSPPVyHuM5+n01MQhAd81HYv+1+iP1oldPh/+UpKDDVZzBCUwKBKUhV6akTyuhJws3qcZbi8mUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRYDBw9AL8b3lvP/p98GUOyZjXPtSM5A/9SacWxQ230=;
 b=PFQrumnsY3vGXKPpepCKCM2mrZ9dpEfJ+z/mRLacCTUsM2oJPO4iDPyj+0YUeh/7f1CffNvNFmyVYB5FVkSdFk4I3RUGniumzc7T4d5oiWafBl0pxdQeXBJ9ixlyKiHce+4W8PxcyvkM02PNspQ0c3d/283D441KwL3WHwdsh+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Wed, 5 Jun
 2024 05:59:50 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 05:59:50 +0000
Message-ID: <e3bccd23-c747-41d3-b9a1-b44039f807b1@amd.com>
Date: Wed, 5 Jun 2024 13:59:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [V4] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
 Zhu Lingshan <lingshan.zhu@intel.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <20240604090344.225934-1-lingshan.zhu@amd.com>
 <20240605015049-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240605015049-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0218.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::14) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6e1a1c-f854-432f-c1f1-08dc8524b613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Snp2YlY3KzIvWVZ4d1QzTFh5cDVUSHhaa3NJR3lMSm9wblJDcFVXSTNvTUxs?=
 =?utf-8?B?M1VxQVZzSktHNVRYMlNwajgrR0xadm51aFFBR2ZFYkZWVjBrcEdBcHUvNVha?=
 =?utf-8?B?dndyU2hNdmNBUEZhY0VhbWZIckNVMHB3M01LM01iSVdNKzBxUWMwT0thSUFy?=
 =?utf-8?B?MElqNldJdzVqK3lNUE1wOU9GMHdrNlduOEV6N21YRGpUMEhDZG05bjBxeElo?=
 =?utf-8?B?blYzclVoeFBjRW1XZFJCbE11Wmt5MUNxYWlRMEFiejJvaHNmc3Z3MG80bXBr?=
 =?utf-8?B?ekJ0YmdQdVUwUHF6czJ5aFRENUttcThmSFZBUmwyMXgrU3J0UDNGcVVWWGNj?=
 =?utf-8?B?c2pWdGpjdUsxYk9BQWRHTmVHTnpqMmxpY3JQcGM4OU9RWWtnSm5wbmROcUxt?=
 =?utf-8?B?aWpTbmJicTdtQ3Z1NUFTM0l6dnFaTk9XTEZZeVE5aTNRUFRmNnBwWmMyaU90?=
 =?utf-8?B?a0p6UDByU1krbVVMRS9NTFFTaUNBU3IzZG5aaVB4TEF1d2VJaUhDRHpIRFg1?=
 =?utf-8?B?Z2xhZ0MvakdEdmZnT1Bxc3kvaEJNSVBGUFZQd0Q2ZEN1VFNQc1RxSGU5Vmh3?=
 =?utf-8?B?ZHRlRXZWajBMRGlDbG9qRWVWODUwRjU2MU92ekxFQ01pd01hY0tBZHNjbUR4?=
 =?utf-8?B?WmZaS3RqR0l3NnBJRjdvbWlPQU50Yit2RnE3VmRZbXdyY3VOQUFlSDhuZ1Jh?=
 =?utf-8?B?K1cvQlowaVNoSWJKYXY4T2hyQTNuRnQwL0FXbVRKYmdRTVZRTzdLTlBVSERG?=
 =?utf-8?B?L0pEd1ZaQ3dsaGphU3ljWG1JRjhqb1Ftcm4yeFVuVVhkajB5cGZhSWQvb0tQ?=
 =?utf-8?B?cGdieWE3NWhnRmtZODNFN0xHd0NrU05jOWVzNUR3VWhZcGJRaWNZdWxvMFVU?=
 =?utf-8?B?ZE9FaUxLcUQ5MU9Tbno3QjhvM1dHdHh2azRrTkFFVnRuTFBabUJzTzZ1U24v?=
 =?utf-8?B?NHI2WnFJdkZwNWh2cnFGcjR2a25nTzQydlE0MTU1TkFlREFRM2g5NkJtWWp1?=
 =?utf-8?B?SGlwTFNOS0p5MEMxRlZ6YllQSDFHNWVNREFMVzl5d3hsWXhubnpyMEkydWFO?=
 =?utf-8?B?S25IdFlOOFVCQUgra1FTMGNoTENLZjMzVFZ2WjZxcDBHYlNuQmJ2T2IyOXQr?=
 =?utf-8?B?YmhPZHFBMlNhempLeWRmdGxTYmhnMVZMTXV5VDRuOEpCZlVNVHZ6ZVBJK25O?=
 =?utf-8?B?MmVrRXMxUkszaDlZczZwaUtucFlRa2p1M2k1ZlR2OWwyKzk2K1JibFBtT3hW?=
 =?utf-8?B?NjR3UHY0KzAyTWpueHFNL2JkWUVHMlNBUnpMcEgrL1BCTWI1Zng5cWh3Q1h2?=
 =?utf-8?B?UlBUb2cwMkhFbm5MVjg4Q1FZczhTQTl5KzVnZjQyZkE2WTBMQ0pvKzlTR3Qx?=
 =?utf-8?B?eXptZlRoeENHTkt3UHB6N3BCYWdsaUJ1NEZXNnJDd2N3R0dxZG51b2pxdEZX?=
 =?utf-8?B?bHZhVUdwOFYzdEU2eXQ4K25raHpFNEZVaERhZno5YjdMek1PanNTNnc1VU1F?=
 =?utf-8?B?aExVR21RM1lqeWVzam9pa3lqSTl4Y3cvYnc5b3Q5WXc4cktiR0kvd1FKVjMw?=
 =?utf-8?B?QWQ3YXFmQmc2Mjd4TkxWOUVoRG0vZHJxYkpGbFhlTk16T0o1OFVmMTFBcEo2?=
 =?utf-8?B?UGRpSzJ0NjFBZmo4VTcwd3BPdVZ5SWNtRml0SHRnT2NrQTB6dkFxNXhxRHZH?=
 =?utf-8?B?RFExbExDV2ZoZzNNWDRBV2xuVDRUMC90M0NFTXRERzlBUjVzeHNSZ0RnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpMNE5KVDA0WU1OV0RpOHNZN2VoU3JveTIyMDlWVnFTRUNoSG9RazNRZXZo?=
 =?utf-8?B?N1Q4cW9vK1V0dVYydVN0VGpaQXVIS0NyZWFnbnYvd1hyaFNCLzBrUFFiY1pJ?=
 =?utf-8?B?a0RDZ0lEVEc2Q1ZmTzc2b0R1R1BkdU5pU1Rka3NpdFFKMUpvTE91U3dnZlZT?=
 =?utf-8?B?RWhJdGN0RVRjWWR5d3JNTDZuZDd0L0NoR2sxOU8yc1E4NGNlTXFmMU5lSUNa?=
 =?utf-8?B?c284QzVENkxEUm1HZjM2YjhVMTZFRkhNN29iWUQzUUhQK2w1ZFpQRXhoNmNa?=
 =?utf-8?B?OWRWVmE1aVN5a3Z2bWRlSlVIL21HUmdaSkxGOTNUOWs0TFZwTCsvU2N0NjJr?=
 =?utf-8?B?R1lmRWN0cGNOTGE4YUFmUkRjY25YYWNPYnZqZU5iT2xKVWRvRVdsRVhrdnlx?=
 =?utf-8?B?dEpHMFVreDdNRFhlelQvcldDSE9aMGRaVHhrdzdjWTNoU214MTIreFJhYk45?=
 =?utf-8?B?R092NGNMcDcxUXFsVVRIM2VNbmVLTXdLaW5VV3dTVStydFcyVGRnTDdFNk85?=
 =?utf-8?B?SHVWS1ZLbmxBUG9sd1hpZXJwQlVZZlNvcDMyZVoxVUFhWHo3aG13ajc2cER5?=
 =?utf-8?B?b1A2d2wyRUJnclllYjhUSyt3L1lkSkwxNitWNVBISENwWEZPU0tLVTFVSlpF?=
 =?utf-8?B?UU43OWdpZHJXOGZvb3U0SzhjTE9TOE1ySnNRaTVnK2lNVmxSS0Q3UU1yN2RG?=
 =?utf-8?B?RVY5c1dnUnVsTG9sSkRJRTNsdW9nWWc0K2FJUVdYV09IaTdvelArU3Y3aXly?=
 =?utf-8?B?b1RKeDFBdmJvbnJpa3ZrYTI5ZEtZMndTZ2c2NzhpaWlvVkJ1ZVBlRVg1MVNz?=
 =?utf-8?B?bEUrclBqSjNuS1NCc0FTNTZlaWtMZlVIT2ZiTUF2TjJKN0djZklUdTZTdVN2?=
 =?utf-8?B?QVFGTEhzZngvV2Fqa3QwRDNLeGRqWWhaMVFVZVhTekNiV1RZTitSemh4NDBr?=
 =?utf-8?B?elgxLytvbi84QUxmbjR4anU1a0VJeVFBUHdOWEtlZXk0RVhqV0NjSHJRRnpq?=
 =?utf-8?B?cjJzMTZ3aVc2L2FKbUxCUmVETXk2RVVrV1cyUGxqVU5JdWlVV3QxT3h6UU1Y?=
 =?utf-8?B?ek1OY1ZkZFZsZDlZa3Q0akV1Qzl3dGlsUklkYjkwWFh6MEY3UERVaThlQmN4?=
 =?utf-8?B?c0Z4Q3JrZDl0RW0vbEJrZ01STFhNNkwxOEJ3TGFGcW1qT2JqRTUzUldYcTFH?=
 =?utf-8?B?bDZJRUFCTlhndk5kdmx1RytYV01BbkgyY3pta0pGVUIrREtrRUxGczRpOHlo?=
 =?utf-8?B?TGUwdnM1ZDkxZ2tSOVVGL09XbFBkWW5LZk1IelMrR0h2UUdLLzdkS0pBbGZj?=
 =?utf-8?B?WkQ2RzY2SDRnK0t5TXZzbUJqckdDcnhYZnRkOXgzTGNBeXV2a2tBditrRVlZ?=
 =?utf-8?B?cGQvWlhoR2FmM0VtcnR6cGdxTTRIYVg5a2VUdUxCcEJRU2JlRkI4UkQwbEdM?=
 =?utf-8?B?MjZlc0V0Ujd1U2d0SXJNckY1ZWNUSlRtYjlWU3IyK2NXV0pZU3ViODA0YWMz?=
 =?utf-8?B?YmJkc0RpZkFqZDZXcW8xRWdCYWV5d3BQbXVLeERpaFlGZlpKdURHSTR4YXBt?=
 =?utf-8?B?emJuTGJMaDQzVnloQWRVYzViaGw0VXJnTTN3c3VHUkx2NTQrNEgzeGNnZklq?=
 =?utf-8?B?YlNUTVJoNnlyRjNUSmFzV3NDUlk3cFhhaDU4QmF3dGJPOEViam40alRGaG9x?=
 =?utf-8?B?QUFab21OWnJ2djJXNVQ4RTJ4WmFHQjM1Z2NlMTlxY2U0R0FDcE9uc2gwUEwr?=
 =?utf-8?B?SXM4UzZQZTJoNU10cERTRXZ2R0FsMFUvUnpiL3Y1WVlQZC9CdVdzbnpYL21u?=
 =?utf-8?B?WERQdFhvalhkWXhJSHAvdEs4eXdTVFY5S0thU1hZcUt3MFQwRitHU3hkMEt1?=
 =?utf-8?B?NkJrR3NxMHNtdWcrU2tyb2d4VlN2M0lIVUc3bWNFa21SMXJGRExpb0RwK0V2?=
 =?utf-8?B?anJmYWhNbHR1S2FXcEhWKzNhQ2xaS3ZYR0ZWUmJqQVdBZmgyYnEyOVFjMUw2?=
 =?utf-8?B?cUR3THlQYVVnQzFqQmlpVnJxc3dxQnEyVVBRWUk3STBENFhzQUg2WGIyekZr?=
 =?utf-8?B?aTI0cEdTdk5kSmhLSVRNQjNnUkNtaFcvMlREUFYvOXV4aTFWcEdScnNEM3hk?=
 =?utf-8?Q?kQTooAYxCky5AUg2lTVH6MyS7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6e1a1c-f854-432f-c1f1-08dc8524b613
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 05:59:50.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eBWMSzq+n3OgT/rz7+ZAYE3gLO4kebiVm4DOWMDnZD2qcvCmkzpHPyf1+DCSRL23UdLeIXx0nIFLsUeMpeuEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238



On 6/5/2024 1:51 PM, Michael S. Tsirkin wrote:
> On Tue, Jun 04, 2024 at 05:03:44PM +0800, Zhu Lingshan wrote:
>> This commit allows the driver to suspend the device by
>> introducing a new status bit SUSPEND in device_status.
>>
>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>> which indicating whether the device support SUSPEND.
>>
>> This SUSPEND bit is transport-independent.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>
> Pls put [PATCH v4] in the subject. git format-patch has a "-v" flag that
> does it.
will do in V5. Thanks!
>
>> ---
>>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..a47e077 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>      this bit.  For example, under Linux, drivers can be loadable modules.
>>    \end{note}
>>  
>> -\item[FAILED (128)] Indicates that something went wrong in the guest,
>> -  and it has given up on the device. This could be an internal
>> -  error, or the driver didn't like the device for some reason, or
>> -  even a fatal error during device operation.
>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> +  drive the device.
>>  
>>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>>    features it understands, and feature negotiation is complete.
>>  
>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>> -  drive the device.
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
>> +  device has been suspended by the driver.
>>  
>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>    an error from which it can't recover.
>> +
>> +\item[FAILED (128)] Indicates that something went wrong in the guest,
>> +  and it has given up on the device. This could be an internal
>> +  error, or the driver didn't like the device for some reason, or
>> +  even a fatal error during device operation.
>>  \end{description}
>>  
>>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
>> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>>  initialization sequence specified in
>>  \ref{sec:General Initialization And Device Operation / Device
>>  Initialization}.
>> -The driver MUST NOT clear a
>> -\field{device status} bit.  If the driver sets the FAILED bit,
>> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
>> +except when setting \field{device status} to 0 as a transport-specific way to
>> +initiate a reset. If the driver sets the FAILED bit,
>>  the driver MUST later reset the device before attempting to re-initialize.
>>  
>>  The driver SHOULD NOT rely on completion of operations of a
>> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>>  \begin{description}
>>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>  
>> -\item[24 to 41] Feature bits reserved for extensions to the queue and
>> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>>    feature negotiation mechanisms
>>  
>> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>>  \end{description}
>>  
>>  \begin{note}
>> @@ -629,6 +633,47 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>>  
>>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>>  
>> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
>> +
>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>> +SUSPEND bit in \field{device status} to suspend a device, and can
>> +clear the SUSPEND bit to resume a suspended device.
>> +
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND to \field{device status} of the device:
>> +\begin{itemize}
>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>> +If not, the device does not support the SUSPEND feature.
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any fields of any virtqueues or kick any virtqueues.
>> +\item The driver MUST NOT access Device Configuration Space.
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device MUST ignore all access to its Configuration Space while
>> +suspended, except for \field{device status}.
>> +
>> +A device MUST NOT send any notifications, access any virtqueues, or modify
>> +any fields in its configuration space while suspended.
>> +
>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
>> +
>> +When the driver sets SUSPEND,
>> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop processing more buffers of any virtqueues
>> +\item Wait until all buffers that are being processed have been used.
>> +\item Send used buffer notifications to the driver.
>> +\end{itemize}
>> +
>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>  
>>  Virtio can use various different buses, thus the standard is split
>> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>>  	handling features reserved for future use.
>>  
>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>> +   set SUSPEND to the device.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>  \end{description}
>>  
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>> -- 
>> 2.45.1

