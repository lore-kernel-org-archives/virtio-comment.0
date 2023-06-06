Return-Path: <virtio-comment-return-6172-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F338C7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:52:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7CA26370EA
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:52:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6293698658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:52:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4D0D198657E; Tue,  6 Jun 2023 21:52:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39F04986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STa8Jbhl4ctVaZONdTJW27JlFrf7cp7t4gav/w31cxQtoVEuPoX4NcdkrtDdtHAEo35z1eOnF05UZ0QtsRTv10KAgIeLziNNK+RkKHpeRRx9+NurJVcJc2dBw2n3bJbyxXrQ95Bg2HfMLdHzTpChR4G/LmiAIhKcHtH8uWIwM9ZjFTFCXU1XMzn0V7BoZV5CiuCmMFQ1IwLTA9MrZYoNbUbsZMOO/QZBDuWt1jowFErE9LR5HhzrZUCempD79GemmtNO8MLS0fnZVbbSDzD3jqb2bFJmPF28lGrOLWAb5SJTY+xxbAY6Oewh/8xNDj9WuMiW5LU0O9dqUyAUYUl8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QajhZt4kFoDGh+wumZ6eCL7+hsHjgVbrcpI0TjGByPU=;
 b=PWknefWXQeB4iAKZT7b/nSDHM3eHr5suxUkBeEs40nVhg9aXpTQ6/NVZFuZNSwmurTKlu58kQst5B2nLR2W922Cxe1gG+7oZpwQeci8yKQSgMIEV1Af7PyuwHcA7eSnwjhw+Rqc9fed8um+lWhX9MpXPSX2n/jtGY1E1ZsCWAGtUlWDzVOaQM5DavnTkg4XVIKsch9nRELvFYmqVomDA5q6zdbMVkE55oNxdVon+BQa69sdZGkzcEqCtV/lTAJykfBTyBorgr1SWL6KtUKv+q4HYLmDbWwp4p2XvlAjm6ye/Xdh6jxbi4ce1//zjIZqYjt1edHvGCVr/wa2tEhiTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "zhouhuaping.san@bytedance.com"
	<zhouhuaping.san@bytedance.com>
Thread-Topic: RE: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission
Thread-Index:
 AQHZfmF1GW/9A6xOmEWve+UarUKjXK97sZuAgABkmYCAADKgAIAAEwGAgAAD3SCAATB3AIAA9OEA
Date: Tue, 6 Jun 2023 21:52:38 +0000
Message-ID:
 <PH0PR12MB5481BC0F1E43C60D11E2E065DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
 <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
 <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fe6a7f09-6ee5-25d0-ea7e-ef4d77a37263@bytedance.com>
 <PH0PR12MB54817ED91B804F55FDC99EC5DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5a87cd0a-c883-5c4c-89d1-59be3ad73b4e@bytedance.com>
In-Reply-To: <5a87cd0a-c883-5c4c-89d1-59be3ad73b4e@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8554:EE_
x-ms-office365-filtering-correlation-id: 2e5fa8d3-721a-47c2-0220-08db66d8582f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ECSAxmIvePUFafbOijOIDrZhgCtShFjBA643ZT7UJ13Sx32nhBTDuGlXm3BatbwCof2WJeoYRqhE+MLciy0w8y2XG6yASDFdVHB3c0jr7TsDO4XZXULU6nNjsTbNZISfohIqOJ9wSiDtjHfKiCFh1eO2SKVeVp4CqwhNJgOyGbXvbUgfIBICHep65BnTtrefWcHNb1HLsDCWc53stAJlJODXNhAAxrw+TohTcAiOY8OyR+BqZ9rPFzf3kuhXaRF+sTxT7qR/jglElWBHC14zE+q5T950h9HfLaeYc/hcgIvvNKhmBnzExTj+oDGo5yOxSaWrM1k0WgTELWiwnelDBPPSzj5frsU9LNeNuwkvNmytlRNcj47ne5WzGAT4nuPYcHuRUjlpn0s2ybkNnfdQFGfcPivfXEKMQtBRRs6JmpovTv7Xf4Kh15TSFhxlo4cwqgynkh5eXeFQKK53ty34PRd8B9BqrrOFKhteXoN6BwRcqNuBF9GJfP/Cr5k+GdalUYCBLcWjk/W6p9ICXurqqJa6nrzKvfcfBSir1hqqxUI5xfAISWYneGxB3p5cZ70TUNoXfXOi67k+Kvx3Js2GOmyL5dNy//3Mb07O0dOgSidDIiRBY58vvPVXqX6z7caAFs4paKxrujL3L2oLjIuIOZcQl6wr2LBQ+tU90LXK9BI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(478600001)(5660300002)(38070700005)(52536014)(54906003)(110136005)(8936002)(71200400001)(8676002)(316002)(76116006)(122000001)(66476007)(66556008)(66446008)(64756008)(66946007)(4326008)(41300700001)(38100700002)(2906002)(4744005)(55016003)(33656002)(26005)(6506007)(9686003)(86362001)(186003)(83380400001)(966005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2tMZjhiR3I4aG1Tc2Z4T1BoYXNTeXp6SVdyWC9WOTk4SXpEU05RMTZIc3Ro?=
 =?utf-8?B?K0tZY3lQSTBMaGNaZjVlQ1lwQitsc3FlN0I5NlpSbU5GL0tpMUtLUjFpekhj?=
 =?utf-8?B?bDArQUh6dDZlQ2lKeEtiMHV3c0UvaEtpY3N2NnFlZGlpMFAybEVDeVFtNGU2?=
 =?utf-8?B?aGFPR3hrbFMyeThLM2laU2lIQ2JzTVFVa0RlUzRIaUwvT3JkT0FZSnBrY3F5?=
 =?utf-8?B?Nk1WUUpONDFyYWVuUWYzUUJJTityeFVZKzA3TTZyY09CMzJaUFFlbmdUYzY5?=
 =?utf-8?B?VWJPUGphbW9uNmdBY0FaRWN0blBlaWtNeW1DdHNVd1Evdkk4Uzl2azgvYjJ1?=
 =?utf-8?B?ZzhOQXRDNmY1QmVLVGdwMUp6Z3k1RUhnRjhqc0xPcUtpNnBraVBhYTd1Y005?=
 =?utf-8?B?QmgyNVVuVnp0aEg2SFBpc3JCQ3RteUVoNHoxcFBNRVAwd3p3NmE1N2xMb2VO?=
 =?utf-8?B?VFgrQXA3NTRnSU9Hcm0rTm1IWHU0L0JoOEx5RWVENEFFZVo1a2VCZWptYUl0?=
 =?utf-8?B?QUFoaC9HQ2lPLzZFU1BFdGhOWkZxSi9kTHR3OG9GNDFlRnBOUytmd2RzczRZ?=
 =?utf-8?B?cmdiMit1QmpIMko4TkJNTFJya3M5NjNSckNraEd0b1QzRlpqVHA3S2h3VXdM?=
 =?utf-8?B?YzVtdHpXQUtTVVVvQWhmbkREU2R2OVFreThnSkc4NzErMURmWUZ2Z0dFb1BS?=
 =?utf-8?B?LzBFNTRrSm14TWVnMTlUVmFJaFBvZ3BCaFVSOGRGd2h5V2I4L0JpRmJIRUUx?=
 =?utf-8?B?VWVlRlR5VmJUVTdjemFkNnM3ZVBUVHU0ME1kSUp2K1hlOVZnc2kvQmJwR0wr?=
 =?utf-8?B?SWM5dW5yVm5IN2pLc2JaU0gzdEJ0aHgzVXhkV0RjVUIvY3RNcHdHN1RXR1pj?=
 =?utf-8?B?WnNhdWlyaEc2YytMWCt1WXVtOWgxQ1VZQnA3R3ppemFqNDhuclJMVmluckla?=
 =?utf-8?B?S216NkJHNCtmZWROMWRiaDBQQW9wdk5qVHRqdWY0YXFmNzFrS3EzY3g5eWE3?=
 =?utf-8?B?T2wweUJsY0wxTEszK252dUN3NnJUSG0yNlI5KzF2SEVhUzBCY09acDk3Z1NV?=
 =?utf-8?B?ejdta0d2UGY5aHZqL2R0M3hBbzdLY1ZQS210d2lPSHUzeUdzTnlEWkUwUUxU?=
 =?utf-8?B?dGJpNDFOT2MvU2xzUmpXc2NwemVvalppRW9lYkRRb1dXaFU0OTlOZmpMWjd3?=
 =?utf-8?B?K3o2dTZGTjJxOGp6SDFTakp5L3ZDY3M3ek9qZWhkSXl1empsRlpWNitseHlk?=
 =?utf-8?B?b3Z4MzA0NU5uTFVQdGNlbjZFUVR5Qm9Kb1hRZ0dEcjZEenlOcmpmQlBvZktI?=
 =?utf-8?B?VFMzeXdjL1JNbXFqNXVhamVoWk0yQTc5MUoxMTlVL0oySW54MTlPMUo3Vm05?=
 =?utf-8?B?Y01iNzVueHY2UEdsOENnZE01UHdGUHpRSXppQmpTcDBwWmF4ZktQK25CWWdI?=
 =?utf-8?B?d1JiR0FwUCt3ZXlYVDBuYWx5Z3dhQVR5T1RQczhyRHVRWmcwV1RtNmMybDR4?=
 =?utf-8?B?S0xYYStWMW9SN0VkdWhRSUFrb3E0QU9lanlIeTJNZGVNUUxUb1BtZnZXMVBI?=
 =?utf-8?B?bTkrUHBvOElKajJXK0JJbHNweTluU3Rsbi94b1dMSkFVY0o5b0drZTQ5Zkpn?=
 =?utf-8?B?VDJMeVA3S3pyL1VXb0dZcnNSYkxwZG1kTzlEa2RkeElaTkREQnJqQTZ3elha?=
 =?utf-8?B?UkxnOGJqbGZoWkc3U216S05PdFc5T3crTkp5WFUxak9CeEpGb0NFQWIrb3JN?=
 =?utf-8?B?RHJSeEdONWRQdzY3R2pGS1ZCYTJ1SitUMGhPMlVYNWlmUUVzMWYyVk1GWjdB?=
 =?utf-8?B?V2xWekFnK3BpVE1KdWcrSXRvODZEVjc2ODNFdzQyWGVtZTRZbVZqQkdqRWZW?=
 =?utf-8?B?OWhMRndVWVlCWm5UVGdqSlVKSmNtUzREaXBSMUQxY21WR3dNUVNpZXJWMVVT?=
 =?utf-8?B?Y3VXcE90MnY5NDR1TU51dHNyZTdxaXhqdUNWelNOY0ZNaXJNS0o0T0g1WkIr?=
 =?utf-8?B?NTgvT3ZQNFhpSnJxRXBoT2x0L29JczY1V3hhNUppMWE1Rm5kbjFuN29jYXFv?=
 =?utf-8?B?aDJaZ1BPOWNkeE0zNS9nVDMydE5NZ3NpL1VUR3NPVjFHMk80cXRGcW0yTG03?=
 =?utf-8?Q?2+bk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5fa8d3-721a-47c2-0220-08db66d8582f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 21:52:38.1151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y64ST9Eh0V1f406OH9Jq+QMqqPMxJyRcQEPLxM52WTmNj/cdK7+TVVJVnqkoNM7SUeo6oaXxFfLvCfMBmilgGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8554
Subject: RE: RE: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

DQoNCj4gRnJvbTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIEp1bmUgNiwgMjAyMyAzOjE0IEFNDQo+ID4gVGhlIGlkZWEgaXMgdG8gbm90IGhh
dmUgbXVsdGlwbGUgdmlydGlvX29mX3JkbWFfZGVzYy4NCj4gPiBBbiBpbml0aWF0b3IgY2FuIHJl
cHJlc2VudCAxQiB0byA0R0Igb2Ygbm9uY29udGlndW91cyBidWZmZXIgdXNpbmcgYSBzaW5nbGUN
Cj4gcmRtYSBta2V5Lg0KPiA+IEhlbmNlLCBvbmx5IG9uZSB2aXJ0aW9fb2ZfcmRtYV9kZXNjIGlz
IGVub3VnaCBmcm9tIGluaXRpYXRvciB0byB0YXJnZXQuDQo+ID4NCj4gDQo+IEkgaGF2ZSBvbmx5
IGEgZmV3IGtub3dsZWRnZSBhYm91dCB0aGlzOg0KPiBodHRwczovL2RvY3MubnZpZGlhLmNvbS9u
ZXR3b3JraW5nL3BhZ2VzL3ZpZXdwYWdlLmFjdGlvbj9wYWdlSWQ9MjUxMzgxMTkNCj4gDQo+IEFu
ZCBJIG5vdGljZSB0aGF0IHJkbWEtY29yZSBhbmQgbGludXggaW5maW5pYmFuZC9jb3JlIGhhcyBu
byBzdGFuZGFyZCBzdXBwb3J0DQo+IGZvciB0aGlzLCBpdCBzZWVtcyBtbHg1IHNwZWNpZmljLiBQ
bGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3VuZGVyc3Rvb2QuLi4NCj4gDQpJdCBpcyBwYXJ0IG9m
IHRoZSBJQiBzcGVjaWZpY2F0aW9uIGFuZCBpbmZpbmliYW5kL2NvcmUgZm9yIGEgbG9uZyB0aW1l
IHByb2JhYmx5IGZvciBhIGRlY2FkZSBub3cuDQpBbmQgbXVsdGlwbGUgaHcgdmVuZG9ycyBzdXBw
b3J0IGl0Lg0KSXQgaXMgY2FsbGVkIGFzIGZhc3QgcmVnaXN0ZXIgbWVtb3J5IHJlZ2lvbnMgV1FF
Lg0KRG9u4oCZdCBoYXZlIHRoZSBsaW5rIGhhbmR5IGF0IHRoZSBtb21lbnQuDQo=

