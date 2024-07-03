Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2096.outbound.protection.outlook.com [40.107.215.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5031A89
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 07:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719992240; cv=fail; b=oNUTJJ0MZHdNaJ/yquhG1dq5IMCqlgeNrnWLGbE4zEymfSiy1lJ7WlOOY7eKv+DuVlFYpyN0I1UkfsE/Bm/6TVjMnZJQlzIuqryCDCU+vhQTu3SQemedUEzl83dTS26fl7hrgi1XlkBbxdNeG5wq65pLplwTByi0cvSdOaPI4Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719992240; c=relaxed/simple;
	bh=8plPBMh1KOuu5pcLfTPrR/l9Ja0ZpHmx9x/ckHvqlv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eQ7bBPHooAZcfUpw9V2vP6eC+LfE44rIg+O0ShiPboIuH0VLJeIMv2KLt1mp1j7xlpVZm+GhC+yzjTzQ1xiAqYUWKroWx39dOKe8rPE0HdF5vI0dLWXmx6/NNSXArhR+gbIiU8Pmrpe7Bw0BwpvjfkAryaaO0Iz+kDPXcsY3xRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=BMKOe2C0; arc=fail smtp.client-ip=40.107.215.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="BMKOe2C0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGQpVXuqnoYx7zALQdTxt79symwvWKkX+glvtql62GB0asux+SXp4nwEsfoS77vPsRZmm9jkyPvwDZgsYoK3swA+u9Vb4r8wlgADY+2F1ILlMo48Is20fk41chQzR8/gz3HQB8tlJ4G/bALqIRcPZ6NwKM6hmG9PAadWnATEunrrpPK3x7KGtU4JLBIsMlpmyKjGYSJ6ndS3v/qHsBCPuZ2LcFAfLNwCL3HfCtue8IpkWItwdWWXIZRBXuJWF2mlxsaDE0+sYbtsXUfVsHYtv+CWIf4FtLgVd7wX/IeY+eq0YF+mctsouCtc1MDC6UQOvccOhVqvegcj4y831ISVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8plPBMh1KOuu5pcLfTPrR/l9Ja0ZpHmx9x/ckHvqlv0=;
 b=OeDL45tcp/PVl1n1kFzbrXp7LikyZZ5iGGSo/3hY3UdpOn4t0m6qDHj6smVgsj0DtBGjiCHtaULPiPUNaVWdBW0hV5VBfiKyJW9aaCAfrWcW1o74Fa4xBDkc5JSLQIlb+wMhc0BJCHB/JsDVBUtvnAi9gMCl0CGoGhiOInFIj7cKDoFPcRUlswEKKfUXO+gaOplP2WOKhRHG9Nw4HAnc66VkaLPBJ5O5NUemxob5DZdfZjckghVEwT/XszKuulpjrFvqYgzrJPaOljXy0HmUAxT7y7ugxYDUP2Gpk1RPgYwLuNeFrDdKKkNmEUsLNH9sHjepvj/XU5h+HSDSRRy3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8plPBMh1KOuu5pcLfTPrR/l9Ja0ZpHmx9x/ckHvqlv0=;
 b=BMKOe2C01Unu4Avt8eZVGkC4T/tRCMkNEskIL9VpmtuIgxb+J7ouX+NarTinkBgHzcMWkOW48b/UA/e54UY2TqAWZbWpHMvqSz55ybMxeZrH7AXYwrO37qZdLWfPAmcdQnh8lDOhz+fX2MdH08iCbARFayCl8Jq2Eo4WClyCXrLPleIugfk2MgDO/382hYsqI0dxXDO3KMRUgoaz3A83D5IalvkWbPvFu9vJ+K1/yPseR2IPnaOLLTAY/o1TJ6Js/QX2cQX261TEvVKXmsW7TjXUgMcT4EKhG1VffRxmjiRMjCw2j5AOoGTFl7/QuHmZiGbgJpuac0HdD0fImYYc+A==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by TYSPR06MB7020.apcprd06.prod.outlook.com (2603:1096:400:469::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Wed, 3 Jul
 2024 07:37:11 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 07:37:11 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>,
	"mst@redhat.com" <mst@redhat.com>, Leo Liu <leo.liu@jaguarmicro.com>, Angus
 Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHjD2wAgAEtn3CAADrdgIAAHOag
Date: Wed, 3 Jul 2024 07:37:11 +0000
Message-ID:
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
In-Reply-To:
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|TYSPR06MB7020:EE_
x-ms-office365-filtering-correlation-id: 268de1e7-b2dd-40e4-1d23-08dc9b32f393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZThrb3dwMFNVRUpSaUFKREJ1MFU4dlo0eWdOWDVuZ1hqTmhiOS9jUjlmYXhy?=
 =?utf-8?B?WFk2aWNQbDJZcjZMWFJNQ3l6Z3hwVVBGcXc1Qm4rWEhEa0c3cEF2NENTRndi?=
 =?utf-8?B?RjlEWVV1bjBTRTY1YXhKNkJTR2owSlVlWnJwT1pZR0hxSzhESmFrSk95dENN?=
 =?utf-8?B?Z2pwOGxuLzh0ZkErWnMzNkRBRzdlMGt6VG5FWDdrM0RkWm96RW91cGtmMDZa?=
 =?utf-8?B?NjcrY0FUZ0JiMk1hUlhaSE9PTkVnK0lIR3BBWGl3c1hrc056RGltM0pSRGFR?=
 =?utf-8?B?Tlo2YzFFanNHaWhTUG5oOGZ0QmxhTE1PUVdybEFYMTk2TTRkYjI5dVVEOWkz?=
 =?utf-8?B?bnU1aDQ1S21JUVI2VXRPMVhEZWxpT3Y1d3QyZXpBeEpRYlRoTWd1SXIwcjQ4?=
 =?utf-8?B?OVMyeUtVT04reGNQNjA0THRQZURXRzhQWURPbWlwWmsvNEc4bkxWVzJzdjc3?=
 =?utf-8?B?TTR0MFJkVmxFSHE0dVp4WXRkVlVnc2ovNUhIRWVFTjJkZkZqNTFQZXlocEow?=
 =?utf-8?B?c1NOeVYxMnBhZUJRaHZNQzg0bWl0NGdIVHpiTmlTMVdoUHI0ZUNLSzJKZ28r?=
 =?utf-8?B?aUNSSmEwWEg2QndtMmZKZlJYNHFicUE4R3hUTUdEdS8wTXM3VEtqckhHSy90?=
 =?utf-8?B?ZG1zTWoySDkwMFhGcTRaOHpVeHZ0Q3U4ejJYaitNTHRwa2RmWkZXSUtva3FG?=
 =?utf-8?B?T2ovdTkzYzUzcy90WW5LYVZzbkJENU9uQXpkS2k3M1VGKzAxakQ0a3lFYVI2?=
 =?utf-8?B?dFliZ0NsaDM2SzVaajNiaUtWOVJjVE93QzBMVzhQeXVmMzVRNjhQMWJldDEr?=
 =?utf-8?B?NElWbG55ZEh4SmNudmhOdXFxZ3RLdUhhR0dXVU9IdzBOMXQ0dlJsM29yM3do?=
 =?utf-8?B?L2k5bHZuTDdySHhoS2tMWlZWS09hYTl2dGpYSGZYR1hJYkMvRE9jOXpYRGow?=
 =?utf-8?B?YkxYWU43d0R5Q3plaWJGclczbTFPY1U3NTIzQ1VKZGthb1Q2ODg4UTJFa2dW?=
 =?utf-8?B?b3RRY0xqaTFVQjU3bmUwMDhoaFhJWnJDc2ZRTEVNeHlLbnJIOUExM2F3QTYx?=
 =?utf-8?B?eEh0bThidU1wa0IzbXJta21tVmRzbU5iYzBnMjZVQ2dlUkY2NkJwNzhTWVh3?=
 =?utf-8?B?VTI3bGpISVBkdnhrdXBuUWJQbE1jM0RKSkNBenZ3NnBiYzE1VW9LWWQ4NWVO?=
 =?utf-8?B?ZjRXL1dKeitUYnNPSUpuajFiMk01em9nY3VDa2JtcVhyTmVVNVp0cGFKTklj?=
 =?utf-8?B?QXR5bTlOelNGRW80bVVhVmN2aGtzK2pOUG8rOGNtMVVIbUFmRFZDRE5HL0FK?=
 =?utf-8?B?cGJpYWFWMStPWDM2STVzdUdTaDE1cnFTcUd2OHh4QUJUZmx1TitvOEpJdS9B?=
 =?utf-8?B?SGVkSjg5bGF2QzhhOHRONWJ6TVN3UmtoN050dlNqM21RM1g0Y1NxUCtJZU1V?=
 =?utf-8?B?UW9ic29ING1vUXZ4UDVPVHduelRMQTlRRGREOGFhOWsxZkNPSmZvN3M0d3Qy?=
 =?utf-8?B?SlQweVhRT2M2SHphLzQ0OFB6ZkZKcnFKRGQxTUFUNmhoTkNjS3FQTkl1MU50?=
 =?utf-8?B?aWlrWTIrMnNweVJXQzd0U3k0ZVp2SEhsUGRqeEpLY3piQksxODE5RVlwTmVO?=
 =?utf-8?B?V0JFZEQ5NFdDVklmdHpiRXJoNmhZVlRwb1RNOHlrQWNlSHdkd2t0Uy8rYUtz?=
 =?utf-8?B?aThxQnlZSGF3b3dXV2JBcFpqV1NHY08rSHZXblRBZ3F0Qmt6bUVFR3BXamUy?=
 =?utf-8?B?RS80MXVOcy9oSi8wWko5U2E2d0hFTmgzSUF2Yy9tQnV4WWpqakNOU2l2dDdz?=
 =?utf-8?B?YnZGcWNLeThvQkNIb3VCaXJDWnA4dno4REtKWllZZ0JORXVsWnplOFJmR0Y2?=
 =?utf-8?B?cGdKOWN2bGp3YUIvMVBpc3ppTlQrMnNnSTQ3N0xZN3J6aFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2M4Z3NyODRPV1ZDaVpYYjRSa0RDdHQwMmpaU2RDWTlTc0d1SkE1L1dTeU1s?=
 =?utf-8?B?NWIxSnpncW9OVUYxeUpqZXBOZG1abkNPWlpGZ3YrTmFWVjI0alg0ZzJScjIr?=
 =?utf-8?B?dDBiU3p4N2hHcGgyemJTVzdVNm8zMW1XTTZYbFhHYk5rYkJzSUxVUTBuRnJM?=
 =?utf-8?B?eTB2Wm1iSEVrMUhSV0FrN294Nk9LaDRhNkYvcUVjejkyWVA3YkovMW1vQjhi?=
 =?utf-8?B?a2VlL2tkVlIxeXBSdUpiWEwzaGR0aVBpdjZ4ZWFidHVpUXhFVXI3bGNDTEo4?=
 =?utf-8?B?ZjRFK21xRVZOeXB5WUtlcVlBWm5lbG9XRENGaHJ5WkUxM0trWmplVEl4U095?=
 =?utf-8?B?TmVndFFsM0ZKTjFreElFSnZ2ZkhtRysxVGFVczBRVXYxakgzM01tTG0zZGR3?=
 =?utf-8?B?VGp2UXdnYS9YVXloZDdOd3Z2UUladTVuWHBuT0ZGT3BBRjJVMFFjWk9IZGxx?=
 =?utf-8?B?cENaNXk0UVdsbFBUa2tzNjUxbzJwK0RuS0ZMM1RZRkl2OFFVR3dXeUYrNUlV?=
 =?utf-8?B?ZklZTlVETjVlc2xtZllzUGxpNkRCaDF4UmNDb3NWQ3lxdmYrL1VQWlJjQlNX?=
 =?utf-8?B?Rkc0anphUHRyTklZTnBNUzJXcmJyK0lkZ2hQZFZzQUZ5NmVEQmNoMTdTdE9T?=
 =?utf-8?B?RndYOE93T0cvR01yTnBqTVQ3R0RTZWRBQ21MT0dFN002cVNMNHVpdG9vdXY1?=
 =?utf-8?B?WmFFU2Rydlo2dDlNZExhSG1RV2pwWndPSm1xSEVSbWxuYmpseFBCS0VkNndM?=
 =?utf-8?B?aXlNWUpCVlZWaGNNdmlaVzN4YjV4WUZPNGNlbUczRVN6N1dJdXloTkJSWTNR?=
 =?utf-8?B?M2R5Q2ZiRkRycjVpaExyUWsyUlNOdmpyazBJWCtzK3pxZWVmQW8vM2xGc0ZU?=
 =?utf-8?B?dTByNGVtL2UwZjFvS1cyRDgyeUIyaFlCcXlQeWdlUnd4WUs5ZmJuU3Zlay9L?=
 =?utf-8?B?L0FITitEaXVNUS9Ob1RYMkFCV0tVRCtNUmJUbkxLR2g2Zjh0bXVVR29JVEFE?=
 =?utf-8?B?QVhQcWNKQituMHZDOCtwRHQyV2paNmlzK3I5b3hERmFQU3VKTmV4c21ySkh0?=
 =?utf-8?B?WGxkS094bS9ldFlHVnJuN0lkU3FTVldJQnBvOC84UVd6WUpJajdCZHRmWWRN?=
 =?utf-8?B?bm5Pa1FiQzVaWmpxa1puZ25XV1ptYXhTNXJORlJZS3pKUzZWNGQvOXJoa3JU?=
 =?utf-8?B?YkVlMTI4R29YTmFDR2tkY1I0TG0weGx5ZERjeG8wMk5DK3FISk9aM3J0NVcv?=
 =?utf-8?B?aEN5a0s2TEVUQ2NuT3YvcGZrckwwNmpzYUNsVWZkbk4rQXNaTU55eE8yWnpI?=
 =?utf-8?B?Z1d3Q3pTbDRPbm1LK25ibFpiVmpaSGJ3Sm1pUzBoS3pYZGdGcmxkUTFMZDJl?=
 =?utf-8?B?MHdmeHJycEc0RmU4Sm40cnhwaGZqbFNOd25tL2lRWm5RdFpnaXZCTndjUXJs?=
 =?utf-8?B?OXNkZUtDUnVWeWxWQS9JRzZ4NmszV2tubFFDblFFTzJpcCtlbTRTTUtibFZk?=
 =?utf-8?B?TVBvZ0JMaHlpejRxOHlQVUhHSlB2U2xadXpZSlp6aEdLZlcwcFZtbzFmbjdP?=
 =?utf-8?B?T2pBWHdwaVcrYllMY2xSa1c5QUdRVU5kUjA0RmRzdXFURDZWMDM5NndEVEMv?=
 =?utf-8?B?MmcreFBlN1pOd1o3S2h4TkVjbk9lZG9uRjFrVmEyTGdvODFEQW5RNnRYMzgy?=
 =?utf-8?B?YWU1U1Zscy9DcXJuL2xhd3FDM2p6bExnU2pyRTJIZHl4eHdlN2RtL0lGcmNj?=
 =?utf-8?B?bTV0ZWxqVjB3ckJRUzhIdlRYUTJWeWZEOTkwaVpTZG9Fb2ZTaXNxUUloSEpJ?=
 =?utf-8?B?bS94VlREMlFxYlRHYmNONktpc0dadXpwUVJyT3NTQkprSWlQSmdscUk1bWVS?=
 =?utf-8?B?RGM4VUg4NzVNRlZvakNFcjNQSXZPcVRxdEhvdEIyMGJXeXJLVHZMZy95Q05M?=
 =?utf-8?B?QkJ5TVBtQ1M3OThTSS9GRE9ESFRCTGpCNThubWN0MVFHMXg5YlNTM3lETUtF?=
 =?utf-8?B?K3hybURJMXBBOVJXbmpKaWgvU05FN3UvODdNMk9sOXkwN0d2Zm92R2NXRDVs?=
 =?utf-8?B?YmVCNkZ1UmM5Y09vc2ZHQ2pkSWlNLy82MmNBV2RpamZINms3U3E2Kzk0TTRZ?=
 =?utf-8?Q?fF4yyHTA8grY0BLke8Ho7haSk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268de1e7-b2dd-40e4-1d23-08dc9b32f393
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 07:37:11.6567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o14oLS8IrYh7Jm5WXOt92mWzjAfY0RnxeztN5sCJAyTHnpaeUblLO+0VYZwnYueTsCVQP75ys8vGQ10HevCZzWqiqQR1TE0YvBwIhHM24e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7020

aGksDQoNCj4gPiA+DQo+ID4gPiAxKSBXaXRoIHRoZSBldmVudCBpbmRleCwgYXMgbG9uZyBhcyB0
aGUgdXNlZCBpbmRleCBkb2Vzbid0IHBhc3MgdXNlZA0KPiA+ID4gZXZlbnRzIHlvdSBkb24ndCBu
ZWVkIHRvIGZldGNoIGV2ZW4gaW5kZXggZXZlcnkgdGltZQ0KPiA+IFllYWgsIEkgYWdyZWUgVklS
VElPX0ZfRVZFTlRfSURYIGNvdWxkIGhlbHAgaGVyZSwgYnV0IEkgdGhpbmsgaXQncyBhIHJlbGF0
aXZlbHkNCj4gPiBjcnVkZSBtZWNoYW5pc20sIEkgaGF2ZSB0d28gcXVlc3Rpb25zIGJlbG93Og0K
PiA+ICAgMS4gVXNlZCBldmVudCBub3RpZmljYXRpb24gc3VwcHJlc3Npb24gc3RydWN0dXJlIGlz
IHN0aWxsIGxvY2F0ZWQgaW4NCj4gPiAgIGhvc3QgbWVtb3J5KGluIGRwdSBjYXNlKSwgSSdtIG5v
dCBzdXJlIHdoZXRoZXIgdXNlZF9ldmVudCB3b3VsZA0KPiA+ICAgYmUgYWxsb3dlZCB0byB1cGRh
dGUgaW4gdGhlIHJ1bm5pbmcgb2Ygb25lIHZpcnRpbyBkZXZpY2UsDQo+IA0KPiBXaGF0IGRpZCB5
b3UgbWVhbiBieSAidXBkYXRlIiBoZXJlPw0KSSBtZWFuICJtb2RpZnkiLg0KDQo+IA0KPiA+ICAg
SWYgaXQncyBhbGxvd2VkLA0KPiA+ICAgc2VlbXMgZGV2aWNlcyBzdGlsbCBuZWVkIHRvIGZldGNo
IG5ld2VzdCB1c2VkX2V2ZW50IGluZm8gdGltZWx5Lg0KPiANCj4gSXQgZGVwZW5kcyBvbiBob3cg
eW91IGRlZmluZSAidGltZWx5IiwgSSBtZWFuIHVubGVzcyB0aGUgdXNlZCBldmVudCBpcw0KPiBu
b3QgY3Jvc3NlZCwgeW91IGRvbid0IG5lZWQgdG8gZmV0Y2ggaXQgZnJvbSB0aGUgbWFpbiBtZW1v
cnk/DQpZZXMsIEkgZ290IHlvdXIgcG9pbnQgaGVyZS4NCj4gDQo+IEJ1dCBiYXNpY2FsbHksIEkg
bWVhbnQgcHV0dGluZyB1c2VkX2V2ZW50IGluIGEgY2FwL3JlZ2lzdGVyIG90aGVyIHRoYW4NCj4g
aW52ZW50aW5nIHNvbWV0aGluZyBjb21wbGV0ZWx5IG5ldy4NClNvcnJ5LCBJIGRvbid0IGdldCB5
b3VyIHBvaW50IGhlcmUuIFdoYXQgZG9lcyAiIGNhcC9yZWdpc3RlciAiIG1lYW4sIHVzZWRfZXZl
bnQNCklzIGxvY2F0ZWQgaW4gbWFpbiBtZW1vcnksIHJpZ2h0Pw0KDQo+IA0KPiA+ICAgMi4gQWNj
b3JkaW5nIHRvIHZpcnRpby1zcGVjLCBmb3IgZXhhbXBsZSwgaWYgdXNlZF9ldmVudCBpcyAwLCB0
aGVuIGEgZGV2aWNlDQo+IHdpdGgNCj4gPiAgIFZJUlRJT19GX0VWRU5UX0lEWCB3b3VsZCBzZW5k
IGEgdXNlZCBidWZmZXIgbm90aWZpY2F0aW9uIHRvIHRoZSBkcml2ZXINCj4gYWZ0ZXINCj4gPiAg
IHRoZSBmaXJzdCBidWZmZXIgaXMgdXNlZCAoYW5kIGFnYWluIGFmdGVyIHRoZSA2NTUzNnRoIGJ1
ZmZlciksIHNob3VsZCB0aGlzDQo+IGJlaGF2aW9yDQo+ID4gICBiZSBzdHJpY3RseSBmb2xsb3dl
ZD8NCj4gDQo+IFVzZWQgaW5kZXggaXMgYmVzdCBlZmZvcnQsIGFuZCB0aGUgZHJpdmVyIG11c3Qg
aGFuZGxlIHNwdXJpb3VzIGludGVycnVwdC4NCk9LLCBJJ2xsIGRpc2N1c3MgdGhpcyBpbmZvIHdp
dGggbXkgY29sbGVhZ3VlLCB0byBzZWUgd2hldGhlciBpdCBjb3VsZCBoZWxwLg0KDQo+ID4gPg0K
PiA+ID4gMSkgY29tcGFyZSBkaXNhYmxpbmcgdmlhIHJlZ2lzdGVyIGFnYWluc3QgbWVtb3J5DQo+
ID4gPiAyKSBjb21wYXJlIGF1dG8gZGlzYWJsZSBhZ2FpbnN0IG5vIGF1dG8NCj4gPiBJIHNlZSwg
YnV0IHNvcnJ5LCBjdXJyZW50bHkgd2UgZG9uJ3QgaGF2ZSBhbnkgcGVyZm9ybWFuY2UgbnVtYmVy
cyB5ZXQsDQo+ID4gYnV0IHRoZW9yZXRpY2FsIGFuYWx5c2lzDQo+IA0KPiBUaGlzIG1pZ2h0IGJl
IGFsc28gaGVscGZ1bCwgZm9yIGV4YW1wbGUsIHdpdGhvdXQgdGhpcyBwcm9wb3NhbCB4IHBjaQ0K
PiB0cmFuc2FjdGlvbnMgcGVyIHBhY2tldCwgd2l0aCB0aGlzIHByb3Bvc2FsIHkgcGNpIHRyYW5z
YWN0aW9ucyBwZXINCj4gcGFja2V0Lg0KSSBzZWUsIGxhdGVyIEknbGwgbmVlZCB0byBzZWUgaWYg
dGhlcmUncyBhbnkgcGVyZm9ybWFuY2UgZGF0YSBiYXNlZCBvbiBvdXIgc2ltdWxhdGlvbg0KZW52
aXJvbm1lbnQgdG8gc2hhcmUuDQoNCj4gDQo+ID4gIGFuZCB0aGluayBpdCdsbCBoZWxwIGltcHJv
dmUgcGVyZm9ybWFuY2UuIFNvbWUNCj4gPiBwb3B1bGFyIG5pYyBhbHNvIHN1cHBvcnRzIHRoaXMg
ZmVhdHVyZSwgd2hpY2ggZGlzYWJsZXMgaW50ZXJydXB0IGFmdGVyIHNlbmRpbmcNCj4gPiBvbmUg
YW5kIG5lZWRzIGRyaXZlciB0byBlbmFibGUgaXQgYWdhaW4uIFdoZW4gZW5hYmxpbmcgaW50ZXJy
dXB0IGFnYWluLCBkcml2ZXJzDQo+ID4gY2FuIGF0dGFjaCBzb21lIGV4dHJhIGluZm9ybWF0aW9u
Lg0KPiANCj4gSSdtIG5vdCBzYXlpbmcgaXQgZG9lc24ndCBtYWtlIHNlbnNlLCBidXQgdA0KPiAN
Cj4gMSkgdGhlIG1vdml0aWF0b24gbmVlZHMgdG8gYmUgd2VsbCBleHBsYWluZWQNClRvdGFsbHkg
YWdyZWUuDQoNCj4gMikgd2UgbmVlZCB0byBrbm93IGlmIHRoZSBleGlzdGluZyBtZWNoYW5pc20g
Y2FuIGJlIHJldXNlZCAoZS5nIHBsYWNlDQo+IHVzZWRfZXZlbnQgaW4gYSByZWdpc3RlcikNClRo
YXQgd291bGQgYmUgYmV0dGVyLCBoZXJlIHRoZSAicmVnaXN0ZXIiIHlvdSBtZW50aW9uZWQgaXMg
bG9jYXRlZCBpbiBhIHZpcnRpbyBkZXZpY2Uncw0KcGNpIGJhcj8gIA0KDQo+IDMpIG9yIGhvdyB0
aGUgbmV3IG1ldGhvZCBpbnRlcmFjdCB3aXRoIGV4aXN0aW5nIGludGVycnVwdCBtb2RlcmF0aW9u
DQo+IGZlYXR1cmVzIChldmVudCBpbmRleCwgaW50ZXJydXB0IGNvYWxlc2NpbmcgZXRjKQ0KDQpS
ZWdhcmRzLA0KWGlhb2d1YW5nIFdhbmcNCg0KPiANCj4gPg0KPiA+ID4NCj4gPiA+ID4gKyAgICAg
IFRoZSBkcml2ZXIgbWF5IGJlbmVmaXQgZnJvbSBqdXN0IGluZm9ybWluZyBkZXZpY2UgdGhlIGxh
dGVzdCB1c2VkDQo+ID4gPiByaW5nIGVudHJ5DQo+ID4gPiA+ICsgICAgICBpdCBoYXMgcHJvY2Vz
c2VkLCBidXQgbm90IGVuYWJsaW5nIHVzZWQgYnVmZmVyIG5vdGlmaWNhdGlvbi4gVGhpcw0KPiBm
aWVsZA0KPiA+ID4gb25seQ0KPiA+ID4gPiArICAgICAgb2NjdXBpZXMgb25lIGJpdCwgaWYgc2V0
IHRvIDEsIGl0IHdpbGwgZW5hYmxlIHVzZWQgYnVmZmVyIG5vdGlmaWNhdGlvbiwNCj4gPiA+IG90
aGVyd2lzZSBub3QuDQo+ID4gPiA+ICtcZW5ke2Rlc2NyaXB0aW9ufQ0KPiA+ID4NCj4gPiA+IEFu
eSByZWFzb24gd2UgY2FuJ3QgcmV1c2UgdGhlIGV4aXN0aW5nIG1lYWNoc2ltIGxpa2UgdXNlZCBp
bmRleCAvDQo+ID4gPiBldmVudCBzdXBwcmVzc2lvbiBoZXJlPw0KPiA+IFBsZWFzZSBzZWUgbXkg
Y29tbWVudHMgYWJvdmUuDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IFhpYW9ndWFuZyBXYW5nDQo+
ID4gPg0KPiA+ID4gQmFzaWNhbGx5IGl0IGp1c3Qgc291bmRzIGxpa2Ugd2UgbmVlZCBhIHRyYW5z
cG9ydCBzcGVjaWZpYyBtZXRob2QgZm9yDQo+ID4gPiB0aGVtIGJlc2lkZXMgYmVpbmcgcGFydCBv
ZiB0aGUgdmlydHF1ZXVlLg0KPiA+ID4NCj4gPiA+IFRoYW5rcw0KPiANCj4gVGhhbmtzDQo+IA0K
PiA+DQoNCg==
