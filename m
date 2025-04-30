Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8B210FB
	for <virtio-comment@lists.linux.dev>; Wed, 30 Apr 2025 04:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745988280; cv=fail; b=bEQ0hW3ut+upatFzV0Dc8h9GqLiN9JGTswq+GbV/qv0vUI8ar0+z0qV6P63YNOfCvZKX5bnRRwFrCc9FsUKh6+rCBJ4gXon0Q54WhX47FWH5aziX6zFf8NZIhzsx+KF+Hy8agXpdkPYvWyGlB6r0Amw6ncZ2HGHcLfV7eH1M61g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745988280; c=relaxed/simple;
	bh=0CXnpe8peFEEIdBPMX1NFtiKSN0ABygYL015D5s+v5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qA2KE8IVVPJ19z1zfyDaZzxG3d4BWnQB3kBMsz9DjwJUd5OEmhE6WNtWUKabNumqQdfUefSUPkcFewKIBEdWm+wqmZyi9Ju67s9MYSm4/8CkdvndlHajGwtZFChE88OK/InSdppHSsW2RZj5YZzeYGqyJwgaFef3f2jLUQpwwFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AeRn+EVb; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeRn+EVb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1Q0aQqGAd3rjykbBICkUtoPKSPGtTV9F9IzN7o9iowYks0b5jR8IhfyyctCAU9VCQ7QZ8/dysolodRWWDy+KO/wa7XozC2Z/YbUAetOFm1ovTpAjAbWJI1XKyu9957pC5XZ+SF8tRbcUcKe1QlMp2zAvIKH8EHqQOFhNbf9jzI83z+LEiGZupky+nIq5u1Y94ehsTpaumUWfHEEyIQMorWVOaW7orgXbvlWnIWQGv8GjSJsdYoNp9u2DyubcOM8/PejElglgqYmHsjPHNTWBTzkrqVagYaa6I2ieIZe3egnirK5zbOy5j8CpNLkB2aYWusaWs4uriE1e9rDGwACTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CXnpe8peFEEIdBPMX1NFtiKSN0ABygYL015D5s+v5c=;
 b=PotxlgFrD29bUv1zSxByMJszCbMGVhzcudvRiQfPTRSbQU3jWpYc/eBeuzGBpEo5YrfIlfE3RPV5KhVhZ2ofxHnopB1JyDO69f4ViD0TISREXxveClufC3OYvzL5vzPWRamjP9/Ir1JobI+Na/VKfeWjpFptwrC4iTL/8xYcAdLp23UNg0GhuSOHmCcCs2fTSaGA64jxaLJMRfCb4G5Fw/F5KYF8soSuCkFeFkHQDp/FhiinblSHweRuevQWAk9b/2Pt7VsnA/C/UtVk66Sd684rAS+Dmno+9ALecHUsMu/MIuWKzOZmwUTLCvjD4qklbPmas1SO523ypOX8zE9aaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CXnpe8peFEEIdBPMX1NFtiKSN0ABygYL015D5s+v5c=;
 b=AeRn+EVbabVgZ9W/Ms4A4bANAshpVP/SF3evU8z5hM5jiva2vccCFHPgLoMftWMR3VLRZZd3Q83m4aynpruQTP+Hnm1loPLVa5L760kOHIQEhuUEzheirBUgo8etX167TfaTE/UEIWqcmBYDl48167pBji44psWJu737alf4KPPlaUTdGFboYLP4GfQm3LyEdET2EeVPhjkimEDvC4AzBYCmKhe7b5ik0vYWN3NHnvWgrJFAkY4pdR7mchIAyD9+h7LA/TqxyBXm/DoNvhhCvvozBv4p4Ru/6j8fF75q1ot87xkhIdrRFsXPYZ6JI3Cn57RRPAocFUzzXtxQECcS4w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB7851.namprd12.prod.outlook.com (2603:10b6:8:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 04:44:32 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 04:44:31 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, Daniel Verkamp
	<dverkamp@chromium.org>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index:
 AQHbb7qQTK1IFlk3mUyW0rZK+XznHbOwfmOAgADIVQCAALOCgIAAG2mAgAc9KICAAlyQAIAAgdHA
Date: Wed, 30 Apr 2025 04:44:31 +0000
Message-ID:
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250429164256-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB7851:EE_
x-ms-office365-filtering-correlation-id: 3c1df00c-bb07-4dd0-4a3a-08dd87a1b2d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDR0RkVIZW51VG12MnVFWUxwV1Znb1JlN08xdE8rLzFUZElJYlpUNVpJWmor?=
 =?utf-8?B?S0N5Z0graU1xZWdoU0RyVXRCaUd0QkExMklBQUVrZEV1RnhIOGo4N2ZlVGFP?=
 =?utf-8?B?LzBBQ213bnBXMHRlSVowSHBxbnVEYUtYRWRpVlFyd1JySVdZZ2NKWDdzaDNB?=
 =?utf-8?B?bzlvL3BZOEdIS2ZYaTZGYnRVN05HZWNzRXZsYjNrVzBZWVprUWlvelB4azlE?=
 =?utf-8?B?VE1IRXBBSVk5dkNSa1VzVGV0M3oyOXRqS3lSRlRRak5FbENWb2xVV3F5SlpN?=
 =?utf-8?B?b1BlcTNILzdDb3FPNncyeWtpdHRZUUxEU0lqSkp5a040c1J5WExTS2hKTE9Z?=
 =?utf-8?B?VWNhQWgzSkFlQ1ROaGU2NkF5b2ZJY3F4KzMrNXdhK2lEY09CYkVEdkdoQ3NC?=
 =?utf-8?B?ZUQ1UlpFYjNJU2w5L0pyaFA3WHpsOTB6OEREV0VuenNTRFU3R2pJdnlOdnFE?=
 =?utf-8?B?M1NrTmd0NG56Z1pUczIzN2NuUW8wRUhzSGRKR0tLcUZzdnZ6RTUyTWZBZWlh?=
 =?utf-8?B?MEVFUmVGdGxmbkFvbGJkS3dCT1I3TFN1Sk05Vkd6MlArT2pWMDFnQ2JPNG9p?=
 =?utf-8?B?UWgwdmNhUVF4L3ZYZ3Z0ZlgyVUQzdEducVNTZFpsSTBLRUROc0Q0c0xrKzA0?=
 =?utf-8?B?NUh1ckN4TU9sc3BidWdtMmFCZ3cvNHhOd2F2U3RzNXZrOGJUeW9XRVJwVDFK?=
 =?utf-8?B?WUk4QjYvVmJ1VHFnWlNMQ3h4TVRVMjZsQzdrQlJSMmxrN0V6YWZXQk1qVlhJ?=
 =?utf-8?B?bXFMUnNhT3hEenJxNXRySFQ1TmtjTEd0T2Y5S0o1MjdZSFBnQWNhOUlpR3dY?=
 =?utf-8?B?L1JGZDNOYUpKUkNVTU9TcDJDNE4rK0h4TUFtcTg4U1YrcTY2TFJZcXFwQ3pP?=
 =?utf-8?B?eWU0QmhmeWZUeHVEREczREhkcWNrVWhZRVEwQ3dYMnpaUXFSOXJEVnhtTHVy?=
 =?utf-8?B?MDFmZU5JSkZvSjlyOU91YkZvZkM1Wk8ybVQ2ZXMvcXFQR0FJQjY5a3cxbWRl?=
 =?utf-8?B?RVhEb1psYmtTVWZyMEZaNW1Lam5FUjlMek1QMXdhVDFwVlREOUgxSUV2T3VP?=
 =?utf-8?B?K1hiNWpPRk44QnZQUzl1SndFYis4WEJqNWxSZGVOcCtneVRDNjA4Qk9qVXFV?=
 =?utf-8?B?NFFCeFZhNWl4QS9VOWZkSk1uQjE4R1JsY0NBRTAwM1dsbnplS0N1WFgxUmpX?=
 =?utf-8?B?b1o4U0lQbldORFIyRHpoZVI5c2h3V0drRFptcWcySmJhN2NmMERtd1lYVk9o?=
 =?utf-8?B?NFZMdVhma1ZQS1N6a2VtMUFuZ2YzbVJoNXNpLzVJbkNrTUNvdjI3TFpud2Va?=
 =?utf-8?B?UHFOOU9oL0VpVDE3RTNtOGduRWFoUy9sdTZSRXZqTW1iUGdMZWg0aWxZWWR1?=
 =?utf-8?B?TTE1ODUvQ1F1SC9kSHVlOU9DWXdVRUM5aVBxSE1VWkp5UTM0S3hoZ0c2ZnFZ?=
 =?utf-8?B?YVFOVWMydncxU0ZrVmZ1bndFUGRvNDgyWGwyM0hyZEpydERuME9ObUNtT0Jv?=
 =?utf-8?B?UERXWXFsdlRsMjZ6R3hwZnJaUzIrQkNuai9vaEs0QnJBYjd5M0J2cUcvb2ly?=
 =?utf-8?B?Uyt0cG9keTc5T2FnNlhMbWM0YXlQS1lrbjJ4KzlDSWlHblNzMS9tRzZEOVdK?=
 =?utf-8?B?ZjBwTUNwbDZoUmtjNGJSMHdtWUt0SHV3WjhOZDFCYkZaMzg0aGVyUDJhV3JL?=
 =?utf-8?B?SDVNbzZBY3JsL1k3T1U0bmpVSmNUZE9Ncm1ZMGZGaFhYeFhZVENXSVdXNXZX?=
 =?utf-8?B?UTRRMEpUcVJEeWVlMkZSc1Zsc1VKc054ZmFLd2ZKd08yL0ZYc0NwdElGbkR5?=
 =?utf-8?B?b1lySVZFcEI5eVB5c2VzZFg3RTUxWFRtaGNzb0pLWjJzUTRmSXFUOGRTU0da?=
 =?utf-8?B?ZUNocSt6VnpwWEcyOTJNTkZ4VHhsUi9XbDBvS1NQTE9UcWo1MFVYYk5jR1JN?=
 =?utf-8?B?UHZncDJ0bkFsSHZTZEJWS29qQytnRk1udzBZd3JDQTRpOS9oaUNVVTRYbU5y?=
 =?utf-8?B?QVV4dFJpcGZnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHVZUzNjZTJjWGsrdC9mcVVYcnkvalRVcEFuR3lLTUpjMW1tVlQycVg4dmhW?=
 =?utf-8?B?MHFsRmVyclZINXlLcEYwMGZrSEV4L2ZmK0hmOEk2ek9ZUHZWUXpyMDhvNjdY?=
 =?utf-8?B?cWFTbHNYRHFoMWZBU3JjUzNrRmdRY0NuNjRweE9adEhjdEo1WWo2MTVqWlRW?=
 =?utf-8?B?clg4VU8xTkNhWnR0RWJJQ0xhWkswb2dNVE9SL05XMFlSZklycWhmWGJweDFl?=
 =?utf-8?B?ZndaczJpMDlrYXNGZ0hGd2daZ3ZWUzhvK29NU3Q2V3RDTXRDQkhHT1lwR0pY?=
 =?utf-8?B?K0hPVzBXMkFxd3BuZzdCeWRuc005YnBUcVJoMWdINVJZemlkYTA3cUxoMzh0?=
 =?utf-8?B?V2FDYlpPSXE4UWVwbEF1QUVHenZUZXorNmhOSXEyVE5qRUc4dVM2L0lUbHBN?=
 =?utf-8?B?VnFRS0Vya2l3QlRuNzIxNUJzNWVDcHRpbzFYRzNHUElDVjRNL1RzUnUvSGFS?=
 =?utf-8?B?WEc0MTN1VWhsZ1JTVXBNTkJVUjNid01JMlB0WGRJK1FSMFhob0pDK2hFSzBz?=
 =?utf-8?B?dVFWUzJvNlkxcUFYTkFxcEFDeVgwTzdXS0R4THdmeGRJT01Rcmh6b3RtYXR4?=
 =?utf-8?B?dnVaYStBNS82Sk81NDVxSjdSdk45UTZqdkdWRDdSSzhiNzczR3VjODhuTlBk?=
 =?utf-8?B?RExMZHh2c0VsMHV6T2kwZTU2V0FrUkRyREM2MzFGV1U2NGNiL2o4Q1FuUXFo?=
 =?utf-8?B?RXRkdEg5R3UrdTVDZDF6Q3R3NG03aUdSU0VWL0pnbmxpQkRvMlpsRkVjVGlV?=
 =?utf-8?B?anAxUGJpd0d0SmxubEVCYkFjaFI5TWkrVVJpdXl4V1JyRm9RNjNhRi9PZVpl?=
 =?utf-8?B?UHdhQ1RINUhoV3RrVjRuMkg1SG1HVEQ5UG9NR2F0M2UzUkRpTmNTNk1BZE9i?=
 =?utf-8?B?cFNPc2VsZWo4N2JBbk13aDRQTDBWMk5ZU1g0UEQxcU9iNmxLSExVVCtjcnpq?=
 =?utf-8?B?d0ZDa2o3V09YRnNiQ1J5RStaMTcxbzJ0ZG9yd2pkeGJBRnZGbDlGZllZMENz?=
 =?utf-8?B?SG16L3Y2eGl5UkZ0V2wxcEJKTWZnb3hHNkNJMFhvS04wTGM4b1RTQ1Zod043?=
 =?utf-8?B?MnhCRWlCWkRVODhLdk5XMXlpOThqUHhjOFdERUNyb3VMTjlyN3VkMklDRXRE?=
 =?utf-8?B?Q3daYmZxU3p3RnJSRXZHSjg2Ky9sRm1VeGxtaFNNOXJhVExsN2lIWGZBNVl4?=
 =?utf-8?B?d3FUWjBuVXdFMnRtb2RMRDFYRUxUVEYyZ3hlVnFIT1hUcEh5TGU5SGtEZlRp?=
 =?utf-8?B?dWpPUlgweUpXUTMxclVQc1kyZ3hnWURKclMrWVVIS1FhS1ZPTmlId0VPUk9o?=
 =?utf-8?B?UktoRVlKOHBRMi85SjFBRlFRU3VKa3VqMHV0akhoRFVjb3Z0QVd1VkFXSVlC?=
 =?utf-8?B?VXduTE9sZlBMTE9KK29EK0tCb3RidExRRFdIMUpLSFZuMUFSS3V6NmhDbGlY?=
 =?utf-8?B?bEkrV01nYTBtT21mYmMwYjFHYy85YkduY1Zoby9QRkFldzVWRjltaHY2RzQ1?=
 =?utf-8?B?ZTA5QjFHdTVobkFzQUxhMjdXb3JGaUZYZUN5dWVNQzd0U2ZmZW9hRWk3N1Yv?=
 =?utf-8?B?cFZtaWlydW1hU3FKZnloaXlONlN0SGRIcWhscWJPOXpuM21OallzendMRmM0?=
 =?utf-8?B?MDBoakNpN3QreUlnUTErMTlRQ21sUnBCc1lzQ1V5NDVhNkpEaW1JTnVLa3NN?=
 =?utf-8?B?bGxJUkIyRjdrenViTzlzUDFYSUxLTDJRbTZqM2ZnR0FCNU1HZm42TWpUOExR?=
 =?utf-8?B?VmNRVHNsSXpoZVdRYXJ0dlJTZVNkQkxTUDFJbFZjNElOVkovRTlCVXNFUUZh?=
 =?utf-8?B?THNqMm96enVwdGpFbGNrT3AvR1hlM1NtYzY2WWY5QnVOMnF4dkVGWlB2ZTV1?=
 =?utf-8?B?VUxSMHB2SC9FR0FwYkFxdTR2eWo1bFJ2OS9tZkthVFE4Y3FsaTRMZHZCaGpY?=
 =?utf-8?B?NVdvaGlKblVOTTQzc2xCOElIaFZUVnNEQjBETnVSVVM3Mkc1dy9ZanJ2OENx?=
 =?utf-8?B?RWNsWW96UGlEUjh1QzB4K2p3MXp3MkFmTkdvcnpONXY5MmhxMDNRUmJXMUZr?=
 =?utf-8?B?NVZZcWlkbmRkdkg5VHNpU0RiY056dmtjeW1RUG5EbHdOVXJVV0tEajVKZThq?=
 =?utf-8?Q?LVCQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1df00c-bb07-4dd0-4a3a-08dd87a1b2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 04:44:31.5916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gEIKs1z05QdE1GrdUovRJo1OtNrBCCDj2TBlK+w6pyIKZ84u//Yuc77sgvG+Swe5+/B5gk8gvi/XaUyzRNoO3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7851

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBBcHJpbCAzMCwgMjAyNSAyOjE0IEFNDQo+IA0KPiBPbiBNb24sIEFwciAyOCwg
MjAyNSBhdCAxMDozOTo1OUFNICswMjAwLCBQYW9sbyBBYmVuaSB3cm90ZToNCj4gPiBPbiA0LzIz
LzI1IDg6MDcgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgQXBy
IDIzLCAyMDI1IGF0IDA5OjI5OjExQU0gLTA3MDAsIERhbmllbCBWZXJrYW1wIHdyb3RlOg0KPiA+
ID4+IE9uIFR1ZSwgQXByIDIyLCAyMDI1IGF0IDEwOjQ24oCvUE0gTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4NCj4gd3JvdGU6DQo+ID4gPj4+IEknbSBhZnJhaWQgd2UnbGwgaGF2
ZSB0byBiaXRlIHRoZSBidWxsZXQuDQo+ID4gPj4NCj4gPiA+PiBPbmUgb3RoZXIgaXNzdWUgd2l0
aCBiaXRzID4gNjMgaXMgdGhhdCB0aGUgdmhvc3QtdXNlciBwcm90b2NvbA0KPiA+ID4+IFZIT1NU
X1VTRVJfR0VUX0ZFQVRVUkVTIGFuZCBWSE9TVF9VU0VSX1NFVF9GRUFUVVJFUw0KPiBtZXNzYWdl
cyB1c2UNCj4gPiA+PiB1NjQgdG8gcmVwcmVzZW50IHRoZSBmZWF0dXJlcywgc28gdmhvc3QtdXNl
ci1uZXQgZGV2aWNlcyBjYW4ndA0KPiA+ID4+IHF1ZXJ5IG9yIGVuYWJsZSB0aGVzZSBmZWF0dXJl
cy4gdmhvc3QtdXNlciBpcyBvdXRzaWRlIHRoZSBzY29wZSBvZg0KPiA+ID4+IHRoZSB2aXJ0aW8g
c3BlYywgdGhvdWdoLCBhbmQgSSB0aGluayBpdCdzIHJlYXNvbmFibGUgdG8gZXh0ZW5kIHRoZQ0K
PiA+ID4+IHByb3RvY29sIHRvIGVuYWJsZSBoaWdoIGZlYXR1cmUgYml0cyByYXRoZXIgdGhhbiBh
dm9pZGluZyB0aGVtIGZvcmV2ZXIuDQo+ID4gPg0KPiA+ID4gWWVzIHlvdSB3b3VsZCB1c2UgVkhP
U1RfVVNFUl9TRVRfUFJPVE9DT0xfRkVBVFVSRVMgdG8gbWFrZQ0KPiA+ID4gVkhPU1RfVVNFUl9H
RVRfRkVBVFVSRVMgcmV0dXJuIHR3byB1NjRzLCBvciBldmVuIGEgbmV3IG1lc3NhZ2UNCj4gcmV0
dXJuaW5nIGFuIGFycmF5Lg0KPiA+DQo+ID4gSSB0aGluayB0aGF0IGFkZGl0aW9uYWxseSB0aGUg
VklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTX1NFVA0KPiA+IGNvbW1hbmQgd2lsbCBuZWVk
IHNvbWUgY2xhcmlmaWNhdGlvbiwgYXMgaW4gdGhlIGN1cnJlbnQgdGV4dCBsb29rcyBhDQo+ID4g
Yml0DQo+ID4gaW5jb25zaXN0ZW50Og0KPiA+DQo+ID4gIiIiDQo+ID4gLy8gaW4gT2ZmbG9hZHMg
U3RhdGUgQ29uZmlndXJhdGlvbiAvIFNldHRpbmcgT2ZmbG9hZHMgU3RhdGU6DQo+ID4NCj4gPiAj
ZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VRFBfVFVOTkVMX0dTTyAgNDYNCj4gPg0KPiA+IC8v
IC4uLg0KPiA+DQo+ID4gVGhlIGNsYXNzIFZJUlRJT19ORVRfQ1RSTF9HVUVTVF9PRkZMT0FEUyBo
YXMgb25lIGNvbW1hbmQ6DQo+ID4gVklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTX1NFVCBh
cHBsaWVzIHRoZSBuZXcgb2ZmbG9hZHMNCj4gY29uZmlndXJhdGlvbi4NCj4gPg0KPiA+IGxlNjQg
dmFsdWUgcGFzc2VkIGFzIGNvbW1hbmQgZGF0YSBpcyBhIGJpdG1hc2ssIGJpdHMgc2V0IGRlZmlu
ZQ0KPiA+IG9mZmxvYWRzIHRvIGJlIGVuYWJsZWQsIGJpdHMgY2xlYXJlZCAtIG9mZmxvYWRzIHRv
IGJlIGRpc2FibGVkLg0KPiA+DQo+ID4gVGhlcmUgaXMgYSBjb3JyZXNwb25kaW5nIGRldmljZSBm
ZWF0dXJlIGZvciBlYWNoIG9mZmxvYWQuIFVwb24gZmVhdHVyZQ0KPiA+IG5lZ290aWF0aW9uIGNv
cnJlc3BvbmRpbmcgb2ZmbG9hZCBnZXRzIGVuYWJsZWQgdG8gcHJlc2VydmUgYmFja3dhcmQNCj4g
PiBjb21wYXRpYmlsaXR5ICIiIg0KPiA+DQo+ID4gVGhlICJjb3JyZXNwb25kaW5nIGRldmljZSBm
ZWF0dXJlIiBoYXMgdGhlIHNhbWUgbnVtZXJpY2FsIHZhbHVlIG9mIHRoZQ0KPiA+IHNlbGVjdGVk
IG9mZmxvYWRzLCBleGNlcHQgZm9yIFVEUCB0dW5uZWxzIHJlbGF0ZWQgb25lICh3aGljaCBhcmUN
Cj4gPiBtYXBwZWQgdG8gYml0cyBjb3JyZXNwb25kaW5nIHRvIHJlc2VydmVkIGZlYXR1cmVzKS4N
Cj4gPg0KPiA+IEl0J3MgdW5jbGVhciB0byBtZSB3aGljaCBzaG91bGQgYmUgdGhlIGJldHRlciB3
YXkgdG8gYWRkcmVzcyB0aGlzDQo+ID4gaW5jb25zaXN0ZW5jeS4NCj4gPg0KPiA+IC9QDQo+IA0K
PiANCj4gUGFyYXYsIHdoYXQncyB5b3VyIHRha2UgaGVyZT8gR2l2ZW4geW91ciBjaGFuZ2UgYnJv
a2UNCj4gVklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTX1NFVCwgZG8geW91IHdhbnQgdG8g
cmV2ZXJ0IGl0Pw0KDQpJIHNlZSB0d28gb3B0aW9ucy4NCk9wdF8xOiANCk9wZW4gc291cmNlIExp
bnV4IGtlcm5lbCBkcml2ZXIgYW5kIERQREsgUE1EIGhhcyBub3QgdXNlZCBSU1NfQ09OVEVYVCB5
ZXQuDQpJZiBIZW5nIGZyb20gQWxpYmFiYSBhY2tzIHRoYXQgdGhleSBkbyBub3QgaGF2ZSBhbnkg
aW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZWl0aGVyLCBpdCBtYXkgYmUgc2FmZSB0byBzaGlmdCBf
YWxsXyBmZWF0dXJlID4gNjMgdG8gbG93ZXIgcG9zaXRpb24uDQpXZSBjYW4gZ2V0IFl1cmkncyBm
ZWVkYmFjaywgaWYgYXQgYWxsIHdpbmRvd3MgZHJpdmVyIGhhcyB1c2VkIFJTUyBjb250ZXh0Lg0K
DQpBbmQgb25jZSBmb3IgYWxsIHdlIG1hcmsgaXQgdGhhdCBmZWF0dXJlIGJpdHMgYXJlIGxpbWl0
ZWQgdG8gMC02My4NClRoZXJlIGlzIGVub3VnaCBpbmZyYXN0cnVjdHVyZSBpbiBwbGFjZSBpbiB2
aXJ0aW8gc3BlYyB0byBub3QgdHJ5IHRvIHNxdWVlemUgdGhpbmdzIGluIGZlYXR1cmUgYml0cy4N
CkFuZCB0aGVzZSA0IGJpdHMgYXJlIGdvb2QgZXhhbXBsZSBvZiBpdCBhbHJlYWR5LCB3aGljaCBj
b3VsZCBoYXZlIGJlZW4gbmVnb3RpYXRlZC9jb21tdW5pY2F0ZWQgYXQgbGF0ZXIgcGhhc2Ugb2Yg
ZHJpdmVyIGF0IHJ1bnRpbWUuDQpPbmx5IGJpdCByZXF1aXJlZCB3YXMgYSBiaXQgdG8gZXhwYW5k
IHZuZXQgaGVhZGVyIHNpemUgYXQgZWFybHkgc3RhZ2UuDQoNCkFkdmFudGFnZTogYnJpbmdzIHRo
ZSBnb29kIHByYWN0aWNlIHRvIGFkYXB0IHRvIHRoZSBtb2Rlcm4gYW5kIGVmZmljaWVudCBkcml2
ZXItPmRldmljZSBpbnRlcmZhY2UuDQpSaXNrOiBNYXkgYnJlYWsgUlNTX0NPTlRFWFQgKHJpc2sg
bG9va3MgbG93KQ0KDQpPcHRfMi4gVklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTIGNvbW1h
bmQgdGV4dCB0byBiZSB1cGRhdGVkIHRvIGluZGljYXRlIHRoYXQsDQoNCkJlbG93IGRlZmluZXMg
Y29ycmVzcG9uZHMgdG8gcmVzcGVjdGl2ZSBmZWF0dXJlIGJpdHMgNjUgdG8gNjguIFRoZXJlIGlz
IHN0aWxsIG9uZSB0byBvbmUgbWFwcGluZywgaXRzIGp1c3QgcG9zaXRpb24gaXMgZGlmZmVyZW50
IGluc2lkZSB0aGUgY2xhc3MuDQpUaGlzIGlzIGNsYXJpZmljYXRpb24gdGV4dCB0byBiZSBhZGRl
ZCBhbmQgc3cgY2FuIGFkanVzdCBmb3IgaXQuDQoNCiNkZWZpbmUgVklSVElPX05FVF9GX0dVRVNU
X1VEUF9UVU5ORUxfR1NPIDQ2DQojZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VRFBfVFVOTkVM
X0dTT19DU1VNIDQ3DQojZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VU080IDU0DQojZGVmaW5l
IFZJUlRJT19ORVRfRl9HVUVTVF9VU082IDU1DQoNCkFkdmFudGFnZXMgb2YgMm5kIG9wdGlvbiBh
cmU6DQphLiBmZWF0dXJpbmcgYml0cyByZW1haW4gb3BlbiB1cHRvIDEyNy4NCmIuIERvZXMgbm90
IGJyZWFrIFJTU19DT05URVhULg0KDQpCb3RoIG9wdGlvbnMgYXJlIHByYWN0aWNhbCB0byBtZS4N
CkkgcHJlZmVyICMxLCBpZiBIZW5nIGFja3MgaXQsIGJ1dCBhbHNvIG9rIGZvciAjMi4NCg==
