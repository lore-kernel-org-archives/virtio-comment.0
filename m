Return-Path: <virtio-comment-return-6913-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773F7C001DC
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:26:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D60A942A6E
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:26:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8A4F986856
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:26:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEE689840BC; Sat, 29 Jul 2023 23:26:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF55398680A
	for <virtio-comment@lists.oasis-open.org>; Sat, 29 Jul 2023 23:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNQqFPFCz+8FxNF/RouZsZKpZse3hUbdK/Fi3gZr2XlVCEjyXqMU2uOJijKrpHcJDFzGNoPFiAm8XPOKqX1qwyCk4Ms9KEx6ewYCT61aE43mUvQ5YTuQSMkaihTfLcFpl8nPlmYHMWy3zxi5O9wLIPHjz/QACj4dASeJctZ3zk1IgUmgUWUvjiszC0nqPJXZys41fORQtL1VZKj983fd/cDFSigyg7Cvpbox4XleD3lZauL1CI07u8CchwBD0H3FkkGssfWUACjie8/TUqWFRwplabu6g68zswEckHTGOV6N7wXPnA4NGldcJyvaHFsGZWMm9sk5wQliMjTQLO4oqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qTlMtizVvdiATn50CYTnHK2tkgn/t1aqNGKFDVixPM=;
 b=hIL3QaKFJddmO0IQ79HsXlskJQAgN911fVupV4h/Sox4auDGBwDDkM8zw61/8f4EToD6h5MBn3Ijm2tyKoMm1e8hb7abGDhKu1jG4513Coj+y5T1POLVzPeLFna0DcD84pJiJZcsxY+1LqFNGk1eoz+4tXxnUU0KeLZdV+QAJ7dSGKDuoQAzYt9Nu/krmjGe5JFbOD0vOzrv44/cdujlwD5CtuhIh7wPaMnhTVjWwCPCqAaWu3s61RIuoFa/E+7+3frPTRMNm9zDpmLTRbQuFR0EF/PxDrPXbfUTooyT7HIpCGulbyxBF7+GibTNNpASEWlzjjO2g0psgFkaPt5OHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "helei.sig11@bytedance.com"
	<helei.sig11@bytedance.com>,
        "zhouhuaping.san@bytedance.com"
	<zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu"
	<xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 3/7] transport-fabrics: introduce
 Virtio-oF Protocol Data Unit
Thread-Index: AQHZwnQDbfrhTYzjDkOGeiPX90zBvw==
Date: Sat, 29 Jul 2023 23:25:51 +0000
Message-ID: <3F9E10F5-F231-4C0B-ADEA-55A7AEAD48BA@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-4-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-4-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB7421:EE_
x-ms-office365-filtering-correlation-id: cce06c95-4d9a-4bf2-cab0-08db908b2603
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KlGJBHEqoqlqLIiMFugRskHyZSOyx9vCQNyuantpFn55zr+fX7mjN3L0ItaVctboLqrPG+quSdMS00HTMCYNLh7B2EhjoUaApUo2PI6IVoIaGOeRUDUXEumvMs+u+KQm3NjSbj8j2YH58G5qDgi3w58QxySFPD0j1L2VABdwKa7wztehkNDIuy0UQuh2VBOCmqKtA0s4W0aQsojWc2PCW+996rZQ5i4QsrsQSrcLf63p0SYUCylKJZkanyRtMqkPPLu9y6qhAmB062TkgrZf60K2IBVMdg2wuuJDKAiVgPx4zSrdKQAvPbdmXAIFELnCIONt+NLmOU5ODg0h2VG3cq1UE5EH/eie4gYd8LP9cNqFWDrR5C+7xg3Q0Z6SaijBKdVZf68n/T50Qti+1Q/RAy/Jj20Fi6mobH7I6Wm2PTyUiL2MeXYg+5A2H7WAuYT2usb1lHJ05yy8UUPAOJeSzMw7h+5bNxoBQp4PQO8rkimJwhOF4HFgz0kgbiZYWjdgUsfvNee4ZmOLr+zD7BlZCDfrW3Uj2ZpQhnlD8Q4zJmgdncmXCn2tAUK6OuLNUQU8gzVTq72cOQtnR3fwOoqPp01np5j/Y9/XqEV7vYeUyxMSxt2l5eZooRxs8w3qK5Cxr0CWk72QfEv4s6NQ7mjKwA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199021)(38070700005)(2616005)(83380400001)(6486002)(71200400001)(38100700002)(2906002)(36756003)(7416002)(44832011)(186003)(5660300002)(86362001)(66899021)(33656002)(316002)(64756008)(41300700001)(26005)(6506007)(8676002)(8936002)(53546011)(4326008)(6916009)(66476007)(66446008)(76116006)(6512007)(66946007)(966005)(478600001)(66556008)(54906003)(122000001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZW5HeVlQK2g5QU9zOTlVQ0NhUm5mTkI2YlprMlRYMG50aDlCUjBaT2gwZlVL?=
 =?utf-8?B?YkdyMTFBZm96Y25Qb1V3Uk9jQTZ4MkxvQTI5TVZBUGZVdnpJL0pFVGd6enhU?=
 =?utf-8?B?UmtZVWdWQUFjQ1dvb3NjZzZ1aEg1eTlzWnRLNmhBZlRHN2hMWnRqeHRTTks3?=
 =?utf-8?B?UEtKKzlNQm5qMS9oTGZqNzU1VFMzMzZoNnJ2anJIbDNjT3F3L3dEV2lzZlBT?=
 =?utf-8?B?eFhqZmxPSU9wd3owQWVpbVBTNmZ3eFBpSnVjRnREWFhqdzU1emVDTnp5YnJR?=
 =?utf-8?B?ZmtUSEdCOXljRmpkUjB1N1FiMjZOb2FWaUlXUzhxMklUWk03aktRRDZwajZC?=
 =?utf-8?B?VGYrKzBEM0I5K1c4bmhqQzJtM3Z6bEhyRzlXcVBQTkJGR3NEV29aNFh0Zkk1?=
 =?utf-8?B?NXVpblQrQ3BVSEZIUW5UY3VDRXgwcWdNdUNNcS9HU29vNlNIdDNmYllMSWFG?=
 =?utf-8?B?eDRjeUVwZVBBU21oNVhOeDRmMnlsSm8ycG5FemlMRGEraDA5YnlGTDhWcWF5?=
 =?utf-8?B?SlFoMUV0UWx2WHBnejZnM1ZBajZjSi9xeEVwNSsyUWZ2Mndici9JQUZPbFVN?=
 =?utf-8?B?QXYrSE1IWkhVeUc1Y0V1a0NSU00wOXZ5cnJwV28vWCtDVjEwaDZrTWgrczA5?=
 =?utf-8?B?VDZhaFd2T2UzNlQ2YXVyT3lXbTdCVU5mM3U5QXJsZUhwMkdobThzM2tWRXha?=
 =?utf-8?B?dTZLVjUxWnZXMEtwd3YrcG80eHNXUVRtaFNhS0V2NXcvT0lNdHB3ak9Fa3FU?=
 =?utf-8?B?Rm5FdnpGNUZ5N2JRN2k3TTBSM2plZFMySXkyNE9aQTRnc0V3ZFVkbFltcUtP?=
 =?utf-8?B?VTkzaEhKNkVmWVMrZ0grY0ZpbEduOGJxcFZBQ1NQYXdrOW1pUWZRSTBQakha?=
 =?utf-8?B?dGJ0VXUxYnQyWHBiQVE5bFVVV1c3OXJRNzZzdUo5QjBqbzgza3phV3B6WTFh?=
 =?utf-8?B?dS9adUF4WUIwWnZ3aDU2K0dETXNUNjZqcUJMc21iZDdtTkVvcWFjd3A5dEVO?=
 =?utf-8?B?eno3NSt4ZjJTN0RCME8vNEdDVnlTWDJ5Y1EzTW5RN2U2b2tDMEZyTVpneW5O?=
 =?utf-8?B?djJUYmFKVWE1ZXNrQi9mUEUvZTBYMHk5UFA4S1hpbkhobVFkSXBTb0o2L0tE?=
 =?utf-8?B?NnpvZEtjY2trbytJWWl3RnNJRS84Z2wyL1NhMXV6bW0yUTVCb3dVTUlzOWJh?=
 =?utf-8?B?cjkxaDNJN1NPSFozNG5qMStlSlEyc2dQVlJyK2tXRmNYaVNHMlhaVkVqQVMv?=
 =?utf-8?B?YzE3WWZhT2hXMUNnMGtuY1RqbTY1bWw1bi9oaStXSWVKc1Fnbkp2UjROWGRO?=
 =?utf-8?B?Sko4RzFlQWhQYmluMmUwSk5IdmovcklkcmFMWktCNGpyR09iTHpDeTlCZTls?=
 =?utf-8?B?WEhrL2k1VnNxMUxaWGdBdVlVUm1DSXpjek11VlVUc3lac3B4RWdoNTNGVG5N?=
 =?utf-8?B?Yzc2V2pkMElBUWJ0VGpOZ0l6QkFDd0M1TzU0Q0NoM1FWWnFPUVdCRGk0M3VE?=
 =?utf-8?B?WWc4V2NpcmN5Z05vcFozZmhvYTFkS0ZjRUJPRTVnUFNUdHVjeEVQQk9CNHZY?=
 =?utf-8?B?QXRwM1g3a2FDb2JFcFFyUnE2MTdpdW85ZGFkcDlQdXJvSUErK2g4TWhlY2xZ?=
 =?utf-8?B?eGNsNDVlbVQvcERVZ2dNay80d1ZROFA1bnR3aEl6MW5VbUxIY2lMYzlUMFhh?=
 =?utf-8?B?ZUtVbnZUTXVIVTREZytkc1FTTWZJbEU4ak1QbGFkeStBSVJSUGJsTjZzNzZa?=
 =?utf-8?B?cmFpUjZaelhLYzltVlFtOGUva0dCLzhYOE1sTng1a2t0YUFjSys2Z3p6ajg3?=
 =?utf-8?B?UVVYU05laU9XeG9DRUYvd0IwSkZ5MCtqeWNMeEswTTY0UFpyUnVXSTg4bTUy?=
 =?utf-8?B?T09uYVZIdUowUVdtU2pXV1RRV04vZTlHK29XQ0RERHJqWjh4Tld6dURlNTZ6?=
 =?utf-8?B?ZUpDVnV1QmVIOXc4bGFFWXJkRnpMTzJmTVBCWGVKcTJhMTArMkFIaU9LNnZX?=
 =?utf-8?B?UnpxQVhQeEhNYnRKalpJcFppZlE2VUR5NC9RVW9HOWNaYjlqdy9Lc1dSbHJl?=
 =?utf-8?B?bkh5OGo2dG1oTHRmbEY0dXlrSFA0QjB0aXpvdkVuTkhCcGdXK21wcUpiMWtr?=
 =?utf-8?B?S0pPRlA4V0o2clpyblcxVUt3QUpBNnhzK1BmeFd0Z1FxV004aWVTaUhBWjFv?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F877C3D8D6E8D4FB46396FB349BBE3C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce06c95-4d9a-4bf2-cab0-08db908b2603
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 23:25:51.5374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGcS6ZT8c3iC8N+EBU3a1rz3BSiBdB5Zv2Fp59Lmo/pW8YChjdX4YmeEtXjN5GgzKYgn7ZzH2K5SO4LJiaaIxlojY8nc/4uFzSbSCvpT7BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7421
X-Proofpoint-GUID: 1FVztHdHqIP30CBylHtttUOi93xXnGyq
X-Proofpoint-ORIG-GUID: 1FVztHdHqIP30CBylHtttUOi93xXnGyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 3/7] transport-fabrics: introduce
 Virtio-oF Protocol Data Unit

SeKAmWQgc3VnZ2VzdCBtYWtpbmcgc29tZSB0d2Vha3MgdG8gc2F2ZSBtZW1vcnkgb24gdGhlIHRh
cmdldCBzaWRlIGZvciBSRE1BLg0KDQo+IE9uIEp1biAyNiwgMjAyMywgYXQgMzoyNSBBTSwgemhl
bndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOg0KPiANCj4gSW50cm9kdWNl
IFZpcnRpby1vRiBQRFUgZm9yIFZpcnRpby1vRiBxdWV1ZSwgYWRkIFN0cmVhbSBEYXRhIFRyYW5z
ZmVycw0KPiBhbmQgS2V5ZWQgRGF0YSBUcmFuc2ZlcnMgbWVjaGFuaXNtLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IC0tLQ0KPiB0
cmFuc3BvcnQtZmFicmljcy50ZXggfCA2OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdHJhbnNwb3J0LWZhYnJpY3MudGV4IGIvdHJhbnNwb3J0LWZhYnJpY3MudGV4
DQo+IGluZGV4IDU0ZDc1NTguLmQ1NjJiMmMgMTAwNjQ0DQo+IC0tLSBhL3RyYW5zcG9ydC1mYWJy
aWNzLnRleA0KPiArKysgYi90cmFuc3BvcnQtZmFicmljcy50ZXgNCj4gQEAgLTQ1LDMgKzQ1LDcx
IEBAIFxzdWJzZWN0aW9ue1ZpcnRpby1vRiBRdWFsaWZpZWQgTmFtZX1cbGFiZWx7c2VjOlZpcnRp
byBUcmFuc3BvcnQgT3B0aW9ucyAvIFZpcnRpDQo+IFxpdGVtIFRoZSBtYXhpbXVtIG5hbWUgaXMg
MjU2IGJ5dGVzIGluIGxlbmd0aCwgaW5jbHVkaW5nIHRoZSBOVUwgY2hhcmFjdGVyLg0KPiBcaXRl
bSBUaGVyZSBpcyBubyBzdHJpY3Qgc3R5bGUgbGltaXRhdGlvbi4NCj4gXGVuZHtpdGVtaXplfQ0K
PiArDQo+ICsNCj4gK1xzdWJzZWN0aW9ue1Byb3RvY29sIERhdGEgVW5pdH1cbGFiZWx7c2VjOlZp
cnRpbyBUcmFuc3BvcnQgT3B0aW9ucyAvIFZpcnRpbyBPdmVyIEZhYnJpY3MgLyBQcm90b2NvbCBE
YXRhIFVuaXR9DQo+ICtUaGlzIHNlY3Rpb24gZGVmaW5lcyBWaXJ0aW8tb0YgUHJvdG9jb2wgRGF0
YSBVbml0IChQRFUpIGZvciBib3RoIHRoZSBWaXJ0aW8tb0YgY29udHJvbCBxdWV1ZSBhbmQgVmly
dGlvLW9GIHZpcnRxdWV1ZS4NCj4gKw0KPiArVmlydGlvLW9GIFBEVSBpcyBhIHVuaXQgb2YgaW5m
b3JtYXRpb24gZXhjaGFuZ2VkIGJldHdlZW4gYSBWaXJ0aW8tb0YgaW5pdGlhdG9yIGFuZCBhIFZp
cnRpby1vRiB0YXJnZXQ6DQo+ICtcYmVnaW57aXRlbWl6ZX0NCj4gK1xpdGVtIEEgcmVxdWVzdCBW
aXJ0aW8tb0YgUERVIGZyb20gVmlydGlvLW9GIGluaXRpYXRvciB0byBWaXJ0aW8tb0YgdGFyZ2V0
IGNvbnRhaW5zIGNvbW1hbmQgYW5kIGFzc29jaWF0ZWQgZGF0YSwgaWYgcHJlc2VudC4NCj4gK1xp
dGVtIEEgcmVzcG9uc2UgVmlydGlvLW9GIFBEVSBmcm9tIFZpcnRpby1vRiB0YXJnZXQgdG8gVmly
dGlvLW9GIGluaXRpYXRvciBjb250YWlucyBjb21wbGV0aW9uIGFuZCBhc3NvY2lhdGVkIGRhdGEs
IGlmIHByZXNlbnQuDQo+ICtcZW5ke2l0ZW1pemV9DQo+ICsNCj4gK1xzdWJzdWJzZWN0aW9ue1N0
cmVhbSBEYXRhIFRyYW5zZmVyc31cbGFiZWx7c2VjOlZpcnRpbyBUcmFuc3BvcnQgT3B0aW9ucyAv
IFZpcnRpbyBPdmVyIEZhYnJpY3MgLyBQcm90b2NvbCBEYXRhIFVuaXQvIFN0cmVhbSBEYXRhIFRy
YW5zZmVyc30NCj4gK1N0cmVhbS1iYXNlZCAoaS5lLiBUQ1AvSVApIFZpcnRpby1vRiBxdWV1ZSB0
cmFuc2ZlcnMgVmlydGlvLW9GIFBEVXMgaW4gYSBzdHJlYW1pbmcgZmFzaGlvbi4NCj4gKw0KPiAr
VGhlIGxheW91dCBpbiBhIHN0cmVhbToNCj4gK1xiZWdpbntsc3RsaXN0aW5nfQ0KPiArUERVeCBh
bmQgUERVeiBjb250YWluIGEgY29tbWFuZCBvbmx5LCBQRFV5IGNvbnRhaW5zIGEgY29tbWFuZCBh
bmQgZGF0YToNCj4gKw0KPiArICAgICArLS0tLSsgICAgICstLS0tLS0tLS0rICAgICArLS0tLSsN
Cj4gKyAgICAgfFBEVXh8ICAgICB8ICAgUERVeSAgfCAgICAgfFBEVXp8DQo+ICsgLi4uICstLS0t
KyAuLi4gKy0tLS0rLS0tLSsgLi4uICstLS0tKyAuLi4NCj4gKyAgICAgfENNRCB8ICAgICB8Q01E
IHxEYXRhfCAgICAgfENNRCB8DQo+ICsgICAgICstLS0tKyAgICAgKy0tLS0tLS0tLSsgICAgICst
LS0tKw0KPiArDQo+ICtQRFVsIGNvbnRhaW5zIGNvbXBsZXRpb24gb25seSwgUERVbSBhbmQgUERV
biBjb250YWluIGNvbXBsZXRpb24gYW5kIGRhdGE6DQo+ICsNCj4gKyAgICAgKy0tLS0rICAgICAr
LS0tLS0tLS0tKyAgICAgKy0tLS0tLS0tLSsNCj4gKyAgICAgfFBEVWx8ICAgICB8ICAgUERVbSAg
fCAgICAgfCAgIFBEVW4gIHwNCj4gKyAuLi4gKy0tLS0rIC4uLiArLS0tLSstLS0tKyAuLi4gKy0t
LS0rLS0tLSsgLi4uDQo+ICsgICAgIHxDT01QfCAgICAgfENPTVB8RGF0YXwgICAgIHxDT01QfERh
dGF8DQo+ICsgICAgICstLS0tKyAgICAgKy0tLS0tLS0tLSsgICAgICstLS0tLS0tLS0rDQo+ICtc
ZW5ke2xzdGxpc3Rpbmd9DQo+ICsNCj4gK1xzdWJzdWJzZWN0aW9ue0tleWVkIERhdGEgVHJhbnNm
ZXJzfVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydCBPcHRpb25zIC8gVmlydGlvIE92ZXIgRmFi
cmljcyAvIFByb3RvY29sIERhdGEgVW5pdC8gS2V5ZWQgRGF0YSBUcmFuc2ZlcnN9DQo+ICtNZXNz
YWdlLWJhc2VkIChpLmUuIFJETUEpIFZpcnRpby1vRiBxdWV1ZSB0cmFuc2ZlcnMgVmlydGlvLW9G
IFBEVXMgaW4gYSBtZXNzYWdlIGZhc2hpb24sIGFuZCB1c2VzIHRoZSBmb2xsb3dpbmcgc3RydWN0
dXJlIHRvIGRlc2NyaWJlIHRoZSByZW1vdGUgZGF0YToNCj4gKw0KPiArXGJlZ2lue2xzdGxpc3Rp
bmd9DQo+ICtzdHJ1Y3QgdmlydGlvX29mX2tleWVkX2Rlc2Mgew0KPiArICAgICAgICAvKiB0aGUg
cmVtb3RlIGFkZHJlc3Mgb2YgZGF0YSAqLw0KPiArICAgICAgICBsZTY0IGFkZHI7DQo+ICsgICAg
ICAgIC8qIHRoZSBsZW5ndGggb2YgZGF0YSAqLw0KPiArICAgICAgICBsZTMyIGxlbmd0aDsNCj4g
KyAgICAgICAgLyogdGhlIGtleSB0byBhY2Nlc3MgdGhlIHJlbW90ZSBkYXRhICovDQo+ICsgICAg
ICAgIGxlMzIga2V5Ow0KPiArfTsNCj4gK1xlbmR7bHN0bGlzdGluZ30NCj4gKw0KPiArQSBWaXJ0
aW8tb0YgY29udHJvbCBxdWV1ZSBzdXBwb3J0cyAxIGtleWVkIGRlc2NyaXB0b3IsIGFuZCBhIFZp
cnRpby1vRiB2aXJ0cXVldWUgc3VwcG9ydHMgMSBvciBtb3JlIGtleWVkIGRlc2NyaXB0b3JzLg0K
PiArDQo+ICtUaGUgUERVcyBvZiBtZXNzYWdlczoNCj4gK1xiZWdpbntsc3RsaXN0aW5nfQ0KPiAr
UERVeCBjb250YWlucyBhIGNvbW1hbmQgb25seSwgUERVeSBjb250YWlucyBhIGNvbW1hbmQgYW5k
IDEgZGVzY3JpcHRvciwNCj4gK2FuZCBQRFV6IGNvbnRhaW5zIGEgY29tbWFuZCBhbmQgayAtIGog
KyAxIGRlc2NyaXB0b3JzLg0KPiArDQo+ICsgICAgICstLS0tKyAgICAgKy0tLS0tLS0tLSsgICAg
ICstLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gKyAgICAgfFBEVXh8ICAgICB8ICAgUERVeSAgfCAg
ICAgfCAgICAgICAgUERVeiAgICAgICAgfA0KPiArIC4uLiArLS0tLSsgLi4uICstLS0tKy0tLS0r
IC4uLiArLS0tLSstLS0tLSstLS0rLS0tLS0rIC4uLg0KPiArICAgICB8Q01EIHwgICAgIHxDTUQg
fERFU0N8ICAgICB8Q01EIHxERVNDanwuLi58REVTQ2t8DQo+ICsgICAgICstLS0tKyAgICAgKy0t
LS0tLS0tLSsgICAgICstLS0tLS0tLS0tKy0tLSstLS0tLSsNCg0KT24gdGhlIHRhcmdldCBzaWRl
IHlvdSBoYXZlIHRvIHByZXBvc3QgKE1BWF9TR19MRU4gKiBzaXplb2YodmlydGlvX29mX2tleWVk
X2Rlc2MpICsgc2l6ZW9mKHZpcnRpb19jb21tYW5kX3ZxKSkgKiBtYXggb3V0c3RhbmRpbmcgZm9y
IGVhY2ggY29ubmVjdGlvbi4NCg0KQXNzdW1pbmcgYSAxMjggbWF4IG91dHN0YW5kaW5nIGFuZCBN
QVhfU0dfTEVOPTEwMjQgKFFFTVXigJlzIElPVl9JTlRFUk5BTCkgdGhhdCBwdXRzIHlvdSBhdCAo
MTAyNCAqIDggKyAxMykgKiAxMjggfj0gMU1CIHBlciBjb25uZWN0aW9uLiBJZiBhIHRhcmdldCBp
cyBzZXJ2aWNpbmcgdGhvdXNhbmRzIG9mIGNvbm5lY3Rpb25zIHRoYXQgYWRkcyB1cC4NCg0KSeKA
mWQgc3VnZ2VzdCBhZGRpbmcgYSBwcm90b2NvbCBtZXNzYWdlIHRvIGNhcCB0aGUgTUFYX1NHX0xF
TiBhbmQgY29tbXVuaWNhdGUgdGhlIHZhbHVlIHRvIHRoZSB0YXJnZXQuDQoNCldvdWxkIGFsc28g
YmUgZ3JlYXQgdG8gc2F2ZSBzcGFjZSBpbiB2aXJ0aW9fb2Zfa2V5ZWRfZGVzYywgYnV0IEkgZG9u
4oCZdCB0aGluayB0aGVyZSBpcyBhIHdheS4NCg0KPiArDQo+ICtQRFVsLCBQRFVtLCBhbmQgUERV
biBjb250YWluIGNvbXBsZXRpb24gb25seS4NCj4gKw0KPiArICAgICArLS0tLSsgICAgICstLS0t
KyAgICAgKy0tLS0rDQo+ICsgICAgIHxQRFVsfCAgICAgfFBEVW18ICAgICB8UERVbnwNCj4gKyAu
Li4gKy0tLS0rIC4uLiArLS0tLSsgLi4uICstLS0tKyAuLi4NCj4gKyAgICAgfENPTVB8ICAgICB8
Q09NUHwgICAgIHxDT01QfA0KPiArICAgICArLS0tLSsgICAgICstLS0tKyAgICAgKy0tLS0rDQo+
ICtcZW5ke2xzdGxpc3Rpbmd9DQo+IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0KPiBUaGlzIHB1Ymxp
Y2x5IGFyY2hpdmVkIGxpc3Qgb2ZmZXJzIGEgbWVhbnMgdG8gcHJvdmlkZSBpbnB1dCB0byB0aGUN
Cj4gT0FTSVMgVmlydHVhbCBJL08gRGV2aWNlIChWSVJUSU8pIFRDLg0KPiANCj4gSW4gb3JkZXIg
dG8gdmVyaWZ5IHVzZXIgY29uc2VudCB0byB0aGUgRmVlZGJhY2sgTGljZW5zZSB0ZXJtcyBhbmQN
Cj4gdG8gbWluaW1pemUgc3BhbSBpbiB0aGUgbGlzdCBhcmNoaXZlLCBzdWJzY3JpcHRpb24gaXMg
cmVxdWlyZWQNCj4gYmVmb3JlIHBvc3RpbmcuDQo+IA0KPiBTdWJzY3JpYmU6IHZpcnRpby1jb21t
ZW50LXN1YnNjcmliZUBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiBVbnN1YnNjcmliZTogdmlydGlv
LWNvbW1lbnQtdW5zdWJzY3JpYmVAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gTGlzdCBoZWxwOiB2
aXJ0aW8tY29tbWVudC1oZWxwQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+IExpc3QgYXJjaGl2ZTog
aHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8NCj4g
RmVlZGJhY2sgTGljZW5zZTogaHR0cHM6Ly93d3cub2FzaXMtb3Blbi5vcmcvd2hvL2lwci9mZWVk
YmFja19saWNlbnNlLnBkZg0KPiBMaXN0IEd1aWRlbGluZXM6IGh0dHBzOi8vd3d3Lm9hc2lzLW9w
ZW4ub3JnL3BvbGljaWVzLWd1aWRlbGluZXMvbWFpbGluZy1saXN0cw0KPiBDb21taXR0ZWU6IGh0
dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL2NvbW1pdHRlZXMvdmlydGlvLw0KPiBKb2luIE9BU0lT
OiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9qb2luLw0KPiANCj4gDQoNCg==

