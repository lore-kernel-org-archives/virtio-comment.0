Return-Path: <virtio-comment-return-6311-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE12BC88CB2
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 17:26:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 13CE744347
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 17:26:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0343898653D
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 17:26:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7CA2986526; Mon, 12 Jun 2023 17:26:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5490986528;
	Mon, 12 Jun 2023 17:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+uneJvcxrJ4eEqCIrEyJdx8DMR73baSfS0xOZ+iURyZw707Df/EZx+U6hef0bON7spUBj8rwfC8SX6hejfTpbbTi0pLWX6L6L8xNge5DTzouHYXHzbESK6uLfh4o+wrhc85Blpk2KaOVXrTVyLQGDWh5P9fvme1fA4qU3PmScCZ4DM/WO8oZo5rRjalKJir/3dZQfRXR+8+gFpc2tUPTDVKzmUS00oqP5P28M/AyYj72J/oRSAQPgzHVW0LNaR/ZOIFuyLbNBIlpQdXvqA9P9uGvTTlzmdJh5PHLplOzyQPUpGMXTkw1oQFN9ZYX6xBuJvTWO/P5MGbNZyDTzUXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBqKjRmG/u8Oi9cBFAqjgqkr0rhK8OiR3S0ygo1SwuM=;
 b=hJMJpxO6h1hmDk1cj6oNL1WixmhZtt/feqDtX+1BndKfzWoITQ2tlTioGeg+GYsInpcPVMhhuxIImgGYRNP4MOXQIUjim23khUnRWJRwyDtU+w4f0o7Vv42YUIuJJ1n67B5AaLw/TBsx2zBRoC5BHUpiCmG2BxjKci87P6OVtCmpxGMnU/5N4+7lrqUGB3EXW/MOe+Te+AQBDgrqOXq+Qe9IP0eMLII8JsR72+LAKFmxhvnwYqKp1dz0iCzLqPq0XD2tRxFbvCKB32w2sDfPq2HKyJGkyIadPg5oydTTAhODtreJMGGmc1QIkpPU52/IFUYTIWSpMncw8HZZB2pTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Thread-Topic: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements
Thread-Index:
 AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6923NWAgAABgBCAABCDgIAGxrQAgACeYKCACPiXgIAALZrg
Date: Mon, 12 Jun 2023 17:26:04 +0000
Message-ID:
 <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
 <20230606120830.GA28580@h68b04307.sqa.eu95>
 <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
In-Reply-To: <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6874:EE_
x-ms-office365-filtering-correlation-id: acedf2f4-c270-4a92-0ed4-08db6b6a19f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P4siRwcNZ3qmT0MlL3pQ0JNR1DuPxz1zFX7S3Ryd3mIWpoecq+gmE85csGlaAf1KRb74vA+N4EDvQqFNydPBQ6ouBlvV0fb3KrxoSyHeRHlbsWGuY0ZUTFYDGN/ytQyLO0iFUVB5LaEvysBVnAaOWIDBu9jsgeCpqX3iojHnPp/MG4PbXIycQ/ZbZ3Uo24O3bYJwYy6bD4oDx0hmf2x+kpyY+ss2g4EDIfy+tF0tyUDm0BvKa2qgRtCpG/3ULzYyEj989J4d41d2ezxGl6XWkiQ3t5YEuw3bUSiq+2QseRTl7iMT5LZ4s0CER/iy6s9f2NuYMuLQIq16vQ9W6CJZAK0LEsfyOwD2242d1TKHZJYAwuBX6W+uKZDHdxAiexupHCpqcLdQN31iLfmJ5eUkXDgO5WY8+J8Ubd8B1zLsO26WnQgHLybT2O36YveDGF5qwKQNL1dqyxdHYmygadE/lSz3oBsknNcmk55ewYrpSUsS2BPr/tyicq/re1TaAUrOF/8+VoB4keZ1FkRXTTRF9RmZGvQ9au/kZw2fiKCtD8ElyHRD/UFrBI8lPKH5rLI9Ts4lM54sjTrtXGBX+PzrKBahzWZgTqGhR7fu3bowFUUI9xrnmDtVjdEox6oscwRp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(55016003)(83380400001)(66476007)(122000001)(4326008)(316002)(66556008)(66946007)(38100700002)(41300700001)(38070700005)(33656002)(71200400001)(9686003)(6506007)(26005)(66446008)(64756008)(76116006)(478600001)(2906002)(7696005)(86362001)(5660300002)(8936002)(8676002)(52536014)(110136005)(4744005)(54906003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1JmNEI4M2pBMEJTcVRNakgwbWpZTXlnZndKMmJsNUxpa1hIN3c4TFRWTmZP?=
 =?utf-8?B?VDVicHFERGhUd1BpTjR5RVljWFpDSHRFc3dZZU1xTkpFb0dJaUNlNUpkWm9h?=
 =?utf-8?B?QXJFWlpIdXptdEhxajlXRnlvRzdJT0M3T0VCRWpzUC9mZjNDY2w3OFlrRE5N?=
 =?utf-8?B?TDJrLzNvV2tadnJmZHoyZkFuNTNBdk5LOUt5THdyZFZ6eEwzd25wYXNzaFFn?=
 =?utf-8?B?NEhSeXFMWDVPTlZ2YVpSUlpQd3MwdHBWVDEzMG1saDBEN0JrOEhkR1pIb2dF?=
 =?utf-8?B?WTM2MHNRZnlMYzM4bUJTZCs0TnJGSlE2K3ZmaEc5WlpBb3pBRWp1UGp5MmpO?=
 =?utf-8?B?c3dDUDlmQzIxdDd5aGV3NnY3T0RBaFFMckhibS9SUDF3YTN0Z0g2L2t1YUlp?=
 =?utf-8?B?cEJsRVZZS1pqbTRXeEdsWDBqZ05tRkJjaDRnaVluSENLRmVFVU9sK1diMHc5?=
 =?utf-8?B?d0VPdE1kRTZLMDBaUUtSOFluRG9pUkJnSVJTZWJ1MUpnbFpOVkFJTE4xMFUv?=
 =?utf-8?B?Y01seGJuZVM5MUFhaWloamhMQ0ZybXpvd1cyRWIvdDh6V1VPcm1SODFZanVF?=
 =?utf-8?B?dEJTbDZnc0hLdXdUNlhPNlhrSkRCVURMeGo5cEJnRFpMcDlnYXF3QnRxamFk?=
 =?utf-8?B?WkFNNTZUOGROWlNuQ2VpSUpWRTltU0QvWk9GRXlWU0tGc3VWcmE2MHZSRzJj?=
 =?utf-8?B?RmpCVFIwOVUzRjV4ODZKVHlYSjg1cXRzSnpxS3VHODdrREZrZVN4OU9SLzFh?=
 =?utf-8?B?Z2oySmwxeWJScmE1SWJ3OUpwWmN4blJMU3RMR2xiaVhZZEFKMC9lNXJUVXdp?=
 =?utf-8?B?NzQrSGJROXI3ZWpxaWFvQ2s0a3l2ck5zUm1jaVhzMVVDWkhuTTBrcHN0QVZt?=
 =?utf-8?B?YzFNaHVSaW5oL3Bnd0kwTi9kNUozZ2JReXZUZUpnNFpSeml5SXpVNjFvZTJi?=
 =?utf-8?B?b2gzbEpFNVpsMDFwVGNBaGdpMzVacnFVV0pOYXNtMEFnSWFJUUhTajhBRWtx?=
 =?utf-8?B?NUlqeWlyQ25DaW01OUxHN0VaazkwYmg1N0N2VG1lMkV0QjV4L3YzTWZkQUxL?=
 =?utf-8?B?eFlscWFMUFArV1FCdWw2b0VUVys1cVk0TFphaTRBc1ZsTjJNNWYwZ1ZHdXkr?=
 =?utf-8?B?b1psYUY0dnZxRDdsM2M2M2loN2ROTGQ4aFltQUVBNnpURC9IOG95OCtSU3lW?=
 =?utf-8?B?SWpnclNBWFBkSm1wVjhtaTMydUdyRE9WZWRHR1B0dFMrbExMVFJhdHpmUWdq?=
 =?utf-8?B?OUpFY2gvKzVETGFkMGRxT0dlODFaQlQwaWlrcG5GbEkrRStPWU00UUxYSWl2?=
 =?utf-8?B?REIvTG5mcURKOWs3UkUyZURQdllrT0tVd1A2aUNpcWtWY1E4b1htcGZZQzl4?=
 =?utf-8?B?VnB4OWV2dWh0WUN2dDBSYkJ4RTVOYXBGUGUrTDZjQ1JHdWt2aVV5N1Zya3Ni?=
 =?utf-8?B?bktMV1kvWnlvVzRTYlcrdmZMWXZGUFpqTlNXUjd4azZ1dmRIeVdhVnRxWDlH?=
 =?utf-8?B?Uit0ZUlGcFBrckh5bFIrNkhCRFUrTlRKdTZnSE12QU5ZanllQTcwa25YNENk?=
 =?utf-8?B?WW1HMFhSdkI5a3hiOE56aUY1SVpYdnphN1Q5UStmSDlQTW5PM1YyT1lBS2o3?=
 =?utf-8?B?ZkVYYkJOdVpYWFI1YW5saUlhbGhBOTcrTHZqWUhoUVJ1VmhmK1hFby9ndzNT?=
 =?utf-8?B?Z2MyZW1vSk84c05ORFFaYUpWMnZQN29wY0Y1eElXSnFhclVJeFlpUTNWWUZF?=
 =?utf-8?B?V3o5RDRmSkxZck1HZUU2SGp6Mm05bTJHYjJJZ3hHN0NPdEx5a2RDa09SMnNa?=
 =?utf-8?B?SkhFNVp1ZEt6TXpsREtxQk1QV0xDcDBHSHB1S2JUT3dtUEcrV3d2Tk43RmlJ?=
 =?utf-8?B?VEhOdGE1bXpxSXRjeHczdlA3YTIrSkFwc1RPZUJFUm12V20rYVBub1QwSjM0?=
 =?utf-8?B?UDhWYlliWWlDd1FvVi9mK2grNW9VNkVlMlNBSEk1VldkVldEQjhvckpLWDlK?=
 =?utf-8?B?RVZ1bnp0eDVyc3VTNW1WZGtLTHJlaWlTT1NkWlZGZGx5eTlkUlhkdk13TlF3?=
 =?utf-8?B?OElKMHI5SzZXYkM3ZTgrM1RvZVpjaVJRVDZUY2QyY2swWVVoMTNBUWl2bEJP?=
 =?utf-8?Q?vwBY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acedf2f4-c270-4a92-0ed4-08db6b6a19f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 17:26:04.8802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjXWo9zjGT3J0p1pViSJALvoDr4AVwqF1Elxby54k8y0SYKifXQwb2XGfknZct0zsJ74CTfbIpbJqezvgKuHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
Subject: [virtio-comment] RE: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements

DQo+IEZyb206IEhlbmcgUWkgPGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBKdW5lIDEyLCAyMDIzIDEwOjM1IEFNDQoNCj4gPiBJIHdpbGwgdXBkYXRlIHRoaXMgZGV0
YWlscyBpbiB0aGUgdjEuDQo+IA0KPiBIaSwgUGFyYXYuDQo+IA0KPiBEbyB3ZSBoYXZlIGEgd29y
ayBzY2hlZHVsZSBmb3IgdGhlIDEuNCBmZWF0dXJlcz8NCg0KU2luY2Ugbi10dXBsZSByZXF1aXJl
bWVudHMgYXJlIHN0cmFpZ2h0Zm9yd2FyZCwgYmVsb3cgaXMgdGltZWxpbmUgaW4gbWluZCwNCjEu
IFJlcXVpcmVtZW50cyBhZ3JlZSBhbmQgZHJhZnRlZCBieSBKdW5lLTMwDQoyLiBEZXNpZ24gYW5k
IGl0cyByZXZpZXcgdG8gZmluaXNoIGJ5IEp1bHktMzANCjMuIFNwZWMgdG8gcmV2aWV3IGJ5IEF1
Zy0zMA0KDQo+IEZvciBleGFtcGxlLCB0aGUgZmxvdyBkaXJlY3RvciB3ZSBhcmUgdmVyeSBjb25j
ZXJuZWQgYWJvdXQgcmVjZW50bHksIGJlY2F1c2UNCj4gZGlmZmVyZW50IHNjZW5hcmlvcyBoYXZl
IHJlcXVpcmVtZW50cyBmb3IgaXQuDQo+IA0KPiBXZSdkIGxpa2UgdG8gd29yayBvdXQgd2l0aCB5
b3UgYSByb3VnaCB0aW1lbGluZSBzbyB3ZSBjYW4gZGlzY3VzcyBhbmQNCj4gY29sbGFib3JhdGUg
YmV0dGVyIQ0KPiANCldpbGwgYWJvdmUgdGltZWxpbmUgd29ya2FibGUgZm9yIHlvdSB0byB3b3Jr
IHRvZ2V0aGVyIG9uIGl0Pw0KV2Ugc2hvdWxkIHdvcmsgb24gZmluaXRlIHJlcXVpcmVtZW50cyB0
aGF0IHdlIGNhbiBjb252ZXJnZSBhbmQgZGVsaXZlci4NCkZpcnN0IGRyYWZ0IHdhcyB0aGlzIHYw
IG9uZS4NCg0KT3RoZXJ3aXNlLCBpdCBjYW4gYmUgbmV2ZXIgZW5kaW5nIGxpc3QgdGhhdCBkb2Vz
bid0IHJlYWNoIGFueXdoZXJlIGFzIHN0ZWVyaW5nIHRlY2hub2xvZ3kga2VlcHMgaW1wcm92aW5n
Lg0KDQpTbGlnaHRseSB1bnJlbGF0ZWQgdG8gcXVlc3Rpb24sIGxldCdzIGNhbGwgdGhpcyBmZWF0
dXJlIGFzOiAicmVjZWl2ZSBmbG93IGZpbHRlcnMiLCBpbnN0ZWFkIG9mICJmbG93IGRpcmVjdG9y
Ii4NCg0K

