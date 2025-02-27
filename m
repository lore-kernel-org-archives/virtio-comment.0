Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2245227599
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646810; cv=fail; b=RtZXi2s/gIC8UAte+tSddhYA5q+qIEQepCgUx2xPJDZLcfIMHT5m4SPH5UsE4S0FxAaLBV92SDoqvYa1Kwn3qaLCVXbhBQ1L06Ai0rdhzV96T1UEZaaluRiBQbhij0IEW6RlH/KLld7iIKtK8BIKBxd1eq79kYgaatDIDRmoSJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646810; c=relaxed/simple;
	bh=U251d4Rnk9sOfx4cqLCbRuhwctrBOo0cyQaNag5FD2s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jf5JRocJKKpf8OCU2yg/ZUD1eR6Ev4N8j111tNbTzkYmE0yT8dnOQyrUiCp4VuEJqtnHEzhIFl26uYhFxsCIxnT1BnfDC1ffiYvypmrBAKpfQK93EbqzaKeSOpWZB3JXLz4bNv+RdFa1Gbn9rBvTTHQyfufIJmXtH7Qld4KIDgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GEmfQW+j; arc=fail smtp.client-ip=40.107.236.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GEmfQW+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwUyZCKXYn+PHuSYiDkN+Cpgb2YYODB5gS59qNLAbPvQlPpxB17l9N0G9T0S/YV07rDd8Z8RXhomgEjIrES6cIoriv20/fXoEVmSV459BTCj4p79zE+2snWRpq3+8Ldxlie+pPlI8MdMXmgW+p79xc2v4gUvomdR1gcUcu7PiNzpfqXlC/rR0dDk3dowGDmBAxlIBIGWPt/GuULTr++WtzwgYQpD2VXeQdiyIHvqKghyDaA285BIA/ThjyP6ceWo4CnU41vrjmWEqDOTjQxmANwRBbJRQbOxsmdiwtaYMy6bdd9Pv0ViGOORnBezwqWKsx8lgnNRTSbFRdEYJGeMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPXjnQGACdoMSUwXuBTOnwiOdoiLx42LOaZOLhlYRYs=;
 b=Tr9q27IFcqD533y3rvyIk7UrnDMs9peEzvE67554MUDZxqd/T8/tnVCrYqVeFZ6e8ppwGVTRF3zLPAKgMV0u0+JxiHg9sPWoHb7gdAKKuqDaWE/kDWkkIO17MnMldMI4q/iWv6UlK5MLIVc+nBzN2jnBhtuyjiPFPGS80GWA+/wGFR1JZcDTyoT3OesxoaceLJi7h/rr2G+ZtUnNWAPXtSRxJtOW8MV8+YgZdiCl2INoFO5SkoZmKvV12Z7ihtoHEEWwB03jaAt2tSfxY+8xz+Qpi39JBwqpUmjoFKmpqYgOL2JPRquyKoURHATj6aIeoW4C5bvBf2mV6OJJM67AgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPXjnQGACdoMSUwXuBTOnwiOdoiLx42LOaZOLhlYRYs=;
 b=GEmfQW+j/uMnsWQ+XZReksCqfUKmEHVtT/taNwQ+lvTa4Nm75VATVdvXY0/pTm78Nd2wHa9maNvLUwO//fwhllfDGePcqUOSDOMxPmL4W4BUjQ8/rVzXH3tMJl/Hbc/7TX72myODdvjtfxnhH1uLkbM8/t3kNl9WOnQEXXZTvVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 09:00:04 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 09:00:04 +0000
Message-ID: <41bd1e1b-805e-4a11-b2b8-13dfbad246ad@amd.com>
Date: Thu, 27 Feb 2025 16:59:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org>
 <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYBP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::17) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 91810478-c3e6-4c31-be72-08dd570d1fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUFWekpHZERJdVovbGVQcllnVDNBQjdpb0tyTUdvbWJMdFUvZXkzbXpNZHJo?=
 =?utf-8?B?MWRIcEVwNGNwWlpMK25NMWZMeUpnNkVpTXRyZTRwMDE1cGcxanlyRzdTdWFU?=
 =?utf-8?B?MGYrNUd1eVJyQmt0cElEcVBMVFFLZTl3UG1yajB3dmM4cGpwdUhvcEhrSitI?=
 =?utf-8?B?bTA5MFNoeS9aZDA4RHg4b2JRTEJXZW9rb1plMjc3R0FvL1lhRkUzTzA3YzRy?=
 =?utf-8?B?Ly9kVUR3azZDSXhhNGVIUzgyVFh4Q0JNRXhwRjFpNUdKMGJldmEwRUxSdjZh?=
 =?utf-8?B?TXlwdFp4aE5DVW1vSEdubVcrOFRWSmJKT08xSTNIRHBHclE0QUxPMEhFaWNS?=
 =?utf-8?B?ZkFseHNRRHowSi9LVXZmdGpuWHVRejg2dTZkYXJJMHVodWc1Qkx2V1dVMzdo?=
 =?utf-8?B?RWVJRjZHTXAxdHo1ZDhBUS82MUxYM2UvSTBhalo5OXdvd1YxRFlqcEY1U2lZ?=
 =?utf-8?B?WmkrakdMR0FhSDdkRTEwTTBFK1dJdWhhdjJUNnkxaytqSWNXTXFRMEQ0dkIy?=
 =?utf-8?B?Q05hbExXeTVHSGpzcklUdmVMY0l2ZjljNW8wN0ZFWkN0N1RtTXRlcmhvc3Zz?=
 =?utf-8?B?bjU0Y2EzSEV3alZqbWNlMlFuK2ZKYWZJUStYcnF5dW9Td3NLMmJ6SjNvdjYw?=
 =?utf-8?B?QUF4M3ZoUXFMeUdyTk5wTEJ0bklIRTNLeThXR0NBSDUzK3dLdVFGR0VoNVdL?=
 =?utf-8?B?cjNSOUV4VElVUG9MenEwckptUnRldjVYYStNUmR2dFF5em5KSU82bDI1QnFr?=
 =?utf-8?B?ajhieUhBWHYvNUxxdGw0dy8vNEJYN055dVpxcTdFclNBYTNZdG1ybHZOL0hQ?=
 =?utf-8?B?My8zSGg5TjRjSEEzTk5JZ1BxQmplbWRURGZaSU1TaEdvS3pqRnQyMmw0S3hj?=
 =?utf-8?B?TGFqRzRJaFl2QjM4ZndNV1Y3eVJ3cGovYUI2cjNES2ZBNGpKdzB0SW1mQ2Zl?=
 =?utf-8?B?djhZSGlyQ2p6VTVESllFVXpuVDYyc21neEhXWmVqam5jalg3VmpWZkt6QzlH?=
 =?utf-8?B?ek1hZjZaRDBqZFJIdGk1djV3MzdlaVdzRDJzMHFLZXIwTEFyRm9wZTVRSmRt?=
 =?utf-8?B?eUtyMEhLSUxLVGpMOU1yTVdsSnBNeFMwRE0zV2dBN1VPNUdDNkx1MEVkcEpj?=
 =?utf-8?B?NGFlcXlkQXRXU0xlQ3NvblgyaHM5N3R3NmxQM2NFRzZlV0ZTYWt0ek5qa21T?=
 =?utf-8?B?ekpCK1JuZ1pSU1FMOTYyYzFRa21Eekc3aDdBbHM2ZE02VktSdUtzU012M1VV?=
 =?utf-8?B?SjUzWjIzdXVsSk5xSGgyTjVYOG5HVEowMzZXd2g3NTU4bHhQWGcrVGx3VWsr?=
 =?utf-8?B?YUdKRzRTQXJhTzZRTERVK3NRZEU1YXR6Vjk4aHJJKzZGTk1KdUtWQ0hJREpv?=
 =?utf-8?B?SXVLNmozOXZqREZqcDU1VnNDZkFwUy9VUWx3VjNta0s4Nkk1MTJGSFQraWJO?=
 =?utf-8?B?VEc2QzgvTUNjUHJmOGE0YTJlUE93cnVwVVJSNWJzTVJnR1BJRER5aTduelZY?=
 =?utf-8?B?RHBDaWVtYzFLYTJxeFp6b2ZoV2pEaDM1bXd3b3gxOFJFc2NweThaSFVQWllP?=
 =?utf-8?B?UEN5VkpRZTdDeW1DbkFKWjhMaVBkdGJEUXhqc1NHVS9hQzBCbkxROHBqTmJx?=
 =?utf-8?B?c1lMVXM5a2xYeE4yaG5XWk5jb0l5TkdIdW0yNUFyVVlVL2Z4VjViNkwrQk01?=
 =?utf-8?B?ekU4cmhyb2NhaXBMZm85UFUvWGZiYTE3MWNRNXQ2UDI5aHBNSUFrcDlrTVky?=
 =?utf-8?B?anpVNHJCWnI3bHI5WHJ6VWVXM3lwbCt2RmdPNlYvQ1g5SWd3SldDYXg2K0ww?=
 =?utf-8?B?bmh5amFobzMyckVmYkozQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czQ3Q1hLZjJRaTBaOWUzMGhMZ2NzUlZsVXluTmpqQXg0V2R0NWlQbVFGQ3gz?=
 =?utf-8?B?VFNuQSsxaEh2UkgwMUMwd3hIcG40Y1lYQW1DdDVWU1lqVzg0ckdDeFdWVncw?=
 =?utf-8?B?WnZld3FsM3JwclFFajhHMlVESzR3Tng2S2hObHFYZkZGMGt5WXpTamJjVmZq?=
 =?utf-8?B?K3hoWVBCUlV3cTJoZEFVNmIvUUswU0JqcXdKayttZVF0ejlCaWN6V1hZUWZI?=
 =?utf-8?B?M1lZdmJGNkp3QWVHUGFwSHA2bWNHTDIzOEhrRzI3Q1E2Q25IV1FqNkFibWVh?=
 =?utf-8?B?OG1JNFFxYUVta1lhS1VKUURSVW5BSlM0U2o4Q1hwa0xqZHJEWHZqN2pqZ09j?=
 =?utf-8?B?Q2Y1WG95ajVKZ2c2ODV6NksxcTBGUFFraGhHTVlyaHJDNnEwM1gyelEyT1BM?=
 =?utf-8?B?TVJlNmkzMHY2N20veEh2ZDI0VnpvV2xab21FdDFYbmEwSU12T21zUmdPd04r?=
 =?utf-8?B?M2dSbGxSY0NkN3oyQnVLZEYzSW9wUTRobStFVFJOZ3ZNU0VJVEUzREI4aDc4?=
 =?utf-8?B?MmZYbFQvUjJDdjFSZ1B3WnhodW16OUhTc0E1YTVnVEZTWTBhMWhPQmEyV1Nm?=
 =?utf-8?B?VUR4QnNMcGM2YnRyR2FBTEpKYzJnbVZsSXpmVlRabmFRbHpjRmpqbXVudWow?=
 =?utf-8?B?RXJOc1NDYzQ1NnZkeExwU3U4RHlxeStZalQ4Y3FpamliRUNsTDRoT0gvWFhV?=
 =?utf-8?B?NTR1eHJSK0R5ZEpNbWlvKytVdUpBRml4aFBhU1JnR1dtaFVMQmtuWXZlelhQ?=
 =?utf-8?B?Z1YzSkVFdGpNa0FWZlVWaHB4ckQxSnZsbEdYZGVoRXArRlpnTE5YOE54ZzVG?=
 =?utf-8?B?UXpnNUNEcmRGd0szYkw4bzVscS9qUGJ5aldScTBzNU1CeW5iT1lsRU5MRkdm?=
 =?utf-8?B?UGlkTWtkVWJralNQWktFMkxYYTBGMU9vN1I0SUQrdm5nTjgvTG1kWWhEbWJj?=
 =?utf-8?B?QTNwNDN1eU5HbFRWalNYSXlCK0xoc2RSa2YySVZla0FYNTZIWkNmNkhPbzgy?=
 =?utf-8?B?OE10KzRwTUR2eEZzbncxVkpCbGJqWTUvRUFRTmJOYnVKZkJBTkpZMGp6RkI4?=
 =?utf-8?B?QXAyN1RzckhhVXZ0aGNxU1BjNzFYUldGNnc4MitpZ2x0WVJCUUZrNlhHNFpS?=
 =?utf-8?B?czZLeTk4bDBBazZKa1RRdzZOUWNUQTJBdzQ0V3dlVkRwaGJzdXVDZnpqNFpP?=
 =?utf-8?B?eVM2VzYzVVpwYVhGdzRLOVA1U1ZURFJVU0p6WnRsOWNLMklrdmxZU2VYcUVK?=
 =?utf-8?B?TFVta2hrS21UR0NxUUZjcmZZMUhMWHFkR2tlM0NVbnUyNVZZQnJGN0dKdWJV?=
 =?utf-8?B?QmJVbFVLY0dadDI4OGtHaEhHbjJnT1hITmxkT3M0Z3BOVEFXczdFUFJ2Y0RL?=
 =?utf-8?B?NFc2a3VIWFJvRExKQ0pKanZOcVpKR2x4cHhRYm1YbVArR0xFNE0wNjM5a2gy?=
 =?utf-8?B?U05Db1hKMzR4ZUN2dlZvRThnYUtWQ205ZGU1OVR0WlpkUzhoc1BCSHV5ZU1F?=
 =?utf-8?B?bGRTQkR0WXh4Yi90S1pkQ1ArOFNKcWRhbzZVeHZwVWpBdWpKSjFwc0o5am1H?=
 =?utf-8?B?eDF0eTdhWlNpcXVXc2diVHBybTZ6czlrL2RDMHcwQWdBKzI2ZEZCZ0NQT1Jz?=
 =?utf-8?B?cmpiVWdoVlZXUlZjUVdxOStPMnBqS1ZqNUZybE42c3J4OCtpenRmQlY4TmJk?=
 =?utf-8?B?NEtQN0pJVVQwdzZucmpyZHNTbkttMVc2RVN2RmFPSXpseW4xUnlZU2UxOWo5?=
 =?utf-8?B?SHpNSXFoVnRwdzFIL01KZVhBb1oyRnk4QU5OVHRMYnBkVHl2NWZOS1V5ZCtX?=
 =?utf-8?B?TWZNekpNMkR0OUZPVmdlUWQrR2M3aW9UUGpPaVJyQllMdExGVUM3WGhmVnZy?=
 =?utf-8?B?QVpFazFyY2I0OTdtUi9ScWV2V1FGalV2NTJCR24ybTlNbUtOaTRpOEkrUUlp?=
 =?utf-8?B?L25zTnVlS1grc1M5eWtYdXM2aDdTM2l2NFRicUxSdG90YmJWbXI5MFZwdTh5?=
 =?utf-8?B?bEJJanpRWDdrc1BibzBRandweWZCTTZSMDhGUGdrYXE1ODUyS2dGZXQ5Slk5?=
 =?utf-8?B?RGV4d243SExPRXlsRlhiMUdMcGIyZjdJdmhOTXBxZ2NJMUlmMHZEWjJWUXFk?=
 =?utf-8?Q?AsdLlk8hOQ/0Z1RHYcn6Si6ug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91810478-c3e6-4c31-be72-08dd570d1fff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:00:04.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRZIeLI6R0uFayjCW+PMxX7/iPdtmRR5BDuNwMlUPDj5pUdfHSL/fpAL3PiWq8S6ur9+Xtk4LSURg+biSDuISA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151

On 2/27/2025 4:32 PM, Jason Wang wrote:
> On Thu, Feb 27, 2025 at 4:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
>>> This series adds the virtio-msg transport layer.
>>>
>>> The individuals and organizations involved in this effort have had difficulty in
>>> using the existing virtio-transports in various situations and desire to add one
>>> more transport that performs its transport layer operations by sending and
>>> receiving messages.
>>>
>>> Implementations of virtio-msg will normally be done in multiple layers:
>>> * common / device level
>>> * bus level
>>>
>>> The common / device level defines the messages exchanged between the driver
>>> and a device. This common part should lead to a common driver holding most
>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
>>> The kernel implementation in [3] shows this separation. As with other transport
>>> layers, virtio-msg should not require modifications to existing virtio device
>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
>>> main focus of this version of the patch series.
>>>
>>> The virtio-msg bus level implements the normal things a bus defines
>>> (enumeration, dma operations, etc) but also implements the message send and
>>> receive operations. A number of bus implementations are envisioned,
>>> some of which will be reusable and general purpose. Other bus implementations
>>> might be unique to a given situation, for example only used by a PCIe card
>>> and its driver.
>>>
>>> How much of the bus level should be described in the virtio spec is one item
>>> we wish to discuss. This draft takes a middle approach by describing the bus
>>> level and defining some standard bus level messages that MAY be used by the bus.
>>> It also describes a range of bus messages that are implementation dependent.
>>>
>>> The standard bus messages are an effort to avoid different bus implementations
>>> doing the same thing in different ways for no good reason. However the
>>> different environments will require different things. Instead of trying to
>>> anticipate all needs and provide something very abstract, we think
>>> implementation specific messages will be needed at the bus level. Over time,
>>> if we see similar messages across multiple bus implementations, we will move to
>>> standardize a bus level message for that.
>>>
>>> We are working on two reusable bus implementations:
>>>
>>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>>   * normal world and secure world
>>>   * host and VM or VM to VM
>>>   * Can be used w/ or with out a hypervisor
>>>   * Any Hypervisor that implements FF-A can be used
>>>
>>> * virtio-msg-amp for use between heterogenous systems
>>>   * The main processors and its co-processors on an AMP SOC
>>>   * Two or more systems connected via PCIe
>>>   * Minimal requirements: bi-directional interrupts and
>>>     at least one shared memory area
>>>
>>> We also anticipate a third:
>>>
>>> * virtio-msg-xen specific to Xen
>>>   * Usable on any Xen system (including x86 where FF-A does not exist)
>>>   * Using Xen events and page grants
>> I am also interested in virtio-msg-admin-cmd, sending messages to VFs
>> over the admin commands of the PF.
> One more thing, there used to be a similar proposal which is the
> transport virtqueue which also defines the message. And it has the
> chance to be unified with the admin command. Need to think about the
> (dis)advantages of each proposal.
Here is the link of the transport virtuqueue series which is a joint work of me and Jason, defines transport and commands:
https://groups.oasis-open.org/communities/community-home/digestviewer/viewthread?GroupId=3973&MessageKey=2b081938-40fd-4096-83c8-a2a9f99a4103&CommunityKey=2f26be99-3aa1-48f6-93a5-018dce262226

This series even takes admin sub-devices into consideration, so shall we join hands for a total solution?

Thanks
Zhu Lingshan
>
> What's more, if the actual method to send and receive the message, can
> we still call this a transport or not?
>
> Thanks
>
>> Thank you, will review.
>>
>>> This series is a work in progress and we acknowledge at least the following
>>> issues we need to work on:
>>>
>>> * Conform to virtio spec nouns (device/driver vs frontend/backend)
>>>   and verbs (must/may)
>>> * Perhaps move error definition elsewhere it the spec and align on its symbols
>>>   and numeric values
>>> * Allow message size to be greater than 40 bytes and allow bus implementations
>>>   to define their max message size
>>> * Add a way to discover the protocol version
>>> * Add a better description of the types of things a bus can do, specifically
>>>   including out-of-band notification and memory area sharing/discovery
>>> * Maybe redo configuration generation handling
>>>
>>> Background info and work in progress implementations:
>>> * HVAC project page with intro slides [1]
>>> * HVAC demo repo w/ instructions in README.md [2]
>>> * Kernel w/ virtio-msg common level and ffa support [3]
>>> * QEMU w/ support for one form of virtio-msg-amp [4]
>>> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>>>
>>> In addition to the QEMU system based demos in the hvac-demo repo, we also have
>>> two hardware systems running:
>>> * AMD x86 + AMD Arm Versal connected via PCIe
>>> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>>>
>>> Please note that although the demos work, they are not yet aligned with each
>>> other nor this version of the spec.
>>>
>>> [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
>>> [2] https://github.com/wmamills/hvac-demo
>>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
>>> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
>>> [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
>>>
>>> Bill Mills (1):
>>>   virtio-msg: Add virtio-msg, a message based virtio transport layer
>>>
>>>  content.tex       |   1 +
>>>  transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 681 insertions(+)
>>>  create mode 100644 transport-msg.tex
>>>
>>> --
>>> 2.34.1
>>>
>>
>

