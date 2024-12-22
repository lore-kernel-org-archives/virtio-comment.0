Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AB1854
	for <virtio-comment@lists.linux.dev>; Sun, 22 Dec 2024 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734876872; cv=fail; b=IoOpqQCCPgI+e6Acq0RCmT6AE4Px1APUnUG2PUeqYOvEwcHM0PuMXPxMBq8ppCN78lBV5CPwG6ocUbfymKRUMutDx2X4Nrs0ddUg/oXqHfrpu1tbk8UzJRP1q13VTjOPkXt2TUwbL+e3Qygm2hC6KHc/0rTIkdZD0VVUUvdmAfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734876872; c=relaxed/simple;
	bh=+VW3QHE6peoRVJE3ntuwl3JT/UkjtSIwNKz5/CzB4y4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lQsK61j4qcXLGf9O1cVkNes5t1RILPKGuvlOhwijPyYCgujSzABo13wvf4MWTXpa1cqxs5nJpQfPVxPXoy23EwBT73CbHtGJzbgE2Y/zYulTAE4m75KpJrO6CCGHGA6lhvLdcUDhEuOgPs2egvS69zq0BGpUSn1voVaGaHwsw/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GT3NZItF; arc=fail smtp.client-ip=40.107.101.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GT3NZItF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6qU9QpEMYDDJv6tH2vqKXrwaaMpEfbNPk9IhFw3fgieKC71+ej1F0gzCxo1vjq58VZlZs87YDj+BwHvEOUQSFfK6Hqo6oRT5dZOnDwy9q+TJSjw22DvqCnqwldCal+3eEPpuc99oRpIeZbXe5deIHtmhZRIZr1QEKW3h1ME2sBbblPR86gM56rm6RRNOnpUq/nRRZQp37VjGPMnJSSXH/MUpdKtp52mfH0uEGjUTqrsS4iOL/Qn5ZCcyQcC3yG+P59hkPbxT++KJ2CoqEL0OPv8sfDs5u4mWdE6Kp9mWOlapgUAuUP7KclloaylP6bkeQM1gSu4FDswlZHYQUzCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VW3QHE6peoRVJE3ntuwl3JT/UkjtSIwNKz5/CzB4y4=;
 b=UhzQjoBp++TtSjpvtsTFEZFkk9f1jgFiPCEy6YvzIniGIAV/DCD3wIDDMXjIV0qIpYzQTavn4VPSnzJJhcnk+beU7YrGYq59FLl01KR0hFdEFWLIefP8nlbY+HgOYDWXmy2X5wgbVLlfuN63/cx7jeVItRfyA8vDTbGK4flopkg2OTFgqJGEyh2qa56gcnHEqGRyqgE7Cxu5X2u4ckivpR8PssdQ9ZZ8l1pwIA3OFqczDPyOKFyTXRfjYcdMAg4ENc5ZOF8FuTlqanhfwa4RWEywUPx9QC3BElLmtp40Zgl8l/V6A4OMDSSvNbS3KITHSzxpuq/KOxeIJDUYWem6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VW3QHE6peoRVJE3ntuwl3JT/UkjtSIwNKz5/CzB4y4=;
 b=GT3NZItFt1h+BmCct+Upcj0m5c73chqfD4lUZWtQxvNPmdRSkTKe1QAjux3MtiWOz5kPM0IuBsat3C0Iao8PtIRjDztCmuffn48KPtUd+aK5FpdpcgfOapWdLsTpG2nN66AFItHT7juWlOn5ssCOo0TcRxMfU5ab/OX6u2BL/390IDEXjR5ec8bkjR5oS1VsqDBhgtZG0uSAETfSxNONyBiu1rOvA6K3aNVM5Os20ksCkev/lby+NB844rKxsyBPsbDd8W/usyA+L25VvNYvTTxP2yGvMaQ7U5qPGq16KjnyzzF5iy1mKi5Y5VKyavfVEWKBH+fGqS+MHEqaVfp44g==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sun, 22 Dec
 2024 14:14:23 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 14:14:23 +0000
From: Parav Pandit <parav@nvidia.com>
To: Alexander Gordeev <quic_agordeev@quicinc.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Trilok Soni <quic_tsoni@quicinc.com>, Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>
Subject: RE: virtio-video device IDs
Thread-Topic: virtio-video device IDs
Thread-Index: AQHbUv7pKLRjeaC2yU2VViuoqOLu1bLyUOEQ
Date: Sun, 22 Dec 2024 14:14:23 +0000
Message-ID:
 <CY8PR12MB71957E005C26FEC6CDE7170FDC012@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
In-Reply-To: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB8794:EE_
x-ms-office365-filtering-correlation-id: a9f4a384-96e9-4588-5ac5-08dd2292ef7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0ZKaVhxeUJYbkJWTFpsNFNDeUt2a3ZxaXFxYVB2VGhpdEdPSUM3V2syMnFH?=
 =?utf-8?B?Wk54OE1Sb0ZiK2ZvZVZOODIzaWJ2T29jeDQ5QjZ1OXYvYi9HQnZ0dGp4K2Fp?=
 =?utf-8?B?SGhhU05VdmpRQlhmek5zWU5UQVkrYlY4ZHduc2RUMUVkR25wdVFaY295dUhx?=
 =?utf-8?B?dGZGNU51UmZPcEUrZW5xREMvVG9DeEo2UlpxdGxra3YxcnZlUU1WKzRiTDFx?=
 =?utf-8?B?SXlyYWJIU0oxbWRtcis3Z2hzWjQ1TTBwL2Z1bWNadFg2WnI5RmlsM1B1RlRx?=
 =?utf-8?B?VXFxMmZwTUIwZXJkTStEM05OUEZMWXRWVHpHRjQ1elluYW83YlJYeHJVeDlX?=
 =?utf-8?B?c0M0dGlDcUxXdzNtRDMxc2tMUHNjbEVreTVhalVHTFhoT1VsZXByZm9ZdjI1?=
 =?utf-8?B?UE5ISmNHMWwzZ05ES3o0MHB1UWpmeTJJVnRmVDZWNStLRWpYdXRVNmVTdFNm?=
 =?utf-8?B?UGdwZmhvWXd2YVNTS2padjNXaHZwMlQrTWZUbVR1TEI1aDI0ZzFQMFc4b0x5?=
 =?utf-8?B?TDVJaFJvZ1FVQnZMdVhBVkFYVEhOeHNqQUtqWmwydkRIa3ZMK1hiNk5qOHJl?=
 =?utf-8?B?SVJEaDQyMjI2SmpGc044anBIVm81akRvMUhXbXI2dnhaU3hsdEc5WFFJWVA0?=
 =?utf-8?B?M1MzOVVKQVpkaGp2SkYvQU4zUU1OV3ltbFhhVllGNFJWMHRwdmplQVp2cmVM?=
 =?utf-8?B?ckNTdllRUjdEQzMxZmluUHBCcXh5RG9ieXV1aEwxbEFhT3d2WDZXUmRPd2xy?=
 =?utf-8?B?d0xpV1JQa0ZRR3dYc2Q2ZmNnQ0FMTERQMXVVMWxaU2d6b0Rlb3g5U0RybEor?=
 =?utf-8?B?VVdtM1QxWDVFRVdmU1Y0WFpGZVc1UW1OR3dWVGttYStOSlVOdjNPSzNBSmdO?=
 =?utf-8?B?aXJNUFZsejRmdTRxRjJ1YnN3aGFTKzB5ZlZsZXJaTVVDRkdPVHpid0NhYjFN?=
 =?utf-8?B?Nm43WVlWZnJPM09RUWk0K3ZWNjNtUzVFODdDV1ZXd1VtaTdHV2VtdlhuZG9o?=
 =?utf-8?B?SHhYekc4bDE5eE5zS0czai9DVW1NNkZqYlhrM09pbGwzdzBTWGgwZG5weHlK?=
 =?utf-8?B?SWo3VS9RdUVnbFd2NUlyUGNmRGxzRTU0c2kvRVY2aitRWTFvTms3WlZrcDls?=
 =?utf-8?B?TjhVN3BxZ1J4bThXbmpLbU80UTJtYitzVHdDeVR6N0YrMTM4SnVrcS83azE2?=
 =?utf-8?B?azhpR2JuRTF6cFBPWlhnQzlQTUx1akZoc25kM29HMkpUT2JyQ0pPR1pER08w?=
 =?utf-8?B?NERjTFp5eUw0RE85TUphbVJJVzcrWGxvUUtPQUw2dU13emQ0RldDamZhN05z?=
 =?utf-8?B?dnZWQ08raXhoMXBzOFZnUUpXa2UwSXJQMW5wdTl5R1BaT3VyMzZ5NTRIL3hn?=
 =?utf-8?B?Y3Q0Q1N0dHkxL2VMUFlBNTI0aGhobXN2NWQ4NTM0RXlkNVlITmlmb01XWm93?=
 =?utf-8?B?ZmM5SFFtajZZeGtIcUdielR3M3VqRG9tZStnNHVGNHJ4K1N5Z1JWb29QYWwv?=
 =?utf-8?B?L3UxbVZoQmZ0ZlE2MDdWbjJBZ2J3VzlzK0hwV3J5aVBtN3dzZ1R5VjZTcko0?=
 =?utf-8?B?cFBkNVB3TXVrUGdRU1JQRVhuY0l4R2dnNTNHQ1M4ZUoycmpqa2JzQTRMbzBQ?=
 =?utf-8?B?ODkvNFk0NGxaMzlxa0NqNTA0NnFwbEhTK3FSVkpsRGxLVS9uM3ZWeEhrYUN1?=
 =?utf-8?B?S2pJUEs1NjRNcmVaeEFYL1ZnVDgyRHByeXRGR2dDSmRrYW9OaW9XeENRcHFF?=
 =?utf-8?B?cmZSRG1qUlcrUmhKSGpPRDNiUG9mOVpFWVFZcSswWXZtMW1JUGhaOGdBV1VJ?=
 =?utf-8?B?aFA2ZlVLbnJnUkpvQU9oTkJ5aW9ud1pxR2tadm80VWswT1NDNHRLWmU0TWVH?=
 =?utf-8?B?YzBzQzlQS2dtK1ErZlJzQlk4aHdDd3N5aDJLcGlNeFl4ajRqOXVJbXlDUkhI?=
 =?utf-8?Q?4+WgunBH4JrF8xq5909NV8jFvP71Vpdm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnFrN09wU0N1S0F1MHd2Wlo5ZnBVTnp4aTBreW8xZFBpS3ZRTDlQTmZtcE1u?=
 =?utf-8?B?TG1ISEZRbk16eUFhU2RIbG5qbU44UDJCYzFjTTZOTU1KOUM2TFFpYjl1T0VF?=
 =?utf-8?B?bFMyc0Y3M0IvTXdpK2d0UkNaVmhiNzFrSXFIMnIwNkh2Y1h1ZnlSbCtnVnJ2?=
 =?utf-8?B?SGROSU0vZFdFcTlmb3pEcUdEWU1qaTdzNlkwaGVvci9JdDFybHFyZFo1Q2xI?=
 =?utf-8?B?ay9QejQwbnF6WTRsU2RkalVIWlBWbWV3aUdBclNVZlN0U01UdnpUUXJNeHJm?=
 =?utf-8?B?UGMrSUgyalhUU3lDcm5RQ2c2Z3ZaSjd4em4vTnRqMmU5OENva3ltQXRLYmJN?=
 =?utf-8?B?SFJRVXcrWWlsa1hiZ2NiKzZQVTE2TzUvR3NVMGpEVjdZWUNPNHFDTFF5Ti9k?=
 =?utf-8?B?TVI4bGxpcnFjZmRFK1o3cUh6LzBld1c3eHFGcXduMkwwckNGSFoxd3pMQzBv?=
 =?utf-8?B?RW16SW8yRlF0d3hra00rNFZEOUdwQWV4OGtZa3VzRGpIeWJqT1hLQ0NGV0th?=
 =?utf-8?B?ZUVPSHFrNkpGc3RjTTRKeTRTWGFOUjJjdnhVb2RCWmJheGtramJQbGE2RWpm?=
 =?utf-8?B?anFYNENHQ2NTa2JSWTlWL1dvS2hNeGVUU2lKSDgvaDY3NnRtL2swZzhHbmdF?=
 =?utf-8?B?WFdFTVZ0STZHYWQrWjQ3NWVzN2VhcVZvTjNsUVBPREFDNkpPaGtJVHhaZ0dP?=
 =?utf-8?B?N0NWWjVZWGp6clFCV056WmYxT3BYM1NsL09XNG1IVWNPTXRndUVVbVNqbXR4?=
 =?utf-8?B?b0h3QUliRGlONWNxRitJRHR0NTRUYVpCSWQwRVF2SW81aFlnNEZkcFEwR2JZ?=
 =?utf-8?B?VnZpN2RGN1NFL3RmQWhyRkJnb2xWQno3WlZmL2FpcEY5b0N1RGpjN3V0MVhB?=
 =?utf-8?B?aGJkV0plK0EwK0swYzZBaXNvcno4UmtXTTBsOUpMd0Nyd1ZvMWxDZURCQzlm?=
 =?utf-8?B?Q1VIUjN0YVVpSGNOajlObVc4RzRORDFiTTNNUm8xOHc5b05TWUZWWWl0Nm1J?=
 =?utf-8?B?YS83d0xmRHh6ZTVPSnBuTUdIanRvYTlxdkNveGhLWnNFeHBhcmwxMFp0ekU5?=
 =?utf-8?B?U1ZGMTFvQlV0b1Roa3dkeFN6OStUalVCZkwxaFFlVndRUG9yR2MzUHRRdTRi?=
 =?utf-8?B?ZE5KTkVka0NNTVJYN3RyNkRnU2Z1dFNKNVlzR0hlSzJsb0RaNjBwK3VUdzl2?=
 =?utf-8?B?RTJtM0VSbDBBR0FZTmFrUEdtZUIzK0MxMlBpS2lwMG1SWXN3S3lnSS9NWEJI?=
 =?utf-8?B?WXlHeTJJU21mTmJ0NGIvMWlESE12RWY2RGZoVUZ0d0duZUpJc0s5ZERObjNq?=
 =?utf-8?B?YmZkeE1PUXJoeTNOTkltSXFBK1B0MTZMM3AxV0l0eHRyWEJraWYvQ3JXbnlR?=
 =?utf-8?B?MHppTWxxdThncDhhT1VxL05iMTRIQUNLUXQzZThLRXh3aE5TSzdsZVpQNXk2?=
 =?utf-8?B?NVBxU3cvbHFGb3JrOWVHaEtxUGYvRTUxc09sc0xhamJYNEgzWDBpbnJZSXAx?=
 =?utf-8?B?ZDMvZlBETWhPcC9rbkRZVGlUYlg4Ym1Qa1FMc0lMcUN2emIySnZwYmZrVHFZ?=
 =?utf-8?B?cDhpK2xKM3ZqQ3VMVUhSdFMwSzRBdmF4NmVmQ29LODdoRWlpeGxpQmhwYWg0?=
 =?utf-8?B?MDg1eWRja2F3cXRzU2dja2pmTjNNcFlwNVQ3blZ6Q1RyQWVFSUthb250M0JR?=
 =?utf-8?B?ZWhURUdoSWlFREVRN091dU9kUUl6OHdQY3JhUFdOSTcwb0YyaGhYN3pBYXp1?=
 =?utf-8?B?SEpLejRNL0g5NHNnUWRoaHZ3SFFXSGZTOXY1SzE2Z2htcjd2N1lIMEVrZWxo?=
 =?utf-8?B?TGJMSjk0QldQYjA3SW53cWl0S3BvYVlEV1ZaejZxaytmdlc5NE9sYzlveEow?=
 =?utf-8?B?NllpaURQUEFnM3dEL1QvVkQyM0l6MThGaVpBMXVzYnNldVIvT2ZBcW1yeXlX?=
 =?utf-8?B?YmlkQWtJQnhWb25mNDY5Y3pQV1paVmF0VDg2dnRrWmEzOEIvczVNckxuWGZa?=
 =?utf-8?B?VG4ycmxMMFpGUlhuOUdLdGtrUjVwNEdkUVYwNzV3QzgyZE9jU2JxTk5CNHFk?=
 =?utf-8?B?bCsyRUFZK2FpQi92Wk9vYmtYZDJTSHdkaXdtd0NGUnNtNWdEVGhWeFAyQnVE?=
 =?utf-8?Q?tS8c=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f4a384-96e9-4588-5ac5-08dd2292ef7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2024 14:14:23.4720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZar60GDYbbJpSYRJ8hVM7SXDSN5EVfxv8B2donII9VH1oKk+UeKaqm7axQnN9J1bsar5Sn/UhI4ywZcItGMhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

PiBGcm9tOiBBbGV4YW5kZXIgR29yZGVldiA8cXVpY19hZ29yZGVldkBxdWljaW5jLmNvbT4NCj4g
U2VudDogRnJpZGF5LCBEZWNlbWJlciAyMCwgMjAyNCAxMDoxNyBQTQ0KPiANCj4gSGksDQo+IA0K
PiBDdXJyZW50bHkgdGhlcmUgYXJlIHR3byBkZXZpY2UgSURzIGFzc2lnbmVkIGZvciB0aGUgZnV0
dXJlIHZpcnRpbyB2aWRlbyBkZXZpY2U6DQo+ICAqIDMwIGZvciB0aGUgZW5jb2Rlcg0KPiAgKiAz
MSBmb3IgdGhlIGRlY29kZXINCj4gSSByZWNlaXZlZCBmZWVkYmFjayBmcm9tIG91ciBpbnRlcm5h
bCByZXZpZXdlcnMgdGhhdCBpbiBzb21lIGNhc2VzIGl0IHdvdWxkDQo+IGJlIGJldHRlciB0byB1
c2UgYXMgZmV3IHZpcnRxdWV1ZXMgYXMgcG9zc2libGUuIFNvIGlmIGEgc2luZ2xlIHBpZWNlIG9m
IEhXDQo+IHN1cHBvcnRzIGJvdGggZW5jb2RlciBhbmQgZGVjb2RlciBmdW5jdGlvbnMsIHRoZW4g
aXQgaXMgYmV0dGVyIHRvIGhhdmUgYQ0KPiBzaW5nbGUgdmlydHVhbCBkZXZpY2UsIHRoYXQgcHJv
dmlkZXMgYm90aCBmdW5jdGlvbnMgYXMgd2VsbC4gVGhlIHNwZWNpZmljDQo+IGZ1bmN0aW9uIGNh
biBiZSBzZWxlY3RlZCBwZXIgc3RyZWFtIHRoZW4uDQo+IElzIGl0IE9LIHRvIG1ha2UgY2hhbmdl
cyB0byB0aGUgcmVzZXJ2ZWQgSURzPw0KPiBBcmUgdGhlcmUgYW55IG90aGVyIGNvbmNlcm5zPw0K
PiANCj4gVGhhbmtzDQoNCkZvciB0aGUgbmV3IGRldmljZSB1c3VhbGx5LCB0aGVyZSBpcyBhIG5l
dyBkZXZpY2UgaWQuDQpNYXkgYmUgeW91IGNhbiBleHBsb3JlIGhvdyB0byBtZXJnZSB0aGUgZnVu
Y3Rpb25hbGl0eSB1c2luZyBjYXBhYmlsaXRpZXMgb3IgZmVhdHVyZSBiaXRzIHRvIA0KYS4gZWl0
aGVyIGV4dGVuZCBlbmNvZGVyIHRvIGhhdmUgYWRkaXRpb25hbCBkZWNvZGVyDQpvcg0KYi4gZXh0
ZW5kIGRlY29kZWQgdG8gaGF2ZSB0aGUgZW5jb2Rlcg0KDQphbmQgdGhhbiB0aGUgZGVzY3JpcHRp
b24gY2FuIGJlIGNoYW5nZWQuDQoNCk9yIA0KYy4gaWYgdGhlIG5ldyBkZXZpY2UgaGFzIG1ham9y
IGZ1bmN0aW9uYWxpdHkgYW5kIHBlcmZvcm1hbmNlLCBtYXkgYmUgaXRzIG93bi4NCg0KSSBiZWxp
ZXZlIHRoZSBkZXRhaWxzIHdvdWxkIGJlIHVzZWZ1bCB0byBmaW5kIHRoZSBzdWl0YWJsZSBvcHRp
b24gZnJvbSB0aGUgMyBjaG9pY2VzLg0K
