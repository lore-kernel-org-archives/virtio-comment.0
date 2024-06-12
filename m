Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940916DEB7
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186048; cv=fail; b=ZE1KK9+cZUJTNucbLJuJvRYgIl500sYmvcfE+6rW8j1Q8kzQWmOzc51eClt70foeJ1hBllmILtTPkCqvvpVQ9VsKvCYR2YAxh+NqjMFK9cr4x3wZzUKmrpgQW2qFwqsRqTRn5CQye4igNm4bjmIIvRFBkkGWRKP+5PYtn4Omi50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186048; c=relaxed/simple;
	bh=JL7RoKVQXoV7a2FcppSS6XqS0TQpIs/ebktUh65E+sU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c6UsBUVkE8DQC4882slICariDG/QGZhDWg/diaw0NdjDYbm4yjBI6xTCFRtKwny2hrA7nJaD/egPJ7J+sLqOgCgMxUHikRR4gfQ0dw+FpE3U7Tdou9ZQvs6zT1XTBNeF652MfyS7GjsDmVfxK/uWgymQ57EDclUYngXxurCXwhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aTn2VrXa; arc=fail smtp.client-ip=40.107.237.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aTn2VrXa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzBWfmQQx8MtXbmyKCmi2tdOFgdwLz/dWCtlY93GsFCH7i6JtFxgi1aFaKQgSGaOlOclTMePP08zC904x/mMCPaDfl9kcJc+DU6fHwdjwzhau+RvSTn4sK+bQP5j8dCjUkX1LPEDOVo0bqI1zTtAX66B2wgAov+avUKXMMHs7n4svwqMxSZJJtbBCh5/ZjG9U79hsnCn6aQZ4LzzEZptVi9O3l817Va72a/M3kZsXHyBLk8TugESCzhNM6UNwRpKCButv/YW9LZOfDJ+0Yu5bpdKOZvMbjbRDTmq+WDiChkeOPV4viwpd+i5d0ELmd4qBztAtMYkCpZ0YsVA5fW5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BAC9akaBJqdmGp5OyJxy6kdsp5O62ExU11TxEaVpGM=;
 b=m6FWJVnyWKZaFXG8twz0uQtQjFm+8duB6C4o0E5bD0OGaMlQ9txIj0Z96Zg/IJ+ljlMt4cAtAjZhb8THYv+8ZbJeZ8suL7ZsqSHH0h9OlEuBpNpaet9EFoJANcAbyOlZ+IRzUFQB8jhBh2Va3ivHXxWLby2F7p+57x6h+nUEh31znz3Dfw7I4U17yPfUWqj5FT9jOplJpiBEDAsXcre+llJwZPW8myAHUA3SO6JTM3Jv/4j/PaLKOUNgyE4h6lKPE6mjvultzEAjc6w/bBxZynIsdlL5vz6BRHpzz5UWmktZY7FqdN3EFuBlBjkBGF+V2Qb4k5YzdbzW8Yu3cSVIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BAC9akaBJqdmGp5OyJxy6kdsp5O62ExU11TxEaVpGM=;
 b=aTn2VrXal8ltvelNcZ+NTjxl+XmAb4AJo547TauS2Gc1sFpTO0NJbMgAwFBSDvyDcd9N/o1OOjyjaZeMgz4FuVhPPeNus5HgERZW6xxyYqvvj9iXsUJ+XfK7XsWV0ZTn7U0E8T5Zsj5aRUwg4ZYRKNbC2GEZnlTwFb/SeZMp2K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 09:54:03 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 09:54:03 +0000
Message-ID: <4e53d29a-9a69-41a5-a91e-1b66db6697d9@amd.com>
Date: Wed, 12 Jun 2024 17:53:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, jasowang@redhat.com,
 virtio-comment@lists.linux.dev, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com> <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
 <20240611122132-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20240611122132-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:404:56::31) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 001dbd9e-a720-494a-6530-08dc8ac597a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|366008|376006|1800799016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEYyMzhrN1J3TEw0ZHoxckFmRnIvVTBDdFFFc0Z5UVNlTFMrWm00cm1yaEZk?=
 =?utf-8?B?TGRka2cxd0JobThReVgvaHVoOVllQ3VCUWliNy9qVGVGdU1lSm9yVnhMeU5n?=
 =?utf-8?B?eE50SzB4dW1rUjlQK2N1SU44V2daU2gweXErYlhHTnJQY0FNdHlMSVZNbzdH?=
 =?utf-8?B?anlZVnpXc0Zpb0xYQ1JpRURaeWVEUTlZZkROcjR6eEhGUThBUXUrWTA3TlRz?=
 =?utf-8?B?Szd0VEh4VEdqaDhxYTFoSlJ4TFhnNEwwNWRrQVBjSGltNGtSNHppVmtUcnZv?=
 =?utf-8?B?Y3FNQmYwMllMOWtKckdTTDd3eTdrSC80aEJya05ZSmRON3pYaEQ0Vm5NbHNr?=
 =?utf-8?B?aVYwRWNzc0hLNGlXNW5SQVQrVW1JWjA1RTY5OCtkNm9TcVF2SVNKZld0UHV2?=
 =?utf-8?B?cjR1N0xxckNOTVp3OGsxWHFHMkhwVC9ESlBPbXBjRFEwR0Jmay92SnAzWnd4?=
 =?utf-8?B?c0VjZEV0MEhyb2g3NHFCZ2pKTFk0amdDcm4vUTBJRDc1YUlzdUE5MjJvSTdW?=
 =?utf-8?B?NU9xdnpXT2JMNnlTTUxhMVN5U2lqbnM2VFZrNjhXY0hXWWpMZUR2M3c4czVq?=
 =?utf-8?B?eFBWQldYdllkcStqWjlxZjFDbkNNS1ZNcEl5VWw1aksyaGNNYjkwUTV5eXlw?=
 =?utf-8?B?TnE1M0VjWEpieTVUM3FBdUJYUXBhdGp5dDhONk1Da2FveG4wNU9QT3JtT0hj?=
 =?utf-8?B?dCtzaE1yNnFjenlyU0h6WVlhV3BUbmNnbDZWUDhKc3pYdUFjTjZDdzhydHd0?=
 =?utf-8?B?M2NtQzBIdGpHZS9JcSt6WGl0VHBteTNOWlNqNzkvOEQ1S3RWMXNja3Zya0ZF?=
 =?utf-8?B?a3F2OXZ6WEt5NUNSTW9OUmdFLzBXUUUvZ2dQVUJWdjgvUGV3azJacDJEK0xU?=
 =?utf-8?B?MzB5dHZ4QmhzUkFHQ3M3YlhWd3JZVzRtQ2VMSmRoTUZpKzlNR2xMaWVMZlNm?=
 =?utf-8?B?K2JKU0ZCSWVjY09YSkg0MjR1YTdLM051b015eUpLdGtYNlpKWElvT0xPc3pl?=
 =?utf-8?B?NmxHQ2FUbndkbmhJRmJpQ0hOd0t1UEVPLzJlVlMvT09PN09xNU5lTy9TRXlG?=
 =?utf-8?B?Y0pzZk1jcFAzd2drQ1dmcDZRWkx3TGM5M0N0NW5aOWQrNEtwZDBhUjJZb3B6?=
 =?utf-8?B?VmlpZHRsRHZYUXdacnBjZGYwVzBaRzYyNHh3cGVkZ1gyL1FoMnA0ZlZaMVNx?=
 =?utf-8?B?SkFJVTdGTEJIYUlnRmpvcnRDamM2WURlL3hocVZBR29yQ3czSHE0dWpldFVH?=
 =?utf-8?B?Y3Z0Ni9XV0RxOHdFazIxdDJIMnJWMmhRdXEvWGxhNXI1Nm1ObldvVnJOaVgz?=
 =?utf-8?B?cDkveVdUd2J2Y3dIdnpVNzE4eVc5bkh5UWF4bWY2eG1HZGVubkhEVVJDRXJx?=
 =?utf-8?B?alhqNVUrek5PbndWQ0ZkVzZ3eHJqdWFOZXNPRjlyN2NzMFlDM2lFcXViR1Ar?=
 =?utf-8?B?aHQyVTdtQUNYRCtmRWJrNlZsQm02Q25LcENBazVjOXN6OVUzd3Z4Y3dzOUs1?=
 =?utf-8?B?WkMzRE50NTdidmVnR3BwYjRjVE1KTE5aWGY5MVk1Y0NxNHdkbEVyamplYlor?=
 =?utf-8?B?ZWhWQlBXRjVWRWZodUY3WVdNUitiT00wL1Zzdy9FeXdWbWhyclA1MlQ4L1pq?=
 =?utf-8?B?Tk93UVB3eUFxdVpHRklUSEFmaHZrRWNUa0Njem9DNm8yZDFrOTdzUmpOa1Bi?=
 =?utf-8?B?N1hGeHRaSmlKaC9ZWW5yekpTdDRjb21sRDMrVTFXV3BHMWJQR01zS1pibHFu?=
 =?utf-8?Q?pxN+63WHKJ3pkKYSmfKfQnE5uUd0weWf9OsGcDO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(366008)(376006)(1800799016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnlWZzNpVDRyV0dMZWF1ZHdDM29hUHJqdmdGcWc3eFZweTZJNHhLNnR2ZmpN?=
 =?utf-8?B?d09xQU9HVFM1RzFyVkR6WUQ4ZVJWdXowNHVyVnV0Szg5d0R0d2FNVVhhVlJv?=
 =?utf-8?B?cWdSOXZOLytUM3QwSUNJZFBOcS92UGY4M3ZNSE9KS2wrRER6MXBLMVc0WkNv?=
 =?utf-8?B?clNtcXc5MlIyUHZxZ2xRWS9YNGNoTFhac3RYVk8yYXBNbjJMakw3czdTTmtS?=
 =?utf-8?B?M1U5VVNWTFh2UU01ZGRQd1daZm5Udmw0bUJQTHBnbE9kTXJnaGF5NFphVlZm?=
 =?utf-8?B?a21zODZpSXA5bVAzU1puMGhFM3M3NnhQV1A4SUE5YkZySUQ4MzhxYVYwNndH?=
 =?utf-8?B?aFpMZVVCWHFVRkpjZzhLQjVKc1VoUzJEQ1hWRVVHNTRBWnRQVG9lOHlRLzBy?=
 =?utf-8?B?cmFhYUUrOGtBWStCcVVjWFdWUXBJMUNGNUY0TUdWYzVnamhhdTVWSGlSU3lN?=
 =?utf-8?B?OVRNVzVUNWJaM0ZiMUE2MVVDTzYySlpUUVE5Q29VNDhqZUVWcEZydHpEdEgx?=
 =?utf-8?B?bWpOT0VwYk1obUVXOTljZGZkV3F4TkVQeFhTQkxrK1NsazhTOGdLdmRxU1Rv?=
 =?utf-8?B?ajRZTHFORElhQTFVcjhkVnNEUm1XdjB5Q21kMG9pcnNKbCtqODB6N1piRVhV?=
 =?utf-8?B?V1c4TWNnWEZaSk1FYW9pWFVXU0txalBDVks4clYzODVDNTh0NWpPeW5SQXpL?=
 =?utf-8?B?OURKQjdpV3ZkYWFDRjQ5RlpWMjc1U0hJTzdRd05NWlR2Z3dCYklib3IxOU4y?=
 =?utf-8?B?MVN1RGVYRWxrQ2psMDMvbFpCZStUY1NmTlRmQjRVS0pKeHdsZE1yQ0lPWURD?=
 =?utf-8?B?bUU4SE5Na3c5L1YvV0dhSjJLamJpZ2lVMXc1VWtjMkdGV0VRSEt1RjZRdTR4?=
 =?utf-8?B?WDRNRVRJeFBvT3UwaWFxRU1zV0xtR1hqSE9xS0p4eE5xSC80TXNkZGlGYXdV?=
 =?utf-8?B?NmtwOFVFdnVva0luV0R0cm9XOGJuWU5wYUo5YnhTQU96V2tIK3l2R240M3pO?=
 =?utf-8?B?QzNDNStiZzhGZmNwUVZSRUZYZloveEtrVGR0MXIycVQ5b1BiNHFQQzNSRW5w?=
 =?utf-8?B?ZmIrV1pGQkhUczB1U3hIZlBZZ3FWejdqTmN5Mm5welk4TGliZ2VSQ1piaWJV?=
 =?utf-8?B?Zm5WMDFwNTUwVVo0aVZkcVRhVVFESEZYTWsrYnh4YTZudUJzcm5rcWYyeVV1?=
 =?utf-8?B?ZWFFNHVmeXJUbCtkeWFSOXlrclRONDBBYVIxVVJ5cWw2U2RlbnlLZXJWSXNj?=
 =?utf-8?B?NXpocmEzdmtYSXJQMHJOM2FDTU5xL3RsdTNFK3J6dEIyM1ErQXk3OVVQWmR1?=
 =?utf-8?B?d2tsWWFEK3V6WXZrQlIvZUFNRUhUNHVzeTd1MDdDVFYyaTUvdnFicWxxcGxV?=
 =?utf-8?B?VWxPbXh6QVB3VmtEbUhyeWxuRXkzb1BoYjlqK1NCaVdBTkN5VkIwNFllZjVD?=
 =?utf-8?B?SE5ydlJCaEdmUng5TGlRZHJVNG9RR05wZ2FIb2pLcGhvaHBGNjZKaWZWWTgy?=
 =?utf-8?B?Nzh5ZW5Eb1NDWndWWTRTS1RqS3MrRVA1clBtUXJYUk5FbFpWY2lDTjhZT240?=
 =?utf-8?B?bnVOR0I4QitFWG5ielNXNEpXbU1yR0xRanBhajF0SzRFYWtsaXFNaFd2N1R6?=
 =?utf-8?B?NUQyczMxUmE0ejdZbmJ1ekpwV0h3cUxZa0RFMXlOY0N4Q3BCUGt3aFlZbS9H?=
 =?utf-8?B?V1FJSi91M0hDakdITEFVWkJFT2Q0emxPaWVzVXJvKzNpVTd6SURCakpPYXY3?=
 =?utf-8?B?dXVRQTN2eHNZK1BhSURBdkpDNFdtZmZlczNlNTBQOWVZMjZGL2FjaDcrTWlB?=
 =?utf-8?B?K1gweGptTkt4ZkJLZWIxeFpuNFpCMEZFb01RUW4zd2pGNHpkQWF6ZFdMSDFa?=
 =?utf-8?B?cVhLY01TWVBCWnJvTWl6VmNSeUtjM0srVzRLMEFPOTVJQmhPTWxReXkzQWcr?=
 =?utf-8?B?TVd0Y1ErcWcvYld6ZUYxeEpNTDV0c0ZGTlZFS2VUMmdmdlE0Z0ZpcThtUWY3?=
 =?utf-8?B?dENmdjVBRGRRQzZKc0JZUTNaZjFTRHQ0aE4wd3Y5VXhKNEVDUERJYnNneW9I?=
 =?utf-8?B?ZlFxS0JPWC90YitVUDNFS1kwQnU1TEFuS0NaTjNxNi9VWlhLQ2wvZ0VOdjU3?=
 =?utf-8?Q?+dpwI9SXsUr2glUBHG0ye1kXF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001dbd9e-a720-494a-6530-08dc8ac597a6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 09:54:03.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGegyDzEovJYMhJB3Lf8qxxqRYvkf57vFqoQ4+9xwaoml5PCxVSoUrjOD0Ile6ZA21K5J0CsHDnTgfn7bXyTxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483



On 6/12/2024 12:26 AM, Michael S. Tsirkin wrote:
> On Tue, Jun 11, 2024 at 04:20:42PM +0800, Zhu Lingshan wrote:
>>
>> On 6/11/2024 12:04 AM, Cornelia Huck wrote:
>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>>
>>>> This commit allows the driver to suspend the device by
>>>> introducing a new status bit SUSPEND in device_status.
>>>>
>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>> which indicating whether the device support SUSPEND.
>>>>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>> ---
>>>>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>> Can you please add a changelog? Especially as some of the previous
>>> discussion has been lost due to the broken old mailing lists...
>>>
>>> (...)
>> will add change log in next version.
>>>> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>> +\begin{itemize}
>>>> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
>>>> +If not, the device does not support the SUSPEND feature.
>>> That sentence is a bit weird: I'd expect the device to not offer
>>> VIRTIO_F_SUSPEND in the first place in that case... could this rather
>>> happen if the device is not able to handle the request at a specific
>>> point in time?
>> Yes, this can be improved
>>
>> How about:
>> If not, this indicating the device is not able to handle SUSPEND at the moment.
>
> I don't get what this means, agrammatical and vague.
> Please make it explicit. Do you mean if driver reads
> status and SUSPEND is clear then devide failed to
> enter suspend state? Might be problematic: time to 
> suspend might be quite high.
I think this is a common problem how the driver handle changes of the device status.
Even without this SUSPEND feature, spec section 3.1.1 Driver Requirements: Device Initialization says:
“Re-read device status to ensure the FEATURES_OK bit is still set: otherwise, the device does not support our subset of features and the device is unusable”
Other status changing may also be costly, so how long should the driver wait for the device responding to status changes?
This currently depends on the driver's tolerance.
What should the driver do when overdue? Shall it reset the device or set FAILED?

I think the device should either SUSPEND successfully or set NEEDS_RESET, but maybe not a good idea to set a time-out in the spec,
the driver can set FAILED or just reset the device if the operation exceeds the tolerance in pulling.

Any suggestions?

>
>
>>>> +\item The driver MUST NOT make any more buffers available to the device.
>>>> +\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
>>> "send notifications for any virtqueues"?
>> OK
>>>> +\item The driver MUST NOT access Device Configuration Space.
>>> ...except for the status field, if it is part of the config space?
>> Yes, that is the original design, then I am convinced that the status fields is
>> not a part of the config space because it has a dedicated section in the spec.
>>
>> I will add this sentence in the next version.
>>>> +\end{itemize}
>>>> +
>>>> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
>>>> +
>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
>>>> +
>>>> +The device MUST ignore all access to its Configuration Space while
>>>> +suspended, except for \field{device status}.
>>> ...if it is part of the configuration space.
>> Yes
>>>> +
>>>> +A device MUST NOT send any notifications, access any virtqueues, or modify
>>>> +any fields in its configuration space while suspended.
>>>> +
>>>> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
>>> "subsequently clears SUSPEND"?
>> I am a native speaker, but "subsequently" sounds like clearing SUSPEND right after "setting SUSPEND", I guess there can be
>> some operations during SUSPEND.
>>
>>>> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
>>>> +
>>>> +When the driver sets SUSPEND,
>>>> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
>>>> +
>>>> +\begin{itemize}
>>>> +\item Stop processing more buffers of any virtqueues
>>>> +\item Wait until all buffers that are being processed have been used.
>>>> +\item Send used buffer notifications to the driver.
>>>> +\end{itemize}
>>> So, is there any opportunity for the device to fail setting SUSPEND? I
>>> mean, if the driver is supposed to look whether it sticks, there should
>>> be conditions for when the device might clear it again...
>> The device should not present SUSPEND bit in the device status until it is suspended,
>> so I am afraid there is not a SUSPEND bit to clear if the device fails to suspend itself.
>>
>> I think there can be two indications of a failed suspend:
>> 1) The driver sets SUSPEND, but the device does not present SUSPEND after a while, depends
>> on the driver tolerance, the driver may assume it is a failed SUSPEND, like how we handle FEATURES_OK
>
> This is not how we handle FEATURES_OK.
setting FEATURES_OK may not always be successful and can take longer time than expect. What should the driver
do when the pulling re-reads does not return FEATURES_OK?
>
>> 2)The device runs into errors, presenting NEEDS_RESET.
>>
> More reasonable.
OK, so the driver should re-read the status, it should see either SUSPEND or NEEDS_RESET, this works for me.

Thanks
>
>>>> +
>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>>>  
>>>>  Virtio can use various different buses, thus the standard is split
>>>> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>>>>  	handling features reserved for future use.
>>>>  
>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
>>>> +   set SUSPEND to the device.
>>> "that the driver can trigger suspending the device via the SUSPEND flag"?
>> Yes
>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>>>> +
>>>>  \end{description}
>>>>  
>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}

