Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC98C172799
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094053; cv=fail; b=We4kE01qe6fnUQoGOXFxk3nmkxJP3pWiZtN9sEVIZbxJZer1GLxmRhsWzDq0UhWEk8K313vGJ07ISSjgy+ikgkBU8LynUfKg8NrVD0BJSq5+GrTyGFRO7PykyZaaTmbUk3q1sGYa29j4nmU+lup6kqSKP8WV/pVmNFETMY6hgYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094053; c=relaxed/simple;
	bh=IG+wdygJwdNkfgXub99XM6KxfEeM4cBrXiJ/9kcYnZ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVzVsZ5AqnlXsrHnLCoH2YPhaJDWbB5bDMhYD5m78lw1zdh28ck1ZQpSZTDx03FKxHpX6X4J78+jLMGcE0c1iP+a2oLz10gQ9vCIXp7ylSIApCKTICZDxFt+q3yJNY84+GisdH+Ko1tVXZomGIzn+iql/65JN4lRYXEXJCKzYC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z2LNL9Pi; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z2LNL9Pi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dd14FvDZ9XzITsFobPwBv6BbcoCrTjuzEzvfJK5Iht2KmKPxL47QNmjUcBv1044wNlfE3uS9NDGlnHa3iQacLI8KuQ12nhRnP5fYQ2ww48HLQaULGK0ohQxQrnWgcxznMnvWjNTbrIoRMdbEc0sfkQ4V18WvY0CsFTpz1wj188Szbi0fdoi95WyKESynBmYaZMT7Da8R7FMfiy471IX+xC8Dnyyz68UVQKS/4iNgl+c1LaRHFiPL6hvWw5IQ6YgkwjQgHbdjV9+NCAoJx9PyAsyNcubaaos8+jAwInwdOz1GxV/AymmZfJ28/3ljCMw63reQMnjisZAkiD+FkUqGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hls6+B3Pm5UpqaOIv8uogqShk33VB2PqGep7w+oCPvQ=;
 b=TxEvZgabUWaG0AlNhTaytBHtpFfGF2OdRpbMAIvj2o4pZY+/GlXFJxVOxWBN30vU5mGW+4cFegpC0A/5T9/8AF5HKuYq5eKNL+7729vXv/9VnfiBFNEBC55fFc7rryaNTKfpDr+l4HPY5pb9Iq9+D1DgXGWBs9qYrf3NYVd8nxqjb7Ku3yBluKsSpHs1qTTT82tn85rP0fCJw1OUfgYLQepKp+CJYZOaXS3cmQfp97GRRGVymElXpFcUjtPVdHtG0xR29+MKkmvQL+HeivkxxMRzHQgRx6DZXDjTiTQ7BIclPeKqaqt8RjAZnehL6oU7Tyf/jnOvBhzPzXaORUH0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hls6+B3Pm5UpqaOIv8uogqShk33VB2PqGep7w+oCPvQ=;
 b=z2LNL9Pi8dK0F2qxxveQiWTZgqHpKE+BwAzOEi66OksJYmJIROaD1jCUQSe2Vkqx1CSlYXyqNm73t+Xf4dXviX2luo/PzDjk+kw/S5FmtEV/mpQffkcDDABO9I++IJwbtQAKigFTfF7WwJR3PqRFNkw75lzVtVaYQ2SZ54o4X4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 08:20:49 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 08:20:49 +0000
Message-ID: <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
Date: Tue, 11 Jun 2024 16:20:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Cornelia Huck <cohuck@redhat.com>, mst@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.linux.dev, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <87zfrskcmq.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: bc320675-13d6-4eb7-ad86-08dc89ef669b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjUxUEl5SG5PM0FXaVE1MVRrNWE4dnBCWk1BUXkxdzlNRDZBNWM2aDBNV0FK?=
 =?utf-8?B?MlhBdzdtczQ5SUI2eTNOMGh6WnVxcXFKMm0zdWVlWmh3Nnc4VG1STWdjMFVD?=
 =?utf-8?B?NEc3Y0VlenBlVUxsMVJnWml5Z0hqTlk3WDgrU3Uwd21qdUx2NGx1NmpRT0p5?=
 =?utf-8?B?K1Z2dFJ0V1ZxckdEbEVkZFZLbCszK1FwSVNCK0NKZjBIWUdZL1h2V1RxWjdy?=
 =?utf-8?B?WFpIT0l4VXAxdnE1Q3pmanBKQW1PTXJmZjNZRkhXNGNNYXBMSHlvWm1TSzlY?=
 =?utf-8?B?ZERqeFZkQ2JXN1VhRjFYSHFJTTY3czlXQTRuSHZuVnVaRG9FZmZNems4dWhr?=
 =?utf-8?B?MzI4ZWNORUNSMExQVElwakFXOUZIUzhWb1QzbkJzd1VxNFluQy8xT0QzZjJm?=
 =?utf-8?B?THlTVmFVWm1UNmZxY0ppT0x5YnRiL0tpQ2g0eXJmYU54S0F2OUpmc2dmNHZX?=
 =?utf-8?B?MEZZdWRJUHlSSVowKzZEdmFRY1NuN1piVjJMRnl0U0ZOa2diZFk2WTNrT2FM?=
 =?utf-8?B?akZwS3RJZ0tkNnZRcDZ1azB6WlRKRUtZdHRQMHNmT2M1OGRnd1dSaHk3dHoz?=
 =?utf-8?B?K0k0cGxNVEJJR0xCY3VkRDBIS1R5S296QnM1dUh4NTZmd3R1R2hBSGNVUHNn?=
 =?utf-8?B?VGxRaW5jRndCY01aYkJBUzJkTkNsWXJBdGlhN3JwV1JlQlZodWhsTklyUnM4?=
 =?utf-8?B?ZDdyY0lDNjdIaUh2Rlp3VHo2TUNkYVc5SjZHWHhOdnhYTUV4UEl2bEFiWFhs?=
 =?utf-8?B?NGxjQytQbjBoRnJwVnA3bmZLQ1lWK0NEeVB4aXZXczFoTlR2NXg2NlhSRjFM?=
 =?utf-8?B?RG5KMG9zYnFhaGloTGNJdENqUFhiNGV5MUo0ejY1RkdmWG0ydE9CYzNIMzhK?=
 =?utf-8?B?em4zTjFHLzk3NS95RVVPT0RxcDQ2cU1kUzZ1VHkxaVNaL0ZFb253Q3IveHg4?=
 =?utf-8?B?cHA1a1ZpN1REUkgwRFJqQWZPejVuNXFKRkhaaTI1WVpDMkdhVVdsWWR4cE0r?=
 =?utf-8?B?YlpwWXlJbnFjcm5jMWZ3Y01RMGdESXVhN0pNVVg5d2IwNVUycVk0WHZLZjNX?=
 =?utf-8?B?eGtRN0VTSGxUb1R4TG9FdGZPblp5UjRwampRd1M1M1BBMElGb25ScjRnY09Q?=
 =?utf-8?B?c2FNZUQ1dXdWT1NsN2diNkI0bHhUd0trQ2ZpK0lMR3Vodmx5WGhhYVJpNktj?=
 =?utf-8?B?eWV4MUhiR1pNUmV4cDB6T1lZYWxCdDg4VUhqVjd4K2NUMXBKb0k2eTdRMUo5?=
 =?utf-8?B?dGJ5Q0ROenI2V1g0TkpLdzNRdDJwNWVzamJ4R2VsbjhudE9WMWY1dFlNb3B0?=
 =?utf-8?B?OGw3YWM3N2w3S29RUlZYdWNTWFU5VkxIdmpCQm5KTVBSN0VsR2N4K0l5dzA2?=
 =?utf-8?B?QlYweVdBM0M5VUFLTnZ3dGMzWlVqRkNmUXpXUkFoRWhoR2g1Zm9lcXNlS2o2?=
 =?utf-8?B?ZGpsSlJFL1VPRU1HOCttMERtMUlrV1ZyWnliLzRyc2xIOGlmYVFETlZMVGNt?=
 =?utf-8?B?T2NocTZPS21yZERIUTR6OHNZcmRjdEppYUxZMENJT0NMOUJUMm5ORXFRZnVP?=
 =?utf-8?B?TVVacGlaQkg0ZFU4WVVkdE0zTktWcE8wamtVbXkzY0lZVlpsdWhHVXBWNVBN?=
 =?utf-8?B?N1Vlb1hldUE1TTJ6K0tKdVlPdjVFemVoQ1oxSkN4VVZSUjUvdDhWTDFhMDMv?=
 =?utf-8?B?OUdPTkN3M2YxQ3EybDRpenM4emFIelJTelBaSGEyZEEwSzNSeExXUy81dUlC?=
 =?utf-8?Q?kaiNLWhZWZA50D1VsIvzlpeBmE2GmlC07hrJGEj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmpUOGpmU3M1K0c0VEhEbjdRV25RNXpvbjAzRlI3VjFEakNucWtHU0RLd0JO?=
 =?utf-8?B?emVhOVp4ckNkc1N5ZnM4ZkdEUTZPclNGUGdWb2dMUDg4UXR6TElGUWQ1S3d4?=
 =?utf-8?B?M0JYWW9HcHBZUm1EOTdLc0dLQi9aNVFTcEdreS9ndkI3MWZsNUhOY3VvU3pn?=
 =?utf-8?B?bVhEL3JpS1A3RVdSUkxGOWFGdytRWXRLR1dreTF4VXFwa1M5eStwcXppSjlG?=
 =?utf-8?B?M3c2L3lkY3k0WXAxd3d6UUNTWHdrUVZ5ZzJ3dnhZbGZRMzRiMHV0MGFZR2tv?=
 =?utf-8?B?MmZMZDgrQ3Q2b1ErSTI0Um9DQVVWQmgwM3RXUmZBT2ZkNVVocVZWUm5kQVZr?=
 =?utf-8?B?RlBNL1B4V2lxSFNNcSs5MkNhc0NKaVpkbndnbURQNUFLc1RIUkx3OTBHdDRI?=
 =?utf-8?B?alNMZ3hqc0lHSDFPNE9yN1d0d0t5ZlNJSHI1V1J5Qzd0emd3SWtTYjFPRlRW?=
 =?utf-8?B?Q05lNjhuZDRJR1ZoTVl0ZHBrUUQrYzE4Q09Eb0FsbzFNRXhzVUZ0T2lyNUxt?=
 =?utf-8?B?RHAydnd3dTZENW1SVkRrNXFYeDlNckVaM2prQ0J1SlJjeUxUaTA5MG5Xd0Nv?=
 =?utf-8?B?eGlFQlFuVGZPMFFPdUpzRW9SdkxYS2cxUVBHUUcyYTlrSkpVT1BEbHdUM0dD?=
 =?utf-8?B?bkU3eG1raEs5WFo2ZHF3N2ZhK2djK25NWS9rK1BDZ1RXMG9WNThFem81VnJ6?=
 =?utf-8?B?ZWtXWS9UZFpxWVkwMkZnWW9NajVEZkNmb0pXcGphZHpvQmlxT3BnRzBIU2p5?=
 =?utf-8?B?SlVTM2ZXQzRISDl5UTdlWXhYditDZDJhVmxVbFc2aDBrTEtrKzZwTi9uMytU?=
 =?utf-8?B?YlFxMmROODV5bzFneWJ2Y0gvamF0NUVGaTJIa1ppek5TRUM5U2c0SU5Fb0Zw?=
 =?utf-8?B?dUZ1YVNNUlBXVVA1dFpKWHVOcjdHUWFwZndHREgxdHkyUDVxb09ROCt1cWZ3?=
 =?utf-8?B?YklhMmFlL3o1WTRJRWZGSS9QbEJmdWJER0ZwRTVidTlKUldOUDF6VzIyd3FB?=
 =?utf-8?B?ZkNJVzRhVUltdnRmWnJiZzNQeTdvVkE0ZFlCc05NWVVSZ0JTNSthODZKKzJp?=
 =?utf-8?B?a0d1ZDNsVWplSVNGTzhaMzVlN21aUm1CenpCVzV0cFJYd3RsL0VXQThOQU5O?=
 =?utf-8?B?SmhxaThPRGxER2hGeGt0ekszTnFhdmpraDV6WG1tWldNMjI3ZW1XdGhHT0Zr?=
 =?utf-8?B?TEZBa0RjcDUzWks0NExmNGZtcmlDRVErVFdoT2FJTmJBeWhZeFhKdzlXT1Qr?=
 =?utf-8?B?UExTdmxIWEtheUNRWElnUVRiNys0SXFaanlYT2VjeVlVaFZwOFZzcUlmZWRV?=
 =?utf-8?B?NllldWpjeDRkZXF3ZTZpS3lEOCtaME9kbi9BUFkrblRFQkNjTlZONzFtZWty?=
 =?utf-8?B?TUJESDNDeVRCSXpxQ1F3dWZhV0dPSDNBM3BNb1dlUHhtS2hJV1VaRlZnRW5q?=
 =?utf-8?B?L3JtUGU1SG5tc3M0M1VMSzdIandQWDI1Y3lHS09GejR4ekZRYjViK3oyTGI4?=
 =?utf-8?B?NG0xNXpEMnpqLzd5V25EdzR3U2hyY1ljTGhVa3VNWWZnYlFzRlMwL3MydXB6?=
 =?utf-8?B?bGNtOWNtUDd2WmZCTVc4SGRkY1YwQkJJUUdtdS9hMERHRzQwVVBxbHVPd09T?=
 =?utf-8?B?R0lCRDNVam9uZXhLWHZwUVViRks5cW5ZRG9rVE1kQmpYK1I5OURua1JmS2Jm?=
 =?utf-8?B?WWtyUll0VXlEalpSTU9CMUp3YUN1OFU1cGx2YzNsSFYrRUFHUnVRUjZyMlpL?=
 =?utf-8?B?SGs1WGkzUlE4cDNtMzJ2eGhQMDBCQlgzdGl0eHBpN2lIMW0yenMwYTRYN3Zn?=
 =?utf-8?B?RXpPRjJ3VFdBN2VuQTZLdSswbmtUVHBmVlM1Q1N6b0hudUx3Y1l1alg0Ri9a?=
 =?utf-8?B?UURucjhndnN6T3Y3UVZPWVZnVmVvQmEwL2d1V1I3d3hZT3BTWU1iSDNCcC9N?=
 =?utf-8?B?K0JSY1J0dmVFNUVSSXJZS3VtZ1piay94Q091eHBFYVM5ZG1iWjFQVDU1akNv?=
 =?utf-8?B?SlJrQ254cEJWMGpNTU5BUmpTYlcwMTVIMHk1Y1g1TjRRQXNSTEFUcjhyQksz?=
 =?utf-8?B?clRBaFZ2WW9ZcWpGb0N2UVRJUmlPMUg4VEZac3RNakZ6aVVmMGpDaGJNNERZ?=
 =?utf-8?Q?rB60n3qGFYbgacASkzf+0Jht8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc320675-13d6-4eb7-ad86-08dc89ef669b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 08:20:49.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZJZlnlLtn6YWz9dVHPckY8nz47xJrf/5GEJq88suSYkMrNHuAMEGudJxT2uIDQW5EhjwFjDOYu1QK0P5cwLjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945



On 6/11/2024 12:04 AM, Cornelia Huck wrote:
> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>
>> This commit allows the driver to suspend the device by
>> introducing a new status bit SUSPEND in device_status.
>>
>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>> which indicating whether the device support SUSPEND.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> Signed-off-by: David Stevens <stevensd@chromium.org>
>> ---
>>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 59 insertions(+), 10 deletions(-)
> Can you please add a changelog? Especially as some of the previous
> discussion has been lost due to the broken old mailing lists...
>
> (...)
will add change log in next version.
>
>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +Once the driver sets SUSPEND to \field{device status} of the device:
>> +\begin{itemize}
>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>> +If not, the device does not support the SUSPEND feature.
> That sentence is a bit weird: I'd expect the device to not offer
> VIRTIO_F_SUSPEND in the first place in that case... could this rather
> happen if the device is not able to handle the request at a specific
> point in time?
Yes, this can be improved

How about:
If not, this indicating the device is not able to handle SUSPEND at the moment.
>
>> +\item The driver MUST NOT make any more buffers available to the device.
>> +\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
> "send notifications for any virtqueues"?
OK
>
>> +\item The driver MUST NOT access Device Configuration Space.
> ...except for the status field, if it is part of the config space?
Yes, that is the original design, then I am convinced that the status fields is
not a part of the config space because it has a dedicated section in the spec.

I will add this sentence in the next version.
>
>> +\end{itemize}
>> +
>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>> +
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device MUST ignore all access to its Configuration Space while
>> +suspended, except for \field{device status}.
> ...if it is part of the configuration space.
Yes
>
>> +
>> +A device MUST NOT send any notifications, access any virtqueues, or modify
>> +any fields in its configuration space while suspended.
>> +
>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> "subsequently clears SUSPEND"?
I am a native speaker, but "subsequently" sounds like clearing SUSPEND right after "setting SUSPEND", I guess there can be
some operations during SUSPEND.

>
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
> So, is there any opportunity for the device to fail setting SUSPEND? I
> mean, if the driver is supposed to look whether it sticks, there should
> be conditions for when the device might clear it again...
The device should not present SUSPEND bit in the device status until it is suspended,
so I am afraid there is not a SUSPEND bit to clear if the device fails to suspend itself.

I think there can be two indications of a failed suspend:
1) The driver sets SUSPEND, but the device does not present SUSPEND after a while, depends
on the driver tolerance, the driver may assume it is a failed SUSPEND, like how we handle FEATURES_OK
2)The device runs into errors, presenting NEEDS_RESET.


>
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
> "that the driver can trigger suspending the device via the SUSPEND flag"?
Yes
>
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>  \end{description}
>>  
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

