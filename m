Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2085.outbound.protection.outlook.com [40.107.100.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D50282E2
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718081629; cv=fail; b=uuzms/brV3+2RbzCfgW9P6vMJ7zCJ9VPJziQZJfc6PFb8wGC/IzVdLgRiNHhewIVy7AkMNVaemuzYWWH3GNtpasBO7T+qina6C6Xg/1TSmiatwpa4HKPFV0qJyK2e53QD57wIgQUywouDphnrEJJZkjWoXi7IYdMdHhaRAhXpPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718081629; c=relaxed/simple;
	bh=wimQYuu31vLieD/YNzfSEDmxvuL8HLLqEYdsuvYA0Xk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tp0nDb+gymdDId3oIlZbXkUzOBTSEiii10WELCIkFogWA/ojnok83IgUqZEI4DZDWgOiuA5RZyaLEP6s7Eu/ii1qfTm5OvTiy9BAszLdUJ+9oj0Nxb90jijFTYgaYnjPvhYe9H0G5GhJagwdfnTqgxM/jYDgYs+vKX2Fvupp77U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OnRnJa4f; arc=fail smtp.client-ip=40.107.100.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OnRnJa4f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHIbVgfoYXLwdI93jAWiewM93QPUfZYp3h+F7AU0wRG3NX/nckeJzZ6bss0293cTAWwur5681GqEqwE2Zt2wHLxvqy8//fpvDdp+lKMgnCtXsWGLx6q20Im10tBmrRiyHi5UtHKy00QuyXHaf/kJRLbugi7mHOmvZiEsg2hqaXyrIe4tzvjoHoCukvnCAYE5zqnAtr3tLhBm8TFMmm/xNOTjTWNoVMVzAjbvnVo2MnOCw65+lPL/TOpOIL9idbObxZzwmeItzAjuuRXF8A4daGlTn2WHJGJZT+myzCg85GoajMY0WoCPBh4K2Tl3IxFRVFRtHjLrxtt37PfkhYLbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wimQYuu31vLieD/YNzfSEDmxvuL8HLLqEYdsuvYA0Xk=;
 b=Dv2bXlJmpvb5uGe+bqgfisOLbtm6S7hqXQKwZezczCmybHcLeYTdiOFa+bsw0mCXXclQxqBmkt1a3apeoZ3I4MW+K6TXQlP8fBvS0IphhrMNiRI8G/74kwPEiMcnRtQPasLcMhspCLBxfDjYPTT3z3n7jOcALOLEbfNPVnDARn6CKOfAmKKOnOTR0bljRw2+vOX5V+JlPWQtbrLUswmlfnb965CasVw/w4vF4JDcnFe5D9sQXlnCgtkofo0doqcoOhmYo3OLbt1BP7s06pgoFYiJ+xNjHVdxNrAIrMKPrRvXEdpGT4gK/FmantJBGawe21CUiq/iYbzDie7n/oHG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wimQYuu31vLieD/YNzfSEDmxvuL8HLLqEYdsuvYA0Xk=;
 b=OnRnJa4fmZVaYEwQOKWErtt+eFviHJ7RVefkrrOA3mR1d8uM5S+FUgtf8Hrpm3aPzxnXfpPBgYRNNX7KZQmRgG57Uc7gEno990mqdkqvQl3qXfTwxb4R8Q3a8X92YRAuKKxuS4q6kZILJ07lRkKHFFgIln/rvpRWJ/2NJC08vr8HtiCVfA52QVGcttWmo0++mKl20XgMu033HrCwNEYNTRgfWjbxCNLJ3ejaEY5pvjtRJ7cnrpIntUBfFvM3B3tQaaISGWt+dyQ/8kL5s6LMTLHYanPjru6PIjjBD92XIhbQge3R615yP4bRiu50Y0c3kHqp++Mir6Hst6A+zfgB6Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 04:53:41 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 04:53:41 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?S3LDtm5pbmcsIE1hcnRpbg==?=
	<martin.kroening@eonerc.rwth-aachen.de>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH] virtio_pci_cap64: specify offset_hi, length_hi endianness
Thread-Topic: [PATCH] virtio_pci_cap64: specify offset_hi, length_hi
 endianness
Thread-Index: AQHauBJ8+HRQ74qmmEeQIJSslq1JZbHCBmGA
Date: Tue, 11 Jun 2024 04:53:41 +0000
Message-ID:
 <PH0PR12MB5481A6C266BD5303B98AF5EEDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <DF89BB0F-6BA4-4DAB-AEC3-03AAF858EC8E@eonerc.rwth-aachen.de>
In-Reply-To: <DF89BB0F-6BA4-4DAB-AEC3-03AAF858EC8E@eonerc.rwth-aachen.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7663:EE_
x-ms-office365-filtering-correlation-id: 6daab8f8-93eb-4628-338a-08dc89d27754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGEvajJKb2JmOVROVzlEdnJOVURjTjhROU9GUzNzaXVDV0t0dDRiTm52ZDhL?=
 =?utf-8?B?VE9yMzQwNFR6ZWUrdGJ3M1pURDUyVHZUSzRWdm5YaUU5YXJKc3pwRjN4ZUJ0?=
 =?utf-8?B?aWlDOHpUMjJVU0ROZzZnTjNSelkyTEdRRHNibTRWdFVRRGZFZkRIZmxZdk01?=
 =?utf-8?B?Z09OeXdSeVZLR3BRcEc1ejl0VmRkRCtFb20ySVljeGVOSnVQMkdXZ3pzTmNT?=
 =?utf-8?B?dWdYeGxiajBvTm5IOUxxUVFiL0JaN05mUnBrdjlnd0dTUDhjSlFhMjkyTXV0?=
 =?utf-8?B?QzFBdWx5MnBTenBLSDRlMy9iY2hWNTJCMlltRFlxdmhYTGlSLy83NXRHY2VI?=
 =?utf-8?B?UGRtWjJVbDJFVWZEVldabzR6cm1JYXIrS3VPRE52TVZFL2NHdzcyclhTMGt0?=
 =?utf-8?B?VkNIdUt5U3dqV2REQ2JhbC9pd29TUjFFR0h2Qzh1eG5HTFI5c1JlTnBEeENY?=
 =?utf-8?B?VVJkL2lVMlBaUjMxeittQWVHTkhiQnJmeVZBSlpNdk5EWUZPZ2t2WjFYUC9J?=
 =?utf-8?B?UVY3RGkvY2N1SkJ2MjkyWFYzRWp3V0h0SWZUUDR4RmJGTDhJcTBVNkpRVXVR?=
 =?utf-8?B?dy9UVEM2a1dqMUtZN20vNUVtbzg5R294eHRMYUMyYlpqVHZqbHA1Qk0xdVNk?=
 =?utf-8?B?b0xHTit5dHFPWjlIV0g3a0VQK2RsRTFpaDRueGhnYkp0OWJ5SEhiUitOalNE?=
 =?utf-8?B?Y1hxWXZDUWY1clNDdXMycGExbVc1eEFJVys0anRrMGMyQUVVbGVVTDU3TitB?=
 =?utf-8?B?elhBRUlReEV2dHlTL3hUY3czbUxyNzMrbkVYSnZ2ckt6UW1LYUYyU3FvVUhI?=
 =?utf-8?B?cVQwbkhaVzVKQjVkbVdxV1ZPK1VNVzdqNDlXdHhROGY2OWNuOVhQeVZ3T3hO?=
 =?utf-8?B?RFhKd0gwc21pU3NRY1JyL3pqMGhkT0dhTTJjQVpQSHUrUkJ3Q2ZyNVlHc3p6?=
 =?utf-8?B?cGEraVBjQTYxa3dZM2JPQ3N5Tis0SkliOUJrU1cvZ2d4U3k0RzljTFVoNVA2?=
 =?utf-8?B?Z2kzT2ZMV3dSR2RMamJRWmJwM1VoWTBnK3YreU9CaDZ2ZmYxWmtDMk9rOFhl?=
 =?utf-8?B?bi9VVkd0SlRMM210TjBWYzlnUkNUQTd2bm9SeXo4UVRmUExKN1FaZ0FiaDBk?=
 =?utf-8?B?S0xPL3JnTWxkcFY5UUxPcjVrWHVrSGc4TnYxRUV3cDZaaWxobFMvY3lmVHM5?=
 =?utf-8?B?cngvbFFNbHpOc1lzbHU1ckgzVnpEMSsxZU43YXJWR0RqVllveUpkdlVOZ3FS?=
 =?utf-8?B?aTdOamo2Qjd0UW8yUitxNTZoMEVSYTMwZG9VWHlrZlNWcUlPMnBqeE1aYURk?=
 =?utf-8?B?ZDdOTzM2elh6aWxaYmtoTmI0aGt5MEtmZzZwL2JtNlh5NEhOQ3VZSnhjb2Rj?=
 =?utf-8?B?YXVKd05NbUhGSS83dDlNSnQ3anpXSFJFSDhIQmlDOUhQcjNCUTE3ZEE5YVBE?=
 =?utf-8?B?TWt6MXFIcUtXd3BTK0Q4RTQ2V0x4dGEyTkh2VFRMbDlpTkhVekJPNXJCcXJ0?=
 =?utf-8?B?eXVVaGxOYmZraFA5NUV6VXF2RGJEakhoeHdTaUZydkdFS0c4VTdyT0cxeFlz?=
 =?utf-8?B?TFhTYXJ1RDVrRFJoQkVDRk1ST01ZRUR6QzJLc1VyVm1HT2l2dkIyY3hwYk4r?=
 =?utf-8?B?RkRxWWpqQ1REZE9pUFAxcU1YM3lMSEYvM0FrdEk5L0RsTlBZL0tlQ3Vjd05W?=
 =?utf-8?B?NS8vMjhOVXJRZUlQS0lkdEo2UVF3N3N2S3lhSWxRVnZFMGJiYTBuNkRnL1pv?=
 =?utf-8?B?WDJUeW12bXBmY01VcExRUWFYa1ZOdy8vcWNxenBaeUQ3MUJyRlVyWHoyUTNK?=
 =?utf-8?Q?y/Mv4sAQ+WHG0CugQdEFmG6mz8IbvN0IJ6W3o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzZsZzlhY2FVMTYrczVPNi8yOWExRXRoS2JWUEhIR3RZc0VtMkpCY2NqWTB4?=
 =?utf-8?B?SXJMbEp4ei82dU05Uk5lR1R3S2lodlNxYTJ5SVlVOGJGY0x6UmxNT1VDc2Er?=
 =?utf-8?B?WHFBMWZuNXhVWTY0TklYUGtZQ2lpQVQ3VWpFZEhnWlNLMk8zOWtqd1g2azE0?=
 =?utf-8?B?cGY4OFBkYm5qNmRDMWhwQ1NWaVB5dlNERHk3b2ozaGtpV243UTNvdjBpOHRV?=
 =?utf-8?B?WTBkRmpzQTRTV1RXQ0lGYUh0SFVEbFJ3K3lIQXdCWHFhczlvM1NrT1hzZ0lP?=
 =?utf-8?B?bEZ1dC92MVg3SzQ1S1UrZkNJNXVEZHk1NkZETElhZnlhb2JqY0JsbGRsZW9S?=
 =?utf-8?B?NitKUUEwOE1BRVdrRlkyTWU3dG5keVpHcHduTW1EQWxPQzREV2FLS0NZczZa?=
 =?utf-8?B?M0VBS29yL2phby9BTys1aHZSNS9hbEk0d1UzZnpzRG1uU3o0QnVaRHJCS1hh?=
 =?utf-8?B?TnhFS2ZFVFVqZEQ0c0hQWHpnTE9KTENNUHlJZG5UbTdZWEtwNjlvTkVrREU5?=
 =?utf-8?B?Nk9OODZuUllaZVpCUmE2RDNFb2xDa04vay91QUlHbklnK2Q4c1p6UTZlNXgz?=
 =?utf-8?B?TUp3QkxDMjFZVHZleWlHQ2Y1d0pJWWIvZStDeUxJUSt1MGdkdE9jWDV5OHBt?=
 =?utf-8?B?MThHd2tkc2pVd1BEQXJiWVlyc1NWRkZ3VUtUM1Y2dzZudEhPTXI4czlwSUlT?=
 =?utf-8?B?eHJVMzJiTTdPK0h1RTBDZVpBY05laWZPa3dSRmxLbG5OdW5EK3lXa2hYSXp5?=
 =?utf-8?B?YnRUZWdGVmpvSVQ4bFhBTUhwMlFzRTZLMWUyR2ZNVXRPUDAydUFSVU5BR2No?=
 =?utf-8?B?ZEpOQ01VcnFnMW5oa3BQWkxJbDZ2VDUrWDRFb01DdCtOVlc3M2o5UnBGUDhV?=
 =?utf-8?B?bkUxa3pOcFZ2MEZRZ2I3WE5DeGRxRVdpUlN5dGQyOGcrWEVHSmE1clNXZE9U?=
 =?utf-8?B?U0pMLzUwSE90RVNwNlhDNlE4cTQ4TzdFTUlTdWFkSEt4ZHBxV2w0MFp3YjNI?=
 =?utf-8?B?L0tvTzZkOFcxbXVONG83bFZ1d1ZHS0RiS24ybnFEUlppekw3a2lGanNCNVhh?=
 =?utf-8?B?a2F0TWxyUTFpa0JTL1I2MmcvaVkrYTZYanczSDVBTC9RbVNnTFhlaXpULy9H?=
 =?utf-8?B?cTlOYVRUOWZlR0g3WlhsK3hnOW11UEZ5TUhOSWNZeVQ3ay8xNS9oNzU1eUEx?=
 =?utf-8?B?MGxLeUVDUlpDam5qYmkrUzdNSkJCOUk1c2Y3S2dBandmL2gwd0R6ZWZEU3Ro?=
 =?utf-8?B?a3d5eG5BZU5ZS0t2a3hvbUF4SERjbXQ5aExabU02cHlPMUZUaFgrYUV6bWNk?=
 =?utf-8?B?SEk1Vm94dUJhQWlmV1RGUC9zQ1FQK3ozdkF3aW4rYVNTYUVJZTVrMzVlbTNh?=
 =?utf-8?B?cXBxWnAvbUEyQ3FpWFZRK3FTMEZQMnNIQ1h5eWcrTUowMWdIL1BOeGdveURi?=
 =?utf-8?B?VmlsekRmbGQ1Zm1JMlRaTmJKcU95L3UvakhHYk1qajl0bkVKUFBHSFNvRGI5?=
 =?utf-8?B?Ry9KczZENmxpMDlSRHIyNThRblVmcjZ2R0ZYLy9BczZ1RWJ1cXBVZzVJWEht?=
 =?utf-8?B?bUs2MzlMMkJxTmFTYytJV05Jemd0RnNZaWZmYS9hT0RFazZLWWtydGFDVXV2?=
 =?utf-8?B?eEtacWw1TFVSTndNMU1PME1NZ0NrTjlnN0h0R2dSWkxaeXArSmhaT2p6aXV1?=
 =?utf-8?B?d2cwWURpUDFpZVdqa0RSb2l4WlRtVFJPSXk1MlNFR25JeDE2Zy92RDQ5MzlS?=
 =?utf-8?B?MWU3a1FEQ0NSL2x4ZGlIa2dudjN4K0RJVVozdmhRY0dLYnl5QW9weVFCUzdH?=
 =?utf-8?B?MjFYRGlkaDJXZlc3WkpGZkxpak1uWEdXQWluSE5CT0liSmJNdHppa1UxbkFQ?=
 =?utf-8?B?NnRRVDlKS2FCaGxIelVKUXFNRlFTZ01SQ2w2V0UvU0haNkJOalkrNTJZR1dn?=
 =?utf-8?B?WklQZThPVC9xcWhIQ3p0UmNOejY2R3NmT1Y2VnYrMzdqUXV4UzEyUmo1ZVNw?=
 =?utf-8?B?ZC9KZG1FUHBocjlNNE41bUNZSythRFB3RHE3V1FvRk9UR09vMkFwVUxneEVI?=
 =?utf-8?B?Y0JBYThjQnd5ZnBka2Y1RnVJSk1yNXNVOGNZbnhHWEJDbC93ZE9HTGhTY0h6?=
 =?utf-8?Q?mU0Y=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6daab8f8-93eb-4628-338a-08dc89d27754
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 04:53:41.7571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9WeAC45kR89D9JTBD6bx2jUDOIc4QVXoTNBP+oLTBdZFAqPM1BJF/k0KdNzlh1HF2GuoB67q5/ya8AFE4wA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663

DQo+IEZyb206IEtyw7ZuaW5nLCBNYXJ0aW4gPG1hcnRpbi5rcm9lbmluZ0Blb25lcmMucnd0aC1h
YWNoZW4uZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDYsIDIwMjQgNjozOCBQTQ0KPiBUbzog
dmlydGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFtQQVRDSF0gdmlydGlv
X3BjaV9jYXA2NDogc3BlY2lmeSBvZmZzZXRfaGksIGxlbmd0aF9oaSBlbmRpYW5uZXNzDQo+IA0K
PiBXaGlsZSB0aGUgY2FwYWJpbGl0eSBpbnRyb2R1Y3Rpb24gc2F5cyAiVGhpcyB2aXJ0aW8gc3Ry
dWN0dXJlIGNhcGFiaWxpdHkgdXNlcw0KPiBsaXR0bGUtZW5kaWFuIGZvcm1hdCwiDQo+IGl0IG1p
Z2h0IGJlIHByZWZlcnJhYmxlIHRvIGJlIGV4cGxpY2l0IGFib3V0IHRoZSBlbmRpYW5uZXNzIG9m
IG9mZnNldF9oaSBhbmQNCj4gbGVuZ3RoX2hpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFydGlu
IEtyw7ZuaW5nIDxtYXJ0aW4ua3JvZW5pbmdAZW9uZXJjLnJ3dGgtYWFjaGVuLmRlPg0KPiAtLS0N
Cj4gIHRyYW5zcG9ydC1wY2kudGV4IHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RyYW5zcG9ydC1w
Y2kudGV4IGIvdHJhbnNwb3J0LXBjaS50ZXgNCj4gaW5kZXggYTVjNjcxOS4uOTViMDhiOCAxMDA2
NDQNCj4gLS0tIGEvdHJhbnNwb3J0LXBjaS50ZXgNCj4gKysrIGIvdHJhbnNwb3J0LXBjaS50ZXgN
Cj4gQEAgLTI1Miw4ICsyNTIsOCBAQCBcc3Vic2VjdGlvbntWaXJ0aW8gU3RydWN0dXJlIFBDSQ0K
PiBDYXBhYmlsaXRpZXN9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbg0KPiAgXGJl
Z2lue2xzdGxpc3Rpbmd9DQo+ICBzdHJ1Y3QgdmlydGlvX3BjaV9jYXA2NCB7DQo+ICAgICAgICAg
IHN0cnVjdCB2aXJ0aW9fcGNpX2NhcCBjYXA7DQo+IC0gICAgICAgIHUzMiBvZmZzZXRfaGk7DQo+
IC0gICAgICAgIHUzMiBsZW5ndGhfaGk7DQo+ICsgICAgICAgIGxlMzIgb2Zmc2V0X2hpOw0KPiAr
ICAgICAgICBsZTMyIGxlbmd0aF9oaTsNCj4gIH07DQo+ICBcZW5ke2xzdGxpc3Rpbmd9DQo+IA0K
PiAtLQ0KPiAyLjM5LjMgKEFwcGxlIEdpdC0xNDYpDQoNClJldmlld2VkLWJ5OiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG52aWRpYS5jb20+DQoNCg==
