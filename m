Return-Path: <virtio-comment-return-6315-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B3C88CB9
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 04:16:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9741A29FCA
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 04:16:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8275398654B
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 04:16:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 715D598653D; Tue, 13 Jun 2023 04:16:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BA7598653E;
	Tue, 13 Jun 2023 04:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSAosajBotJEw0fdxraCG06QEJVGNLNiaykb+fZEgxki2fP1NALPf67gh1v6mnvP/9+5JLa3yJMe9gTdtDjDr0EnwEgyKdHh39/eLxDOi+WR3gZtkSem5KQj504nXrR8fKUEtja4rhlSGo0dlP4eM64GnEtv9ggkxB40HuVTaDEbC1D3K29EahLSrQpExcT1YNttyINqUVyVF5NbA21//dq7sisdXnxfXadKUhP+DigZdAvoZoVQAntEj/2HE+4LfGnExQUad02uiXk4nijsmtPAMpl/8UDFPZZSPpAwMYhIXkb/uDjMwc10FICGCMjdHenndWHe1lABLaMXMJN10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+NRoBtj4w5pqEyCwTijyfgD8Unoaz1+k6zm7qSiiyk=;
 b=dhuaI00tY7zsl2ZHGecdBJSW+/kMKCup4h9+5ppmJ3y6DDUHt60XD0IzcqDHmo51sjiCALe8ToioH6Krq8uzdveVO8RmyAjfF0tu7DPPSKNDkpXE6cmTZXx6o4fxBBJDwkDR0kWLlLHdIpAOA+P9UMOa3jsTDYTrNjmX8VmlqIYKRW+zXAPTaywjUSAIYIOuD9ZboI9jBJtOp7VYmXXulLhBov0NCHe3WsMY5vU+rvR/D0Aw82t1qjr434/uMmGA5v2C0ycHdwOALsuMLpZyKFO2E8Keqpji8P0NafAUW/MyoEOBLX59Pk8CQHGP41jeYqv6GPclICvEETt6OyDnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Thread-Topic: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements
Thread-Index: AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6+IG88AgAAT5pA=
Date: Tue, 13 Jun 2023 04:16:26 +0000
Message-ID:
 <PH0PR12MB548142D52698EFD9E101D555DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <ae7b4a7f-dc9b-3466-1a46-8535f288856a@linux.alibaba.com>
In-Reply-To: <ae7b4a7f-dc9b-3466-1a46-8535f288856a@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4959:EE_
x-ms-office365-filtering-correlation-id: 08cac091-cdec-46bf-f2de-08db6bc4f4a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NSnLGUV68KsRgzfVEfGrDwRLxZ36S8iWzmq4rUGyU/ohbl5L9osK2/ZAqWEaqk6udevSvZKxMDzD1n+84eYQFyLZi+oNlLanzYPrjp/Hj1lDSem+E0iAxrG3NsMb6/MyYJmsMzM1LuVzqJU5Omqb9ygf+K4QEu4XIO8QaSKEahvmKK8boJWANlsm3HfdmYoYpsBE7X3s7q0f7FyzKwLOB+9gCUE4IAMXAWmi4T36LCoXs0iqksXMOtSDULo9hxrhkv2tOVF2nBvsrKKnktZ4IO2agPEzEpvX8kbSyC6re9gip0jzEJvR2RhwbLvVhTQiuBaOzC9eUGg31X+cwhsxIwul38/HnWLtdrjgjMKdLlDfzLTPqEMXZCFYGgIcM/YSKZET19G+B39OpQKzyGXqrFT7plUe5lS9teNnCozPhkwoosgLbUqDo8VqT6OJQlvvlAN8Ec6OpNDkiHuu9PJdri8cOSMcW1J+HRZCAHTO+E7TArFB89BA2npbpF+hcNpH7ae+fsF3ud6+YjQ28wkRH4WitaQz63sSZxftWqzraK8Q+TYHKCX4B7mTm6jTl2AXrrG2Uxvpk/+UZ+r2pkCa9LRT9WuYywJfEp+3Je/j5JN0MzuWFSNMl2UVBS3j1G0k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(83380400001)(33656002)(86362001)(55016003)(122000001)(38070700005)(38100700002)(478600001)(110136005)(54906003)(71200400001)(4326008)(7696005)(8936002)(8676002)(2906002)(5660300002)(52536014)(64756008)(66946007)(66446008)(66476007)(66556008)(76116006)(41300700001)(316002)(186003)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2QzOHhIOGQ3UHEweGVVSktIVS9kM2lzWUl5ZHZPMXdBU3NwQ0N1MFp4Mi9w?=
 =?utf-8?B?eHNxT0J2MEduYlEyc2hVcEExTkNsdm5Ob3l2cFJwQ0FHdTRQNWNZL0wwbjFx?=
 =?utf-8?B?V2UwTHk0QTlTdTZCNFIrNHcxdThDeW9PNzhZR2c0VktKT1MxOHdrd3R4cGJj?=
 =?utf-8?B?aEtrTWZwM1dUL0hwYVVkMnpLQTZJT0J1TDdwaVo1NlZUZWRmOWpZS0Fyc3U1?=
 =?utf-8?B?UURjajNxc2dETW11WGxSbnhqdndZanZVUnArc2VHdXFtenJzeDROU1diaFVF?=
 =?utf-8?B?YVM0UG95YTZRVUJQa21QRGczREIzbzZCMEtmd3RteVhQWDQvVmdRa2dIMzQ4?=
 =?utf-8?B?MG9OcTRPRFM5QkIydVBJWGgvUFhCbmxRRysxQzYvR01CWlRvbkJiYk1IT3R0?=
 =?utf-8?B?bC9FRmJOVXE2enpvUVZGQmR6SnNSQlNwYlprbjZwK1N6bmFxbnFZczRBaDhm?=
 =?utf-8?B?b3BMZ2VFcExDMkwrUFVjOCttL2k2cG1YZTBDOGNON1E1SjZPSmJ1Rk9ud296?=
 =?utf-8?B?UG5vdFpMNHdXdHA1eWVxV1UwbEpHR2tKcDQ1ZU5HYTdsVjJOYW96MjgxOStL?=
 =?utf-8?B?cmZsU0laM0tJaEVuQXJHTkUzd1hMZWFJVkVKanZMNUtwUDd1Z084SjAvd25I?=
 =?utf-8?B?KytvYnlwaXBEd1pNSi96MkZLcFNvV0R5M2t2dlpId1VWb2pIeCtFNWVpSUk4?=
 =?utf-8?B?R1U5eHFzQ3pWRC9EeWRkbUd5Tk5zQ0c5K1JQWWpvc2E2NitsMzRsSTc0dStY?=
 =?utf-8?B?Ymd5WXE1QkIzc0d1NFpnYmJrR2o3R3RmWndrSlZTRmZCNTg1WW9WY0tRUFFz?=
 =?utf-8?B?dGdaS3Qxc0wyT2ZGQTNDbUI3K0h2MDlHTVQybWZNeVAxODduYkphZ0w2R0dT?=
 =?utf-8?B?eXVLTUo2TXVHdlBUMzFyRUNSTGs4NGNScUsyY2RwNFA1MkdZYXF0VDlLcFYr?=
 =?utf-8?B?K25tNHVDT3VQSFprdzlqOVdJaVFDRS9JUjJUMEVSeXlORFRuMXlHV2dWYW5y?=
 =?utf-8?B?UHlLUURsekUxcSt5emd3OXE0WGlYQXNMT3R1WVRLQ1huelZWT04zTkhiRzc1?=
 =?utf-8?B?RldRNGU0RnBTSzkxZzg4NGh2RE1JRkNUcVM3OXNPdUdsSDM5K2NPZXBOZ04r?=
 =?utf-8?B?RVIzNzBrVnVnOVFXSlc0Wkd0Q00yWFpHSnpWemh6MDBIb1ppeStSYlpEaEdN?=
 =?utf-8?B?MXZLRTBEK3BXYXU3bFVlSEpJYjZGQWxUVm0rYjdOUkNBNzZjUU5reXlOd2JD?=
 =?utf-8?B?eXR2K0lJR01jNEpkdGQ2SHpjbUNpRUErV1g0MUhaZXNlRU14R0VOcFZXbmFh?=
 =?utf-8?B?VnYzUzZ4akZOcE1uZHFZc2ZScUhIQUFZRXJjY3FzTjFTZkNobm1BRUwvbnBB?=
 =?utf-8?B?VVEvbnh5MkxOSWZKbkdZVXI2dThkWExXZW5ZVUFla0ZoaHFnL1pvalNlNVEx?=
 =?utf-8?B?RWdlcGNVRVFXMXBUeG02T3lvWjV5ckc2YmtiRkVIa01XajlFVGJWZDNNeWFO?=
 =?utf-8?B?dkxEZEJtMFN4czZMbmtHYXNRcTBSN3Zwd1F0RlFKSnFQQkptNFBodjFiSjQw?=
 =?utf-8?B?citsay9iL2xPUERJTXpML2F6YXRlbnlVR25hcFUyYy9wWk1FQVZKMlZyQ3F0?=
 =?utf-8?B?anBacDJ1K3RQbk8wOENLdjdaR3laNHFvNTdra3NnZ2FQcEQveVZNRUNESktQ?=
 =?utf-8?B?R0J5VUg1a1FLVGRUZXpCS2MyWGtFc2VuMXk5djJTVTNuU0Q1VGVrUUxxaVVZ?=
 =?utf-8?B?ajIvZWl0bVdxMm90MHRqVGlEZXM1aWcvOHFYTzZYZmYwdGtMOVdYRXNzbnQz?=
 =?utf-8?B?b0I1bHFVWlNoRy9taDNYaTczK1pqWm1DSngzWEVBZEVSVXE5WlhKdlV4UnV3?=
 =?utf-8?B?bEhoZExVVUtqZVFYYmJvZjR2ZkpwckFWSkY1VHBFYk5NdS9JQ1JmaTN1U2Jx?=
 =?utf-8?B?SkdiMDdWY3BrbFlCOGdZYklGYTQ0V2xmS0xiTG1UUFBueHNrK2lzekg2WmZK?=
 =?utf-8?B?SngzQk51NkpPaUw1L3VmSEdLS3dHbnpIdkUrZVk0alE3b2dSMU9VK3ZkWkZq?=
 =?utf-8?B?WVBEa1RKc1lXOW9KK1E4QlR4UWUwZzQ1ZFRvRDF2SkxUZGF5dFMwdlNJY3Fn?=
 =?utf-8?B?dGwvbUljOTRITEpvSXZJZE1kbGNYSHR0UTFSaDJLT0QrbWtJNWFub1R4QWlr?=
 =?utf-8?Q?qSyN6bxfBtVj9fDYQa+KT1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cac091-cdec-46bf-f2de-08db6bc4f4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 04:16:26.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGpLz+XrGeeiB+GFveSL0RJQn6JvxDnczDipFO4jYnrlTeQ1BJWBZtyHGRhlJTp1xucKS6zzCu4ubHyblT0IzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
Subject: [virtio-comment] RE: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBN
b25kYXksIEp1bmUgMTIsIDIwMjMgMTA6NTcgUE0NCg0KWy4uXQ0KPiA+ICs0LiBUaGUgbWF0Y2gg
Y3JpdGVyaWEgbWF5IG9wdGlvbmFsbHkgYWxzbyBpbmNsdWRlIHNwZWNpZmljIHBhY2tldA0KPiA+
ICtkYXRhIG9mZnNldCwNCj4gDQo+IElzIHRoaXMgdGhlIG9mZnNldCBvZiB0aGUgcGFja2V0IHBh
eWxvYWQgKG5vdCBpbmNsdWRpbmcgdGhlIHBhY2tldCBoZWFkZXIpPyBJZiB5ZXMsDQo+IHdoYXQg
bWlnaHQgYmUgdGhlIHVzYWdlIHNjZW5hcmlvcz8NCj4gDQpTb21lIHBhY2tldCBoZWFkZXIgZmll
bGRzIG1heSBub3QgYmUgZGVmaW5lZCBpbml0aWFsbHkgYnkgdXMuDQpGb3IgZXhhbXBsZSBzb21l
IHByb3RvY29sIEZPTyB0eXBlIHdoaWNoIGhhcyBzb21lIGhlYWRlciBhZnRlciBVRFAgaGVhZGVy
Lg0KQW5kIHdhbnRzIHRvIGZpbHRlciBhbmQgc3RlZXIgdG8gYSBzcGVjaWZpYyBSUS4NCg0KQSB2
aXJ0aW8gbWF5IG5vdCBoYXZlIGRlZmluZWQgc3VjaCBwcm90b2NvbCBhdCB0aGUgYmVnaW5uaW5n
LiBTbyBhIGdlbmVyaWMgZXh0ZW5zaW9uIGFsbG93cyB0byBzdGVlciBwYWNrZXQuDQpBdCB0aGF0
IHBvaW50IGxpbmUgYmV0d2VlbiBoZWFkZXIgYW5kIGRhdGEgaXMgYmx1cnJ5LiA6KQ0KDQo+ID4g
KyAgIGxlbmd0aCwgYW5kIG1hdGNoaW5nIHBhdHRlcm4sIHdoaWNoIG1heSBub3QgYmUgZGVmaW5l
ZCBpbiB0aGUgc3RhbmRhcmQNCj4gUkZDLg0KPiA+ICs1LiBBY3Rpb24gaW5jbHVkZXMgKGEpIGRy
b3BwaW5nIG9yIChiKSBmb3J3YXJkaW5nIHRoZSBwYWNrZXQuDQo+ID4gKzYuIERlc3RpbmF0aW9u
IGxvY2F0aW9uIGlzIGEgcmVjZWl2ZSB2aXJ0cXVldWUgaW5kZXggb3IgcnNzIGNvbnRleHQuDQo+
ID4gKzcuIFRoZSBkZXZpY2Ugc2hvdWxkIHByb2Nlc3MgUkZTIHJ1bGVzIGJlZm9yZSBSU1MgcnVs
ZXMsIGkuZS4sIHdoZW4gdGhlcmUgaXMgYQ0KPiA+ICsgICBtaXNzIG9uIHRoZSBSRlMgcnVsZSBS
U1MgcnVsZSBhcHBsaWVzLg0KPiA+ICs4LiBUaGUgZGV2aWNlIHNob3VsZCBiZSBhYmxlIHRvIGFk
ZC9yZW1vdmUgdGhlc2UgcnVsZXMgYXQgYSByYXRlIG9mIDEwMEsNCj4gPiArICAgcnVsZXMvc2Vj
Lg0KPiANCj4gV2h5IGRvIHdlIG5lZWQgdG8gYWRkIHRoaXMgbGltaXQgZm9yIHRoZSBkZXZpY2Ug
cGxlYXNlPyBJIHRoaW5rIHRoYXQgZGlmZmVyZW50DQo+IGRldmljZXMgbWF5IGhhbmRsZSBjdHJx
IGF0IGRpZmZlcmVudCBzcGVlZHMuDQo+DQpBUkZTIHJ1bGVzIGluc2VydGlvbiBpcyBmYXN0IGFu
ZCB0Y3Agc3RyZWFtcyBzaG91bGQgYmUgYWJsZSB0byBjb252ZXJnZSBxdWlja2VyIG9uIHRoZSBk
ZXNpcmVkIGNwdS4NClNvIHJ1bGUgaW5zZXJ0aW9uIHNob3VsZCBiZSBmYXN0IGVub3VnaC4NCk1h
bnkgb2YgdGhlIGRldmljZSBjYW4vbWF5IGJlIGFibGUgdG8gZG8gdGhpcyBhcyBzb21lIHNlbWkt
ZmFzdCBwYXRoIG9wZXJhdGlvbiB1bmxpa2UgQ1ZRIHdoaWNoIGlzIHR5cGljYWxseSBhIGRldmlj
ZSBsZXZlbCBjb250cm9sIG9wZXJhdGlvbiwgb2Z0ZW4gZG9uZSBhcyBzbG93IHByb2Nlc3MuDQoN
ClNvIGRyaXZlci1kZXZpY2UgaW50ZXJmYWNlIHRvIGJlIGFibGUgdG8gc2NhbGUgdXAgdG8gbG93
IGxhdGVuY3kgYW5kIGhpZ2ggdGhyb3VnaHB1dCBmbG93IGluc2VydC9kZWxldGUgb3BzLg0KSXQg
aXMgb2sgb25lIGRldmljZSBtYXkgY2hvb3NlIHRvIG5vdCBzdXBwb3J0IHN1Y2ggaGlnaCByYXRl
LCBidXQgaW50ZXJmYWNlIGRlZmluaXRpb24gd2lzZSBJIGltYWdpbmUgdG8gYmUgb24gaXRzIG93
biBkZWRpY2F0ZWQgcXVldWUuDQogDQo+ID4gKzkuIElmIG11bHRpcGxlIHJ1bGVzIGFyZSBwcm9n
cmFtbWVkIHdoaWNoIGhhcyBvdmVybGFwcGluZyBhdHRyaWJ1dGVzIGZvciBhDQo+ID4gKyAgIHJl
Y2VpdmVkIHBhY2tldCwgdGhlIGRyaXZlciB0byBkZWZpbmUgdGhlIGxvY2F0aW9uL3ByaW9yaXR5
IG9mIHRoZSBydWxlLg0KPiA+ICsxMC4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBxdWVy
eSBmbG93IHN0ZWVyaW5nIHRhYmxlIGVudHJpZXMNCj4gcHJvZ3JhbW1lZCBpbg0KPiA+ICsgICAg
dGhlIGRldmljZSBieSB0aGUgZmxvdyBpZC4NCj4gDQo+IENvbWJpbmluZyBwb2ludHMgOSBhbmQg
MTAsIGNhbiBJIGRlZHVjZSB0aGF0IHRoZSBhdHRyaWJ1dGVzIG9mIGEgZmxvdyBydWxlDQo+IGlu
Y2x1ZGUgaWRlbnRpZmllciAoaWQpLCBwb3NpdGlvbiAoaW5kZXggb2YgdGhlIHJ1bGUgZW50cnkp
IGFuZCBwcmlvcml0eT8NCg0KWWVzLCBJIGFsc28gdGhpbmsgdGhhdCB3YXkuDQoNCj4gQWNjb3Jk
aW5nIHRvIHBvaW50IDExLCB0aGUgZHJpdmVyIG5lZWRzIHRvIHByb3ZpZGUgYSB1bmlxdWUgaWQs
IGlmIHRoZSBsb2NhdGlvbg0KPiBhbmQgcHJpb3JpdHkgYXJlIG5vdCBwcm92aWRlZCwgdGhleSBz
aG91bGQgaGF2ZSBwcmVkZWZpbmVkIGRlZmF1bHQgdmFsdWVzLg0KPg0KWWVzLg0KSSBhbSBub3Qg
ZnVsbHkgc3VyZSBvZiBpdCBhcyBpdCBicmluZ3Mgc29tZSB1bmNlcnRhaW50eSBpbiBiZWhhdmlv
ci4NClNvIGhhdmluZyBzZWNvbmQgdGhvdWdodCBhcyBkcml2ZXIgdG8gYWx3YXlzIHByb3ZpZGUg
aXQuDQogDQo+ID4gKzExLiBUaGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGFkZCB0aGUgZW50
cnkgZm9yIGF0dHJpYnV0ZXMgKGEpIG1hdGNoDQo+ID4gKyAgICBjcml0ZXJpYSwgKGIpIGFjdGlv
biwgKGMpIGRlc3RpbmF0aW9uIGFuZCAoZCkgYXNzaWduIGEgdW5pcXVlIGlkIG9mIDMyIGJpdHMu
DQo+ID4gKzEyLiBUaGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGRlbGV0ZSB0aGUgc3RlZXJp
bmcgcnVsZSBlbnRyeSB2aWEgYSB1bmlxdWUNCj4gaWQuDQo+ID4gKzEzLiBUaGUgZHJpdmVyIHNo
b3VsZCBiZSBhYmxlIHRvIGFkZCBhbmQgZGVsZXRlIHRoZSBzdGVlcmluZyBydWxlcyBpbiBvdXQg
b2YNCj4gPiArICAgIG9yZGVyIG1hbm5lciB3aXRob3V0IGRlcGVuZGluZyBvbiBwcmV2aW91cyBj
b21tYW5kcy4NCj4gPiArMTQuIEEgZ3JvdXAgbWVtYmVyIGRldmljZSBzaG91bGQgYmUgYWJsZSB0
byBxdWVyeSB0aGUgYXR0cmlidXRlcyBvZiB0aGUNCj4gZmxvdw0KPiA+ICsgICAgc3RlZXJpbmcg
dGhhdCBkZXZpY2Ugc3VwcG9ydHMuDQo+IA0KPiBEb2VzIGEgZ3JvdXAgbWVtYmVyIGRyaXZlciBz
dXBwb3J0IGluc2VydGlvbiBydWxlcz/CoCBUaGUgZ3JvdXAgb3duZXIgZHJpdmVyDQo+IGFuZCBh
IGdyb3VwIG1lbWJlciBkcml2ZXIgc2hvdWxkIGhhdmUgdGhlIGFiaWxpdHkgdG8gYWRkL3JlbW92
ZSBydWxlcyBmb3INCj4gdGhlbXNlbHZlcy4NCj4gDQpZZXMsIEdyb3VwIG93bmVyIGFkZHMgcnVs
ZSBmb3IgdGhlIHNlbGYsIG5vdCBvbiBiZWhhbGYuDQpTYW1lIGFzIGdyb3VwIG1lbWJlci4NCk5v
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVtIGFzIHRoZXkgb3BlcmF0ZSBvbiBzZWxmIGRldmljZS4N
Cg0KSW4gZnV0dXJlLCBhIGdyb3VwIG93bmVyIG1heSB3YW50IHRvIHN0ZWVyIHRoZSBwYWNrZXQg
dG93YXJkcyBhIGdyb3VwIG1lbWJlciwgbGlrZSBlc3dpdGNoLg0KDQo+ID4gKzE1LiBUaGUgZHJp
dmVyIGFuZCBncm91cCBvd25lciBkcml2ZXIgc2hvdWxkIGJlIGFibGUgdG8gcXVlcnkgc3VwcG9y
dGVkDQo+IGRldmljZQ0KPiA+ICsgICAgbGltaXRzIGZvciB0aGUgc3RlZXJpbmcgZW50cmllcy4N
Cj4gPiArDQo+IA0KPiBEb2VzIHRoaXMgaW5jbHVkZSB0aGUgbnVtYmVyIG9mIHJ1bGVzIHN1cHBv
cnRlZCBieSB0aGUgZGV2aWNlPyBBcmUgdGhlcmUgb3RoZXINCj4gbGltaXRzPw0KDQpMZXRzIGxp
c3QgZG93biBpZiB5b3UgaGF2ZSBzb21lIGluIG1pbmQuDQo=

