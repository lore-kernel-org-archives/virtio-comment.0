Return-Path: <virtio-comment-return-5784-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FBFC77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 20:30:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1F5D232623
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 20:30:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E6CE98665E
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 20:30:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 010849843C5; Thu,  4 May 2023 20:30:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDDD298663D
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 20:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI8EzbCi7FmRn9HK3J1eSVra1j81pFbLLKaC+TqPC4AZAYz40UrGvYk0sbiVrPeq1M6aMMduBIkkt+YsbI+CPCyRqu0Z8i+aDgJO0yhWfDidf4+Cf48IngcEvmWxLnQvQnKy4EbLcm7mcxz5JP31rCWhVXWBjaa1/gekK2qu9MZ01bDA5/gTk+9Pv1lN2KvC7jCYeTuhy6/POGuZa+iRRd/4ufJT+b/8n27Xqd5NyfVIYcibK/opW4lh1WcE0J+WedzhHg8fd6rATu4w+Nki9BK+Mzh58Jld1PQ7BELVbug0tq7PbPLqgYzo9+PQ3n5j8RBZjdEiD5Mr9Oy0CSrtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEpfBKDHAs7XYFK7tfnNnQ4QKzXcYQmNzL8soei9ea4=;
 b=JYlu5Iqo60Z9lH4+a6nNZk0Ro9VRa1kyLCfOVoeUp5LNTXawqK+xicoCO3j00wI70j/Wo2g6+5jpRXup9DljYB6L6ENlAhp0gR4BmfwrhgkW2YLHUm5Wk44w+2Wwl3mUwT7DbukFjb/T6u7ncnyvtWMrvLLfv1V8JtOGfg9xqKOh8otWhdWbhh54ueZHcWCp4bl2ct2qUonzL5sbR2aLPPIdXIxdpk4ylL0OJS5lm6FPZ4O5aW6H1CioYipG6KOkq2SVQEPjdCY720+wfsWsFuRj9JTvZ9nvRWWsFoI6Y2GCwjycM2lIBq/nuWYQbC5uwVgEl3u9eV9ILBCgPxf/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cyril Germond <cgermond@kalrayinc.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.
Thread-Index: AQHZUBws9xErIboLTkuPTmBRBa1so69I6OJwgAAwy4CAAZsyAIAANQFw
Date: Thu, 4 May 2023 20:30:27 +0000
Message-ID:
 <PH0PR12MB54813E2268517CE2F9F62D62DC6D9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20221121090212.645-1-cgermond@kalray.eu>
 <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
 <d3aa5c40-2b26-9cd1-5e12-83b102fbf610@nvidia.com>
 <PAZP264MB38885621CC322CADCCDC965DC66D9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To:
 <PAZP264MB38885621CC322CADCCDC965DC66D9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4922:EE_
x-ms-office365-filtering-correlation-id: 7c89c2bb-7b47-4afc-0632-08db4cde6568
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lMR1oonjA3s/QHrO2bwMa4NKnm+lhCaegKePA5hJAMYgwDO1RDV4dEHzDdrTpRmuSR/WhQLq4/XO8xMfyNJ13sdtnBR9uaS0TTiTTHQxxNNmM0TAXpf8yBqUzzQSeDgj4rT+xeU8kqMfM6X0Oniai5GGRFULRSCf93zpA2UGGZew8o8xfnYweEiDc36ZT7U1RyKX2pDEml5vCMm22+YuxSgxvRcKpPgNKd6U7FbfaiF1IFfIkk7b2riIZ6FUKmQDbIsMDSqL/IFcH90LfSwfFIZ/eKPjV+Kpuw/CrLIJy7BJ0mwkDaU3i/m64CCGUtLO92boUlsYniI9P5zINK6iGc+sptSqriGl92M4XIenSjzpmMKTxHdXb3AEo+6l5RT5iq8m968hftDNF7ox5NxtsV2U63D6L+pS8cFY8pjOrQScj2N126/Qn2VdovUHUN4EdrPVkmpIxq7MtbxH/8H2E0l+6KzzB+vPbY7GXvGwc+fAAA0I3ON/VQ1GxiS+3yr3X/xh0nzaxLA2OHtiL/SDjt5u596zNYQ4NMxqoTxytDtHFm3wibESTS3KDpHi2A7/J0ZIc/4YVh0tRfikphkMCa6QWB0jnSxRc1PPaecXKP4nn/zXOyWZgdfr4ZdKrNjw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(76116006)(6506007)(478600001)(71200400001)(7696005)(186003)(9686003)(26005)(52536014)(2906002)(38100700002)(122000001)(4326008)(41300700001)(66446008)(64756008)(6916009)(66476007)(66946007)(66556008)(5660300002)(86362001)(8676002)(55016003)(33656002)(8936002)(316002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzMrNnQraEdoTWxYb2Rpc3hkSmhGa3BSRk1lSVlKMDlsNVMxUThra0I1WEp4?=
 =?utf-8?B?eEtsUEdPMGxtWDQ0VHpaanlxRmx5U2Ixb3EwZlJpRk5RMXhOc2R3aUU3YURB?=
 =?utf-8?B?Y1ZXem5odjRNanhPZTRxVmdPMWJtdXFJT2p6NmpjR1RCcHBTVzZRYlppV3lj?=
 =?utf-8?B?a1Z0U0djcHZhWTZWQ0YwWGcyaXdkRGZDVjhpS01NOWlRNjhMOFBOSVh0c3BD?=
 =?utf-8?B?RVVIemhJNHJlWjVqaUorVlVTcm5pUzJ3bFNuUUFlSXJCZU1pRldHUUtvZjh0?=
 =?utf-8?B?S244RU5MalhGYWxTVnZYSDNOVEt6WjRCZTdRTmcrbEJvV1hyTi82L3JLSEY0?=
 =?utf-8?B?Ynp0MWJiYzRFL2phUnFlNUVxdVhjQ3BmcERMbEJIQXVURlpXMnlmcUt1OGww?=
 =?utf-8?B?WVkyYzhVSm1CakwyQkFzaitsZTJMdXRvVWxtb05pVTFpMlc4NytqOVFOR0pB?=
 =?utf-8?B?R3FtUmlwMGJTZ3JqY3Q1eUt2c3ZEclIwWUkyWjN2Sm5EYW1pZ3NvdE5LQTQy?=
 =?utf-8?B?ci9DcGRMRnd3bktsTTRkeGdaUE9SczVKak40RDFaUmlSYy9LMS9qek9CVzFZ?=
 =?utf-8?B?ZlBFb1hrZ2Q5NWF3WVhCU0h0L1JtT2FLYnp4K281dktmaHYvQkdhV1I5ako0?=
 =?utf-8?B?UnJkTzFhTHlTMU4rTkVlbmIyS2ZEY3lrSENuKzk2NnZXT3JmS1BGZ2xLbXlO?=
 =?utf-8?B?Q2haSVdRTUtpSjFubmNPeENKQmdRL0ZvdE53UlVZcllSZHB2d1NyZHJLczl0?=
 =?utf-8?B?ZmxYMllqc1FDT0thVGYyd2hkdklMaWh2b2FkK3dGcVVWQ1U2UUNiK0x1T0ZX?=
 =?utf-8?B?d05MOGdvY3BSYkp1Tm5xZDA2L0lKeG5WTnlzK1hKOU8vbm0xb3N0a2ttd1Iv?=
 =?utf-8?B?cTFvNGFDL3B6UlhuQ0E3SmtsY01NTW5YOHB6ekdCazB4SzhQZGFFcWpucHR3?=
 =?utf-8?B?bHdoWm4zRFJFT1lGRTRmemYySkJvRS9LUnh5UTZaVER0R2dtVjhDU2hsaVdx?=
 =?utf-8?B?cmFVd2pPclF1Sm04YWRhTVc3RUhMSFFTRjhIWEFndmpCV2svUUNnSkJZeEE4?=
 =?utf-8?B?WjFNeWttY3RVQmhvZVdnUC9EMEthZmpQeWpVbE9Cd2JrZWdaYi9UdzU2ZTlG?=
 =?utf-8?B?aUgxeUZ0NG5iUFhCTUVFZHRGR2ljWWcvU0V2QU9jZWxBTzVpandiZVk2ZU52?=
 =?utf-8?B?OGl4eWlodEM2TFZNdWFmVFhvdUtYbjhMbVlFcXBMZkpENFpsWVREZE94OVNP?=
 =?utf-8?B?NTh6MHc2OTdDUnc1d0M2eTFLcG16Y3dNWVlKTDJ0RVJkejhuVFJIWHFhN1ZH?=
 =?utf-8?B?eStTK1BtelZnVjdGWmlpY0k4NnFEUjR1YzhjcE51dVFYTWpSSmJGaDJ3YWJO?=
 =?utf-8?B?Z1hnc2FyMU9EWkZ1K0tlOUh0ZFV1bUtnZGJJWkdnSjVQVmlXbFZtQ3dnamQw?=
 =?utf-8?B?WTl5NFRWSFBoMTJ6QjRhMGNUcWpnRW82MitoMy9VQnBESGJsaUNnZTcvQ3lx?=
 =?utf-8?B?WWVOZXBOdWVnUEhHbVVNbHdkdG9wQlBDVnlOcE43cnlYaGNPbXBFbTJtZU9k?=
 =?utf-8?B?WG9hcUpvcUVtdm10WmljcHBiR3RCL0FRTFJ1QWtuZHJtYnF5cWdkdmV1UDZQ?=
 =?utf-8?B?blQzSXdwaGwvbE4zWUhmMWRZZURZTTFQbjNvM1ppZVd2T0xFdTJ2MG5oT3Nk?=
 =?utf-8?B?aFpTS1RsTWJDVkIybHBqY0tqYzNZRzlzZ2c3YkQyWTh1eGhMSDBsek9uei9E?=
 =?utf-8?B?ZW9sSmN3OCtnZXgzV0pzOHZxWGJaMHJOc0lTd0E2NkFuekxLdzdGNG9ITzAy?=
 =?utf-8?B?RjFEN3ZmYVc1WjFuRXFwWU1MeWc1ZmxKcjUxMkxaeFk5NkFzOHVrcHdrdEUw?=
 =?utf-8?B?RkN3L1VNdTd6UG9hUGNTUisyblVVTGRBRUthS0pJa1g4Y1dGZmxmVFpQTG5o?=
 =?utf-8?B?ak82dEs4QWIzRVU0QWhlQS9IdjFtbFpla1lSU0hIK0dmUnM5R090WXo4bkxl?=
 =?utf-8?B?SFZ5RHVEL21ZeHZ5ZHFkL0tOS1VmVUNDNFlBTGlSRWxqNG8rSTR1RlZxYmtW?=
 =?utf-8?B?cDZuYi9rOWhHT3F0S2o1MC9OVnFrcW1tcjNsdzU3ZGRQMXJBVmhOYlVlZ2Vj?=
 =?utf-8?Q?iwXQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c89c2bb-7b47-4afc-0632-08db4cde6568
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 20:30:27.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKjqHn34dOz7mAjvpKEDofG0ryPp355TMNNVGjk4ii/TsEugaV14CQztQ2LvxWAqxuzvbRzLsiPNSYzdUKB8NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
Subject: RE: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

DQoNCj4gRnJvbTogQ3lyaWwgR2VybW9uZCA8Y2dlcm1vbmRAa2FscmF5aW5jLmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIE1heSA0LCAyMDIzIDE6MTcgUE0NCj4gDQo+IEhlbGxvDQo+IEkgYWdyZWUg
VklSVElPX05FVF9IQVNIX1JFUE9SVCBmZWF0dXJlIGlzIGZvciBpbmNvbWluZyBwYWNrZXRzIHBh
dGguDQo+IE5ldmVydGhlbGVzcywgaXQgc2VlbXMgLSBhdCBsZWFzdCB0byBtZSBidXQgSSBtYXkg
YmUgd3JvbmcgdGhlcmUgLSB0aGF0IHRoZQ0KPiBwYWNrZXQgaGVhZGVyIHN0cnVjdHVyZSBkYXRh
IHR5cGUgLSBhcyBkZXNjcmliZWQgaW4gY2hhcHRlciA1LjEuNiBEZXZpY2UNCj4gT3BlcmF0aW9u
IC0gaXMgdGhlIHNhbWUgZm9yIHRoZSBSeCBhbmQgVFggcGFja2V0cy4NCj4gVGh1cywgaWYgVklS
VElPX05FVF9IQVNIX1JFUE9SVCBmZWF0dXJlIGlzIG5lZ290aWF0ZWQsIGV2ZW4gZm9yIGEgUngg
b25seQ0KPiBmZWF0dXJlLCAsIHRoZSBzYW1lIHZpcnRpb19uZXRfaGRyIHN0cnVjdHVyZSBzaXpl
IHNob3VsZCBiZSB1c2VkIGZvciBib3RoIFJ4IGFuZA0KPiBUWCBwYWNrZXRzLiBBbSBJIHdyb25n
ID8NCj4gVGhhbmtzLA0KDQpHaXZlbiB0aGUgY3VycmVudCBzdGF0ZSBvZiB0aGUgZHJpdmVyIHVz
YWdlIGFuZCBzcGVjIGl0IGlzIHRoZSBzYW1lIHNpemUgZm9yIHR4IGFuZCByeC4NCg0KSG93ZXZl
ciwgdGhlIGRlbHRhIGNoYW5nZSB5b3UgcHJvcG9zZWQgaXMgbW9kaWZ5aW5nIGEgZ2VuZXJpYyBu
b24tbmV0d29yayBkZXZpY2Utc3BlY2lmaWMgZXhhbXBsZS4NCg0KV2UgbmVlZCBhIG5vcm1hdGl2
ZSBsaW5lIGluIHRoZSBzZWN0aW9uIGJvdGggc2VjdGlvbnMuDQoNCjUuMS42LjIuMSBEcml2ZXIg
UmVxdWlyZW1lbnRzOiBQYWNrZXQgVHJhbnNtaXNzaW9uLA0KNS4xLjYuMi4yIERldmljZSBSZXF1
aXJlbWVudHM6IFBhY2tldCBUcmFuc21pc3Npb24NCg0KU29tZXRoaW5nIGxpa2UsDQpGb3IgdGhl
IHRyYW5zbWl0IHZpcnR1cXVldWUgdGhlIGRyaXZlciBNVVNUIHByZXBhcmUgXGZpZWxke3N0cnVj
dCB2aXJ0aW9fbmV0X2hkcn0gdG8gYmUgdGhlIHNhbWUgc2l6ZSBhcyB0aGF0IG9mIHJlY2VpdmUg
dmlydHF1ZXVlLg0KDQpUaGUgZGV2aWNlIE1VU1QgY29uc2lkZXIgXGZpZWxke3N0cnVjdCB2aXJ0
aW9fbmV0X2hkcn0gc2l6ZSBmb3IgdGhlIHRyYW5zbWl0IGFuZCB0aGUgcmVjZWl2ZSB2aXJ0cXVl
dWUgdG8gYmUgb2YgdGhlIHNhbWUgc2l6ZS4NCg==

