Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2074.outbound.protection.outlook.com [40.107.103.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DC1155342
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164610; cv=fail; b=iPmLO0Ch5ifEQC0Td4YOyu6CqW211+2+IkbZGF1sg4cZi8UKm94hgjwY6yIOk+1jEOZC86IvEciZfmLCPcJ2D9hldVSzZZ4qucUVPbjQTUG7iTv1lOhexmbaUH5nypNCIsE2eM4g+Cir5ZghRhYtUIMS3t8qIPZ63NwpAB3nrzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164610; c=relaxed/simple;
	bh=k0RVG6aGP159oaYY4zfz01ORrFhJbaO9Bssr/6ARMTU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N0E9pFMBURbHAsS2AdfNyv6FPs/irumWCxNO4YHRNPViHbBTJBzujf/X58CTTDfV/3RSmQByzTGYwIMgO40AkE1cSzT4NbwMQA0NlqMXKWkoPgcc+GvXetByRiIlqtejF9FKFOlb/1vyPRgJoMmbfvXhmNxha2lElS/ZRnpKF8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=sjRXwT78; arc=fail smtp.client-ip=40.107.103.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="sjRXwT78"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPx/FUkTwTSXOvmQav5W71ejzYhsRsXvP0F328aZnLE8FzQcrR341V51wbyJ3TBZhfUEHPajOgodvga0yK7GQ5h35QRLIpp9DM/2wh7lDDt9CzBoSqp/X4xfx9U9tt4a7QiOlFTcezxFoxjgSTnDbbZ9qpXZw630A02st0A7FA17CayvA21Sggl9yLHgSylwmu2PkrN4B32QoN70pfeUZkeHRpr1RuEx3S1e0JCrm0cdOyJL0SZg4zQ1VYdBofjU7dqFTXMRjEfmb2gj2GbOr/eh4IyNycQsQss1y+0kxTp+OPT0ZabMkI2LNYSn5hdCck32IUwh/Gmx58974Nf4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0RVG6aGP159oaYY4zfz01ORrFhJbaO9Bssr/6ARMTU=;
 b=OTaYogi8ui2kBpw4sjQtgoTeiyC0c30GSsOLfGhSliPE7AvJQX7GHtbvcdXqlnM3dDzw1bz/CdxP9bBQLdDvrkbALlDfkTa/oFWngM7NXbx8Je6mZ4yXjeX/93GyD+4H3pCIczx1OgRuW7qCtk2R41J60ZClFG9hzw6inBXof8UbtgAJHO3hLKSuXH0omGjbxEcaXjVPjFbnLhz5RDNcIQNnEaQJZZe0rh4URo4h2S5trqcJ7JxdAMfLCSuS0jFKSUaT0dMj8x4euyO/4nPpfVzfU1ZxLmi0e2ZlMOMZN/aMqtcZmRCmf9sBrPU+ngmysk+J5nQH2XWNYEDB2MnAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0RVG6aGP159oaYY4zfz01ORrFhJbaO9Bssr/6ARMTU=;
 b=sjRXwT78W2mLwE/Z3709XGSA4v6+Zrej5b8s/AEzkpLrttt9rnaDwC7jhcEE9rttEM4o/S5AG6GtqEdxx+T9tEAAAWqnHG7NFFc/3dJgBcFlM71rKOASNm0shRbOgm1TTnA1aWLsB3JZWQ9aAndvHj+bi26qe38KT8/MGsJ0zjSnXJEF0Z8lMaHrx7aRGY9e34bmDN72DtKxub8dhKWH2zbxc3+XNG6qi1TAI7fhR6dOWwiRkmH9Tx2qDDZbg+RT5/HcqJWxaCXNC8D4OQMWxEjx1XPJD39+yBey48Mj2wV32IMGqPx0KP+t03F/qf4QvdXv02cntyItEQcCjZERoQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAXPR07MB7998.eurprd07.prod.outlook.com (2603:10a6:102:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 5 Mar
 2025 08:50:04 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 08:50:04 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, g.white <g.white@cablelabs.com>,
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v3 1/2] virtio-net: Fix ECN feature descritpion
Thread-Topic: [PATCH v3 1/2] virtio-net: Fix ECN feature descritpion
Thread-Index: AQHbhYHSOOOYDl7Hg0i3wdlkT0/G37NkGhcAgAAxm4A=
Date: Wed, 5 Mar 2025 08:50:04 +0000
Message-ID:
 <PAXPR07MB798486AB0B2AC24CCD10A2FFA3CB2@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
 <20250222233040.29738-2-chia-yu.chang@nokia-bell-labs.com>
 <CACGkMEvaUOqDUOgs8Guhm4iMce4qi=ThEeq_nkT674JzTBLJog@mail.gmail.com>
In-Reply-To:
 <CACGkMEvaUOqDUOgs8Guhm4iMce4qi=ThEeq_nkT674JzTBLJog@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAXPR07MB7998:EE_
x-ms-office365-filtering-correlation-id: f36e5882-41a0-4a64-a1df-08dd5bc2b90b
x-ld-processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1lHcDBRcVZ0VVpYZllmakdKY0RkOG1uRWtZU2w3MmYyMDJ6dUw2eUh6aFd5?=
 =?utf-8?B?bkNSUlBuRVZLTE9GU1BtMS9jZHhQSGowcmRmQ0ZNNE5yNHRCNDc2elJacUgw?=
 =?utf-8?B?RTRkamVNRk9GZktQRDZZNVZOK3VlQnZ4MHM0VFRYWGpuQ0VPd1plQVhESHhS?=
 =?utf-8?B?NWtUVi9CVExoT3hmdnR0SzRERldXdnVBN2pPYmw3cTkzUmFIbnJKbVAyekRT?=
 =?utf-8?B?UGZSVXVUWmtmWlMvZWpkcWhzMmk4QmNHcDhNNXhoc0wvTm9WUnBiZDJUTVVt?=
 =?utf-8?B?dllhQW9xYTlOZHcvR1ZXZ2xaNjR0UVk3ai80R2NucUErTGFnNVVnZFJFQVJk?=
 =?utf-8?B?cmN5RUpSbWNoTzNSdlF6dnBJZUVWWE9SV3ROODRTb09sR0x6bTAvcDc5Qldq?=
 =?utf-8?B?L3BoRnE5aUxYNUVVYkhYUm1raHczSDFGTEdPemFjZjg4NzlvWk9SaDJocUVr?=
 =?utf-8?B?dTNaTHZmT1VKSW40L0tnVTc5ZktGTlcxa040K2hVL1ozbDU1YUI3eThNNk5u?=
 =?utf-8?B?TXlrQVowTllyT3V2L2pYOC96U3ZSV0VYNjdnSlZTQ0g4WENrOFNEZXpOQ0ZZ?=
 =?utf-8?B?V1pnZVQ3dGpTM0g2UUwraVNRcmp3TkZoczZBbEFRenNpcEtFcTFzaFdQVjBU?=
 =?utf-8?B?R2dGT0dJY0sxWTdxSnh4Q0RRZWZENFdBOGpVQ0taV2RSZTBDdWYwYnlKbXZR?=
 =?utf-8?B?SWM0bjFSeFZwenJxWXIxWnNyNitWaCtsTm9zMGFaV2o4ZVZVekpFUEZvdERD?=
 =?utf-8?B?cjZGay81TGhweWNhMmt6Tnk2c1pJYkh1eXZQQ0pMS2szbXYwVU9HTG9uUnJM?=
 =?utf-8?B?QjNNZWNDMExuZUFGRnNMM3R5S2R2VUVPOEpWSXBkRU91RmFET2d6ZHM4L0Fn?=
 =?utf-8?B?REV0MEt1bTVTMmJoeHo4dklTazNFNjdyNmQxSFZkbGhhb2JJRFU3UXVjSytB?=
 =?utf-8?B?aTN0bG1QTHNWSExjWkozcEd5ODlBZUtwYndvNFVaQUpoWHZWT2VMdDFjOGdY?=
 =?utf-8?B?U0JmTXJNdXhXc2w3UGlIdnZqanBUcTlKMmY5UEM4ODJ1dElsSE9UbVdDL05L?=
 =?utf-8?B?YVl3aVRacnVnNjNaWmpJbGRXY3hYVUkxWXk2dzBOOE95ZktaUEZFSjhFUTFx?=
 =?utf-8?B?amdveXliaWVJc001RnBBWllQaU9xd3FQd3NMblEvVzIwS0oxR0FLVE1rQ0pC?=
 =?utf-8?B?UEwvbStlL0JpdVQ2a2FJNk1jNndVcEZkNlNaNy9aRjM1dlZVRVo0dGNJNG10?=
 =?utf-8?B?NHZObzNLU3BVTFpvYzBCR1RJSUhaQjUwQWJJQmVocTdqZ2RSbmlqMm1PUVFS?=
 =?utf-8?B?c3dsQzFYc2VGUmVZcm43TWhnREY0aDZqWlVNVXh6bU1YRGFPTkJUYWhwYmVh?=
 =?utf-8?B?SEgxaXpTSGtVdzVBSFBJa3hyV2ZRZ0tGZDQ0YWFHcUxvWktSSFhsRGZtSWNq?=
 =?utf-8?B?S2RQdzRaUG9UOUVwdFRkTWZpRkRFdlQvM1FlQ1RhVGd6UjJXaWZxbzVucVBE?=
 =?utf-8?B?dUlCQ2JXWVhtZHNpL3Z4ZU9aVVpOZ245dEEyKzR4ZXpYQ3N5U3daRDJnbE1p?=
 =?utf-8?B?SnZSRVNibW52dUFTTzZLcnNRV0hFY1k4L0hRMGV6SFZQbHBMdGNOczJaOHJ2?=
 =?utf-8?B?d1RJVW5vdk9kbEpHbEo2TnB6a2xOUTB4U0RLRTNnYWVUckdJbHgwQmJscVpQ?=
 =?utf-8?B?MlVyeVJ1M1JvWE9helJRRm50NmwxZU9SWDZkOEtiZDBudmJBK3lPSVJZM0ho?=
 =?utf-8?B?R2tEODdNeXdId1NrQzMrWnNnMi9raDQwY0J3Vm9tRUord3Z4N0NQbWxQbFhn?=
 =?utf-8?B?MTBBVTRzUjArMTlNQ2lESE1XYWs3SkE2cE5kRndBWExnNnJ2SHJjK3NhRkxz?=
 =?utf-8?B?Vm0zYjcvSHdrQkpvdjcrMnV4ZFV5UDhGalhJWW1CbzZyM0R0MmVidEdOZUtO?=
 =?utf-8?Q?8e5KJ9pPGO70v3XvW3Jujhv35Ird//GB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVY5VXZSS29pSTQ5M1ZSNk54aUdaZnJTaGZiYXFTcHgybitNcVBjZ0lxWGlV?=
 =?utf-8?B?Z01Gdk5jUVlQcHEyNXRVZmJDdi84cVUxUzd4aUVUUUpRNWxwS09kS0IwK1Jy?=
 =?utf-8?B?SVlYbVV4VThMenAyYjVTdXRwNVcxY05TVDkranFPdFpBNG43TFkrMmNZR29R?=
 =?utf-8?B?T2JlSEV4aytGellwWEJqcjJJVDd5d1JYRGVBRkltWVBTTXNzTFZNb3N1ZnZ6?=
 =?utf-8?B?dHRwL3M2TmY2Zng2WXVPU0lNTmF2Zi91YXRSK3dBMkRYOXlaZzlwVHRHSzla?=
 =?utf-8?B?THRMRTFMWDR6TzFBMkkvV3dtcUJFMTBoSUQzZ1VoYkRoUWRQdVlRNGQ5QkxP?=
 =?utf-8?B?aGVzNVVadENOcm5CcEhKSnFKTVRFQk5HQzVleTNJM3M5RmtVbUEvMXF3VTNX?=
 =?utf-8?B?TGQxNmFaaVVXV2NQS1FBbVEzLy91Z2JrK1Y0NVhBUGNRM1RQMWNrU0dyTUIx?=
 =?utf-8?B?S2JYak9CQXNuTE1kVUdITU5vMWNSbnJ4Vnh1MTE2Q05yMU5zMWxWUU9BMGZO?=
 =?utf-8?B?NVJ1bGd4NDdVdTc1dEtCWlZMY25WTithZUIxVjQ1WlF3QXpya2dZa09yWS9w?=
 =?utf-8?B?SjNPYkU1aEtCNXRsbzNzWHF1c1JGMXNzek1QTWlwVVI4dHFUY094K29CUlF6?=
 =?utf-8?B?OHIxZUVyTDFkbk9KMElxcmZyVlBNT0NSUis0dTJxL0ZFWCs3dXRpNGJyQys2?=
 =?utf-8?B?MDdBWmZYNUlKdWJOTjNkR3lrcURMMDcwUU5sQWxGbWlFNWpNZjZXUjQrTyt3?=
 =?utf-8?B?bE1zT0JHQ1RGWHpJRjU2MktnYlg3SXVBMzZzb2ZnclhvWDdEaVV4WWNtWTRW?=
 =?utf-8?B?aHhMRHh5eG9QTjh3NENMMkcyZWloYU5JQmVicTlZWGU3aGYyajk3S1FLVitr?=
 =?utf-8?B?VkFnRTl2UVdUTkNJaHp1K2VWMEFZOG9YNjVFWnM1TEFXdWtvSWlGeVRRUkxX?=
 =?utf-8?B?VHZPVm9oL1puTmdwREJwL05OZUFIamQwb1BIZmNCVW45NS9tRXBTL2t0YXcz?=
 =?utf-8?B?bXdhZ2JqMmZHaUgxdWhSNm9kbjBrOHRwRTJINWxEUWlTWlBKVVNEOFViVDBG?=
 =?utf-8?B?c2ZZNkRwNWg1dzd0L2ozaER3NEVHcjM4Vy9PNjU4dW5HbEQ4TmM4b2lUa3kr?=
 =?utf-8?B?MnJCQTB6aDZYUjBJdVpyZm9TZXJzSDFXOXJReHM4Vy92SHR1dnJCUm9BbVUy?=
 =?utf-8?B?emx5RytML0wyWDR1dk9QZytXUlV2ZzBzN21ZZWFPRUR6OEMyNHVVaTI4ZExx?=
 =?utf-8?B?QXYwRXM4SGZOTjRXSGNLbmhSYjRUdkpKYy9nRjBaLzdkU005RGQ3Z3dGYTJt?=
 =?utf-8?B?L2E1MGU3U0NNbnhudWo4SDJlaThtb2QySlVZZFlVWjE5Wko5dXBENm94UlJE?=
 =?utf-8?B?aE5aYkp4Nk9HUmMvODB3L0hHVFluN2lhR05DeGY3OGs4bVN1NHdqcWlOZDNX?=
 =?utf-8?B?akRKRTRVY2prM1FueVlOOU1Mdy9ud0FuN1ZaK2dlalNDQWF5QWdPWEcyRUp1?=
 =?utf-8?B?cWQzWTFobHlESi9nbFVETlpvdzhoaEt2WmIvU0p6aGJ0eEFNeURUNDlnRXN6?=
 =?utf-8?B?TmpNT0YyL1lvVHZZVnk4bkhHQUFSS0doV3RzYW05bURPZStRVyt4UXA1cUZ2?=
 =?utf-8?B?Vnh5OWZWYVowaitoUGNIRE1CZHpmYzZpZy8rdFptNHZEMlpFOXR2RUFZMld4?=
 =?utf-8?B?WVZETERjdzh2NzF5VkRuT25mNDZZV0dDdW5EK1gvTDBzNWJHWEEvNTRmTkMw?=
 =?utf-8?B?OFRteEhXOVc4bXpCNDd3d3U1SG1zUjVrZHNLbjhhekkyQ1RaRTNnYkFXaUtL?=
 =?utf-8?B?Nk9DN2dKWm5SQ3VtQXp0ZHdIcit5U3NNYVpnUXVPNGI3M3oraDh1QzBkQWNC?=
 =?utf-8?B?aC9OV3NORkVoZDN2M0VJTUJNbWJpMlNLdTZvWUQ3dG1ieEFXSmhmWWN3aVVm?=
 =?utf-8?B?WE9oazFxMnh2VU9YN3N0a3FSR3pIRkhLWDIxamFheHQyQVVmQTgvWXZrSEJG?=
 =?utf-8?B?WXVXcGMrR2g5SEF5MWRJNEppYUlUN3lBU0hEVTE3Wk5BUE9SeTMvcFI4NlZq?=
 =?utf-8?B?UloxRVAzMHBkWmt2bDNrVllKblB0b0VaNFIwQkJIT2Q2NDVRZ0QvRFBoQkdo?=
 =?utf-8?B?bnFsTTRya1NKdGxueVUyUUwweDljM2VTUDdydkxGRDRqSWlXNiszdTUzR1lO?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36e5882-41a0-4a64-a1df-08dd5bc2b90b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 08:50:04.2621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTzyaZia5Cap5XctQxFEwp4JHnSzZPzTCNVNj6W2JkmXLyGDSV11ktJCpy+1WcE+lPKOgYVw7eu4Wdb1xr4uQ8TcUVWkw9ReWy1CqZKesQlX9BhzP/C5ML3tWFpas0Q4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7998

PiBPbiBTdW4sIEZlYiAyMywgMjAyNSBhdCA3OjMx4oCvQU0gPGNoaWEteXUuY2hhbmdAbm9raWEt
YmVsbC1sYWJzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBDaGlhLVl1IENoYW5nIDxjaGlh
LXl1LmNoYW5nQG5va2lhLWJlbGwtbGFicy5jb20+DQo+ID4NCj4gPiBDbGFyaWZ5IHRoYXQgdGhl
IFZJUlRJT19ORVRfSERSX0dTT19FQ04gZ3NvX3R5cGUgZmxhZyBkb2VzIG5vdCBtZWFuIA0KPiA+
IHRoYXQgVENQIGhhcyBJUC1FQ04gc2V0LCBpbnN0ZWFkIGl0IGlkZW50aWZpZXMgVENQIENXUiBm
bGFnIGlzIHNldCBhbmQgDQo+ID4gd2lsbCBiZSBjbGVhcmVkIGZyb20gdGhlIHNlY29uZCBzZWdt
ZW50LiBUaGlzIGlzIHVzZWQgdG8gb2ZmbG9hZCBUQ1AgDQo+ID4gQ1dSIGZsYWcgaW4gYSB3YXkg
dGhhdCBpcyBjb21wYXRpYmxlIHdpdGggUkZDMzE2OCBFQ04gYnV0IGlzIA0KPiA+IHByb2JsZW1h
dGljIGZvciBub24tUkZDMzE2OCB1c2Ugb2YgQ1dSIGZsYWcuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGlhLVl1IENoYW5nIDxjaGlhLXl1LmNoYW5nQG5va2lhLWJlbGwtbGFicy5jb20+DQo+
ID4gLS0tDQo+ID4gIGRldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IHwgMjkgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RldmljZS10eXBl
cy9uZXQvZGVzY3JpcHRpb24udGV4IA0KPiA+IGIvZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlv
bi50ZXgNCj4gPiBpbmRleCBiNTQ2Y2Q3Li4xMDRhMzJmIDEwMDY0NA0KPiA+IC0tLSBhL2Rldmlj
ZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+ID4gKysrIGIvZGV2aWNlLXR5cGVzL25ldC9k
ZXNjcmlwdGlvbi50ZXgNCj4gPiBAQCAtNTQsNyArNTQsOSBAQCBcc3Vic2VjdGlvbntGZWF0dXJl
IGJpdHN9XGxhYmVse3NlYzpEZXZpY2UgVHlwZXMgLyANCj4gPiBOZXR3b3JrIERldmljZSAvIEZl
YXR1cmUgYml0cw0KPiA+DQo+ID4gIFxpdGVtW1ZJUlRJT19ORVRfRl9HVUVTVF9UU082ICg4KV0g
RHJpdmVyIGNhbiByZWNlaXZlIFRTT3Y2Lg0KPiA+DQo+ID4gLVxpdGVtW1ZJUlRJT19ORVRfRl9H
VUVTVF9FQ04gKDkpXSBEcml2ZXIgY2FuIHJlY2VpdmUgVFNPIHdpdGggRUNOLg0KPiA+ICtcaXRl
bVtWSVJUSU9fTkVUX0ZfR1VFU1RfRUNOICg5KV0gRHJpdmVyIGNhbiByZWNlaXZlIFRTTyB3aXRo
IFRDUCBDV1IgZmxhZyBzZXQsDQo+ID4gKyAgICB3aGljaCB3aWxsIGJlIGFwcGxpZWQgdG8gdGhl
IDFzdCBzZWdtZW50IG9mIGFuIGFnZ3JlZ2F0ZWQgc2VnbWVudCBhbmQNCj4gPiArICAgIGJlIGNs
ZWFyZWQgZnJvbSB0aGUgMm5kIHNlZ21lbnQgb2YgYW4gYWdncmVnYXRlZCBzZWdtZW50Lg0KPiA+
DQo+IA0KPiBCZXNpZGUgdGhlIHF1ZXN0aW9uIGZvciBwYXRjaCAyLiBJdCB3b3VsZCBiZSBhbHNv
IGJldHRlciB0byBnaXZlIGEgbGluayB0byBSRkMzMTY4IGluIHRoZSAiTm9ybWF0aXZlIFJlZmVy
ZW5jZXMiIGNoYXB0ZXIuDQo+IA0KPiBUaGFua3MNCg0KSGkgSmFzb24sDQoNCglUaGFua3MgZm9y
IHRoZSBwcm9tcHQgcmVzcG9uc2UgYW5kIGNvbW1lbnRzIGZvciB0aGVzZSB0d28gY29tbWl0cy4N
CglJIHdpbGwgbWFrZSB2NCBhbmQgcmUtc3VibWl0Lg0KDQpCcnMsDQpDaGlhLVl1DQoNCg==
