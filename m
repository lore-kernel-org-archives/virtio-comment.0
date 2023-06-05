Return-Path: <virtio-comment-return-6131-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15670C77B73
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 11:45:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F133370EB
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 11:45:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ECBF986449
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 11:45:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0573398638A; Mon,  5 Jun 2023 11:45:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4EC79863AC
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 11:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyI1Z+uISSCHIL92opmz7tKYhkKmxTvXgf+QHVnX8spqesUrQOejuqjJl5ikf7PWlUS4XV5OJiUKvbsbzJ7zjmxgm10J2jrH0ZpjxcBQTIhXKh9ytIYZTPkRwGBfA92V97dI3VS5PAccmEJSVU2J9TY7JBvxvsW9gy4xsCyN9Acvl5/IWi8dV9TgheX3XyyIesNZTnAvmKiu05gp8/u46auGd1Yl856chcQOWFz1jVPuwrIPIUtp30JkMdVuTNKpsldRp2PBVABWdTa1KPv2DY9ltNimQkOq3DB/DPozBX2CJ+AOWp+xyzFxleo9rxk/x2XOf1EEDu1oV6GC3rWzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/Im97qxIzYD1gXSC+ayEOdA0yF2EJJbYPY1jKRvrzs=;
 b=bqZ6fcafwj0IYfhSIJZayP9iZTSS/2NoD1jp2/JOOdlWl4sDxj3ieVnplXmU94cM3MQsiuH6N+DJ1Uod+K+pjQd69kWizqiiruLuJS5cxiPcER11qH1tLyhpoa/+mkeCz5dWwhBsA9+JNRIUlLAeWr0tK4+c16eDvsL4ZSAuHC4Zgz0uIHG4cCvVO8i07Fm886RztfBv4I/g5FYrMmBOKWQmMsjZZi7Ef5Q8kvw2SFUYQ51Ngrk75HsO74S5H3xFY0HARJdbnmqohqsBrGsfChvI3EqZoQtn9aKRYGyv+btnQPI/RShR1FeXkjLzYrciMmDxdH106aYSPmzI4tRDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "mst@redhat.com" <mst@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission
Thread-Index: AQHZfmF1GW/9A6xOmEWve+UarUKjXK97sZuAgABkmYCAADKgAA==
Date: Mon, 5 Jun 2023 11:45:07 +0000
Message-ID:
 <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
 <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
In-Reply-To: <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4189:EE_
x-ms-office365-filtering-correlation-id: 9b64b1bf-0075-4574-3219-08db65ba4f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ULYsl8LhtjO5thQkhthjv0BoP6R25GdghrieXIgHjI/y5UQvNrn6pRvsqjfR4BADlmZM1wZFH7gklC6SEC1Z23XolZyiSo75bmFZnxX0F1LtzejOVATEVf8YeCNaM+g3NKgOag1IfSAawO5U/RLN5psYC/6BUhz/nOaKc4gNwZoIdDEBGTA/JVtnlUBDM/bhBHz+0KcfYJgtn2NNj0liB+mF0ddgjty9VK92DuO9G0cZstxovnUPGr8tq6C1KSEGJgWi5EBvDgXXZTnV/R7jFR2jZv9ILONKP0R3e1BA6xBXo1PRwG74Wml5qcZ6EW0tqOetXT+mudYWtn64o4O/KVklKvEtEulFjwQSpcjhOcDmqA1t+haNOSLkuF6I4obDi7Yk5AC6dv89JNZRRmxY6lcKOPtwxhHywKKAtIz3Wo4MKA9/1wc8xLfxpJVxW2KkCb+wLQbs/hwt05qqQ7q2hKut+g7xFDOdHy7ObyTx9WsX/ahBsiaXckIKOAQZWXLDFxQ2Fr6gLj3XbUHTIdbvdIUR4dMROzHppEtLUXxRpcYl5nfhFslGlihCKtKYI4OAjtY1fTkmT56VkvKP58WMCNQ0MpoSF7ZzAVWO6mOHdJdRikHRJPCw9+35OetLxrzc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(6506007)(9686003)(186003)(53546011)(83380400001)(7696005)(71200400001)(2906002)(8676002)(8936002)(54906003)(110136005)(55016003)(478600001)(33656002)(5660300002)(38100700002)(122000001)(86362001)(4326008)(316002)(38070700005)(41300700001)(66446008)(52536014)(66556008)(76116006)(64756008)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlpScWJOSzh0cHJjQ004c0VKMlVPdk5vQ3lmVzYrWWZlSWhGRWxOQnl1VkRB?=
 =?utf-8?B?aTBUZjBOVzc3N3ZJdXZ4dzNqNHNnU1lwQmJTM2hUTk5RL3ZXVEw3enhSdW5q?=
 =?utf-8?B?NCtrZ3F6NGVRVlNBOC8rdTZYdGYwblNwa2JoekJBY1RUS2R5bWlnZWpvLzFK?=
 =?utf-8?B?Qy8zTXozZ25kbVBmK0t6RkFtUkxmVzhmcWVVUklxcGtqV2l0UlZ4M1NuclVF?=
 =?utf-8?B?aDRSMEJQMzJicWdsR3dBMDkyN1VycGh2MmFjc2ZuZ3ZKanR2V3V0dVRCV1Vw?=
 =?utf-8?B?NzVFTTJCb0tlUUs1Q2s1TjY2SkppaFlGblhHYjlIZ0V1aXpnNisxWG5PWlo3?=
 =?utf-8?B?Q1dyRGYxVDJ3bmxpRkY4TjdjZGdOMG16M1VYVjJKZTBmeWl5K1p6aFkybk1y?=
 =?utf-8?B?Rks0cGhRV25HOXRqMlRUdm1HZy85RDkwU05ubWdFM1BqWXBXbHdXTzhvKzNx?=
 =?utf-8?B?cDQ3QlhZSHYrUFo5S0d3QmJHSzIzRlZzUmhIbTZFb1V1aHZiQTJtSG5NVytM?=
 =?utf-8?B?WmtuNVVtdXVWY1JkMzl6RzR0VUZaREJCcmhPS01ZcVNMdzRIWHFQMUdaOWYv?=
 =?utf-8?B?Wi93eks4T0FrelZOQVVnRmpzaElVdFhvREhtL2hSalAvRVgwWUxrWkJYUDlo?=
 =?utf-8?B?NVhrWk0vMVR1djYrcGdJZmlhd29lV00zdzRqQmU4b2Yva0V1UnZRQWhseldZ?=
 =?utf-8?B?OStOcGgvMGNobDcwRElNRENJeTBZNVZZay9lbkJuUUZ0ZjArRVdoUHNVbnVE?=
 =?utf-8?B?c1NzeDhvYjBIY1luVytZRTdSYU4ySzQ1N09CZlk1NE9Cd284K2NWSDUvOXRy?=
 =?utf-8?B?NzFJd2Q5ZFd2dkNhQXNUbFk3bEFTOWxiN3ZTMldIbnpOQ3ZQU004L0cyRllQ?=
 =?utf-8?B?R2psbThuZmlDUmhnd1RyemI0QmRXVFZ0cHFYNmg3NHpXOG11clVkMWRETGxu?=
 =?utf-8?B?YlMxcXI1SWJiQzBmWEJXbHBpYU1RZTl4VUowRTVUU2c1aE1VY0JPenQ5OXRq?=
 =?utf-8?B?YVJFRnZONUV2bUIxMXFNTjZOcnZDNlp2bEJYaStjVnJOaVlkdWdkTkdGUWRR?=
 =?utf-8?B?UEw4cEJib2JqVm13NGh5YUZrbGFJMjhwaXNUNUFHOXA0Nk1ud25rejhWWlQ3?=
 =?utf-8?B?OUhvOVhlSWpwYytQL0tVN1ZYYmhSYlNqQWo5NUpvVVZuZ21sL2xRUVVGK0dK?=
 =?utf-8?B?TkI1WXF1N09LRlAwV3labE5JT1hTbXBHMUg0YkYxc2szTUI1T2E1M0FhMXlT?=
 =?utf-8?B?azBxd1RGMkpaMjZqZDgzWmxFQTJFMU8vNmxzcG9lNU9vWFM3aFJoRmV2T1lO?=
 =?utf-8?B?L1djUDdPc2c3SmU3M0IrSENPQ0Fwbi9DYWlIOE9peHM3Ny96VC8xM3BBSWg0?=
 =?utf-8?B?R3d0OUlXblZZK1o4WXkybjkrNDdweEJFYnIzNmEzYk9hZmtheTVFbUlQTEwr?=
 =?utf-8?B?S2NVQ1Y2eGNQN0l6dHhDZHo4OUt4NUZROHgrN1QxVUVBYUlzS0pMdDNkR3BF?=
 =?utf-8?B?SnFOM0p1bHdqbWhieU5xcHBrQmFwR0pMUXJNNnJlMHh2SDFLam9nSjZCVGtV?=
 =?utf-8?B?MFZhNG9IOVVxMkpKbVBhNFBReTJjWkdsSTRwRG5vUWdlTlpNZWovcUN3RVB5?=
 =?utf-8?B?dGNCTityRExNRTJQeGIvbVVnd2w1ZUpBZ2Iya2lzbDNuUXBsa2FyMzBITlNh?=
 =?utf-8?B?Q2RQbVBCQTA5VmRraERIR3A2a0tyblNvRkw2SUtHSzcwMlprRTU1MmI5ZzVW?=
 =?utf-8?B?RkpYWW5iZGd2bzA2alg1WDhaajFYbXVZOS9tQnNmUFJ1S09sTDdKWEpoVmh0?=
 =?utf-8?B?dm1FVU9HRUlNdUNMd1NBSThjNGtQQ2EyTTFJUEY1cEc1cHJnYnlDemxLUzk5?=
 =?utf-8?B?OGVMSXlMKzMrSlhvdDBrS3hFaEpCd2RUT25pRFg1Rm5rRVdoSlUvRkczVnlV?=
 =?utf-8?B?Q0FXeEFMWlVLNW41TmlHWnR3ZitRNlBvWXNMUVZqa2VuV29pUjdPVVlzclBl?=
 =?utf-8?B?Y2laampMaXcwcjZDdHdIeFlYc3ord0w0NGRGQmtGUEZGOU9MbUxLUGhyVXJm?=
 =?utf-8?B?SXA5V2J2NTdNQml3bC9aZEo1NVQzRjd2NW5CRjc1dHNiZ1h6MDZKVVoyYldP?=
 =?utf-8?B?UnJmRGFLaHpwZzFwVmVML1h6TklZZmg3OXdyVjFIZW8wTk0xQUh2eEd1aFpH?=
 =?utf-8?Q?AxTzxmCGj+oxb3ojbcIAE+8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b64b1bf-0075-4574-3219-08db65ba4f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 11:45:07.6160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQUbCfVQ7BA2vcqTPFoef7AoOaDpRZa69GTKmu3APTk5M3mte99CToWG3x3NUOPizuJ6I5L0ReDjPe5jCm2OxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
Subject: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

DQoNCj4gRnJvbTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgSnVuZSA1LCAyMDIzIDQ6NDEgQU0NCj4gDQo+IE9uIDYvNS8yMyAxMDo0MSwgUGFy
YXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA1LzQvMjAyMyA0OjE5IEFNLCB6aGVu
d2VpIHBpIHdyb3RlOg0KPiA+PiBLZXllZCB0cmFuc21pc3Npb24gaXMgdXNlZCBmb3IgbWVzc2Fn
ZSBvcmllbnRlZCBjb21tdW5pY2F0aW9uKEV4DQo+ID4+IFJETUEpLCBhbHNvIGFkZCB2aXJ0aW8t
YmxrIHJlYWQvd3JpdGUgOEsgZXhhbXBsZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogemhl
bndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+ID4+IC0tLQ0KPiA+DQo+ID4+ICtB
biBleGFtcGxlIG9mIGEgdmlydGlvLWJsayB3cml0ZSA4SyByZXF1ZXN0KG1lc3NhZ2Ugc2l6ZToN
Cj4gPj4gc2l6ZW9mKENvbW1hbmQpICsNCj4gPj4gKzQgKiBzaXplb2YoRGVzY3JpcHRvcikpOg0K
PiA+PiArXGJlZ2lue2xzdGxpc3Rpbmd9DQo+ID4+ICsgQ09NTUFORMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKy0tLS0tLSsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHxvcGNvZGV8wqAgLT7CoCB2aXJ0aW9fb2Zfb3BfdnJpbmcNCj4gPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstLS0tLS0rDQo+ID4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Y21kIGlkfMKgIC0+wqAgMTANCj4gPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstLS0tLS0rDQo+ID4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8bGVuZ3RofMKgIC0+wqAgMA0KPiA+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tLSsNCj4gPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHxuZGVzYyB8wqAgLT7CoCA0DQo+
ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLS0tLS0tKw0KPiA+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHJzdmTCoCB8DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLS0tLS0tKw0KPiA+PiAr
DQo+ID4+ICsgREVTQzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLS0tLS0tKw0KPiA+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfGFkZHLCoCB8wqAgLT4gMHhm
ZmZmMDEyMzQ1NjcwMDAwDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArLS0tLS0tKw0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfGxlbmd0aHzCoCAtPiAxNiAodmlydGlvIGJsayB3cml0ZSBjb21tYW5kKQ0KPiA+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tLSsNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHxpZMKgwqDCoCB8wqAgLT4gMA0KPiA+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tLSsNCj4gPg0K
PiA+IGZvciBSRE1BIHRoaXMgaWQgaXMgbm90IHVzZWZ1bC4gSXQgY2FuIGJlIG9taXR0ZWQuDQo+
ID4gc3RpbGwgcGFyc2luZyB0aGUgcmVzdC4NCj4gPg0KPiA+IGlmIHdlIHRhbGsgYmxrIGFzIGFu
IGV4YW1wbGUsIGFib3ZlIGNvbW1hbmQgZGVzY3JpcHRvciBjYW4gYmUgb2YgMzINCj4gPiBieXRl
cywgc3VjaCBhcyBzdHJ1Y3QgdmlydGlvX29mX2NtZCB7DQo+ID4gIMKgwqDCoMKgdTggb3Bjb2Rl
Ow0KPiA+ICDCoMKgwqDCoHU4IHJzdmQ7DQo+ID4gIMKgwqDCoMKgbGUxNiBjbWRfaWQ7DQo+ID4g
IMKgwqDCoMKgdTggaW5saW5lX2Rlc2NfY250Ow0KPiA+ICDCoMKgwqDCoHU4IHJzdmRbM107DQo+
ID4gIMKgwqDCoMKgLyogc29tZSBwYWRkaW5nL21ldGFkYXRhIGZvciBsb25nIGRlc2MgbGlzdCBp
ZiBhbnkgKi8gfTsNCj4gPg0KPiA+IHN0cnVjdCB2aXJ0aW9fb2ZfcmRtYV9kZXNjIHsNCj4gPiAg
wqDCoMKgwqBsZTY0IGFkZHI7DQo+ID4gIMKgwqDCoMKgbGUzMiBsZW5ndGg7DQo+ID4gIMKgwqDC
oMKgbGUzMiByZG1hX2tleTsNCj4gPiB9Ow0KPiA+DQo+ID4gc3RydWN0IHZpcnRpb19yZG1hX29w
IHsNCj4gPiAgwqDCoMKgwqBzdHJ1Y3QgdmlydGlvX29mX2NtZCBjbWQ7DQo+ID4gIMKgwqDCoMKg
c3RydWN0IHZpcnRpb19vZl9yZG1hX2Rlc2MgZGVzY1sxIG9yIDNdOyAvKiBjb3VudCBjYW4gYmUN
Cj4gPiBuZWdvdGlhdGVkICovIH07DQo+ID4NCj4gPiBXaXRoIHRoaXMgYSBzZW5kIGFuZCByZWNl
aXZlIHF1ZXVlIG9uIGluaXRpYXRvciBhbmQgdGFyZ2V0IGNhbg0KPiA+IGV4Y2hhbmdlLCBjbWQg
ZGVzY3JpcHRvciBmb3IgcmVhZC93cml0ZXMuDQo+ID4NCj4gDQo+IEhpLA0KPiANCj4gRG8geW91
IG1lYW4gdGhhdCBzZXBhcmF0aW5nIGEgVmlydGlvIE92ZXIgUkRNQSBxdWV1ZSBpbnRvIDIgUVAs
IG9uZSBmb3INCj4gc2VuZGluZywgYW5vdGhlciBvbmUgZm9yIHJlY2VpdmluZz8NCj4gDQpOby4g
anVzdCBvbmUgUVAuDQoNCkluaXRpYXRvcl9RUF9BIC0+IHRhcmdldF9RUF9CLg0KDQpXaGVuIGlu
aXRpYXRvciBRUCBBIHNlbmRzIDMyQiBjbWQsIGl0IGxhbmRzIGluIHRoZSB0YXJnZXQgUVAgQidz
IHJlY2VpdmUgcXVldWUuDQoNCkFmdGVyIHRoaXMgdGFyZ2V0IGNhbiBkbyBvbmUgb3IgbW9yZSBy
ZWFkL3dyaXRlIERNQSB1c2luZyBSRE1BIHJlYWQvd3JpdGUgZnJvbSB0aGUgaW5pdGlhdG9yJ3Mg
bWVtb3J5Lg0KDQpGaW5hbGx5IHRhcmdldF9RUF9CIHNlbmRzIDhCIGNvbXBsZXRpb24sIGl0IGFy
cml2ZXMgaW4gdGhlIFFQX0EncyByZWNlaXZlIHF1ZXVlLg0K

