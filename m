Return-Path: <virtio-comment-return-8307-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D03AC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:31:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACA37217DE
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:31:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F256986D01
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:31:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 64B6F986CF7; Fri, 10 Nov 2023 06:31:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 537E9986CF8
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 06:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATJvDYwyvxyUJSPkZJHe13YibzFQS9YuuMyQaJl5J4TTF1Wm78Sy7GRSOsuaJETJWEmawrJVB0HHwzKT6CLM/G5lFBHIFBGzwP1s2WL0XrTO5CZMePzTT4W3dlbKgrWXEXFGC65Gzac2DXV3GB1cJ5lirWS8/9qS5SK/kmr0fCzXzVm6QirrOAkCo7RjEubO2Uq8JLpfa9J4pgSV1VCCYNJxhzJKHKAbeI0KeZY0jnHxIKLNB3cHcfCoRHukg8sv1NogrJVVgCQ2ZelDg2xZ5fa3lC0uUW8mBekMHHVSLSNJvbhtiGtuMSfAr7CJW2eVvQ+uQ8zg36vqjp9ZqoOwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guUCmKDJWR3NUOG2gcAu+AxnTLuXjtSaI3ktZWxJhto=;
 b=QKehc9D5SDA7FWjAUrlKROQtehyfw9Ym5hzacXlHt0cPIY27mZljYolDtbwX8Lv+LmVkvOnlHIF97EL0FDjFleotBPpDHEq/lUeBxAFk1ZOjrLhIL1PSqjWhgobIYhUnjbZf2mifsGpnlTg5cNUjkCQm/+utgJiiMq7IaZ31fl/wEsxHQYcyswyvN8kh0PtKdRmhGWkYAOy3Do0dKVpf6SBmVXWaoNUbffrbSM1LmZnwqf4eey0LkbyDyGkBgJ0E71JJxDR0Qn2mArFYed5bNmolfIWAIwbX9BQO0zH3rbxsLCifHj3QxyPA02yWR2e2Jnq1wXSPTeElP0nxsjKERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND
Thread-Index:
 AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiCAAVIbAIAAAG5w
Date: Fri, 10 Nov 2023 06:31:24 +0000
Message-ID:
 <PH0PR12MB5481C31027CE6716503F3F24DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
In-Reply-To: <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB8925:EE_
x-ms-office365-filtering-correlation-id: a691e8c6-8b62-4400-a7d3-08dbe1b6a960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oHPoHSh+6Te5FXCeE515IeEZxVultLSLTjol4cit6r7+C6qOWaDkPHKrqjxNZjbVTyJbOxDvfVxt7DZGNsYH9mZ4Sk1HvQHdoGVEUl8zcj7ORODtHg1aqXdc5g+G9hgN9UjDTHL4B7KZh/W5VJZQ94csSeae/r6SPyjN7xcQPJ8oF59jVk2sD9/EL6TxfAd7tTM7Kw1elt12GhlMHX6uKX3Srghkz2RHdvwV/tT7j4fW28JxKgV+SE3J26/sM69ToNHKQsDOlHSbhblbgb0RHibVDAvl1UaYOB+Cm6ljiWGp+E6+/9a1b1jBucQ+2Cxr4av8xN2NHX3Je1/59PBogSZ5JquhZYifytH3eFBhrunYD/PIq6AI3ZflGqO9SqU7UTIk0Flqsse4+ZTbSc49TIvnIucxwXeX52vMc1mExHryJnhpBeAYnzGd+ahdK/oXGz+/Ni3DPF/9IlDXjgevAwuYYO8l4EK4aPsixuJLfgOVSnEHAmiGIgZ+J+p5+75zHnm1cHhTMPLxz7vt3ngOIca9i/aZXtv6VtVZ2lde1OrNsdkn4o2Nkx3UVm+i2rA8Is3RQnFjS1JMmZJF2s5ruyPBYf4y8/v8sQhFR5oLPaEP6aRDP6lxQSEYtJh3t77OaG/N2LWPn4ooxqug8RFMcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39860400002)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(66899024)(478600001)(38070700009)(38100700002)(122000001)(33656002)(86362001)(83380400001)(76116006)(7696005)(9686003)(66476007)(64756008)(316002)(66556008)(66446008)(54906003)(71200400001)(110136005)(53546011)(66946007)(26005)(6506007)(2906002)(41300700001)(5660300002)(15650500001)(52536014)(8936002)(8676002)(4326008)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2VlSmUvS05laTM4QUhJRlpCQTFTd0J1cW8wRkdlUlFFbjFJdDJBNWZGWWM2?=
 =?utf-8?B?WUpmMWcwcTU3UEhWak5xQ1N2NnNoQjBFckIxTzR3MUtNY1haMlFGZlQwbXVR?=
 =?utf-8?B?TWw4TjVmeHk2QWs2bUdLYVZleFNsSnZCNFRMTWJwZFpsRVQxNVpuYmVVWFB2?=
 =?utf-8?B?bGVRRlFFdmhBb0Nka0o3eVErRHdDR1Juc29nYnB3Si9CRDZWV1VwVkV5RTNY?=
 =?utf-8?B?NHlHU1BmWGp6Q0hpR0JoS2NpZFBNZkJYTUs5SzhCWjJJalVRY1FhYkVxQ2xD?=
 =?utf-8?B?UjdTN0oxZUZtQ1VZeGN3WUI4Z2YrSFBXWDUyd3V3Y3d1Vjl2a3BxbU54VTQ0?=
 =?utf-8?B?UjcrVFh1dlk4SCtEY0kvOXdTaE55Wk9Hb2MzelZRRzBWRnNzVGFmcnBYYUxB?=
 =?utf-8?B?d042NFBNN0lGNnNmb2pBN2pPNlFaTnF6RzdFVVNjdXppK3V4WC83MzBleGto?=
 =?utf-8?B?cEtmS0krNlVsMkVwSzV2L1IyVFhlbFMwVHh5Z0lPbzIwZFJyN0FuV1dGUDFk?=
 =?utf-8?B?WDhjOU84eXI3bm9lM0ZnMG5MT1dwQ0tnVUUwQ1BEM3ZJU0dHenduT3h1RzQ3?=
 =?utf-8?B?TVp5amRoZWhxK091YiszY282QlFhK2lTbW5VMExuT2hxTHQyN25aMDdLa0NB?=
 =?utf-8?B?ZlgrZ1JJeGY1c2U1Rjc3eElaaFdDenJmSzNhY3dUMUlzTktyNWdTZW9RcytK?=
 =?utf-8?B?bm9KcExzQmIva3I4SlNkY05mdVI4aXVjVXpid0ZiQVdGK1R0VTRVSXJQVzVw?=
 =?utf-8?B?KzdMYVdRWWdOVkp5QlhoSWJUMjFzUm9uaEtNRlV6SkJzU3JFeTQ4MS94b2Z2?=
 =?utf-8?B?S3RVWUdMb3A3eTFLcFR4Q3EzNGh6UUxtcC9JVFArQlFjZ09aMDkrNDRVWmUx?=
 =?utf-8?B?WmtKMXV5Mmp1ZFlMTUdBVC9EaytRN21Id01BekRFcUFqSEJjdmQ5dFB1VWc5?=
 =?utf-8?B?dkFFaytwcmhBUkFMeFNiRnc0MUI2djhtM0h0dDdNelhEKzZJOG1HdGxmUWVH?=
 =?utf-8?B?NnY0S0M1eGhYMUczYXhDcERwaDh2QXRxUDNEa1Y0UEJ2RndWVjR5SWozajBa?=
 =?utf-8?B?U2xOZkJFclc1UXRYSGh6dmY2S0wwZGJJWk9YL2Jjc2ZNWCtWQ29yQnNIYVRp?=
 =?utf-8?B?bHMvTVFMR2NkYjQ1RXhZMHdyR3NadlA1NWJNcEZ2S21FWmxmRTQxTHV5bElI?=
 =?utf-8?B?ZHdHTDl6Wkh0c2J1QzF0RjNYWkN4TXB3U2taZ3NwbWM0aGc0NExmcDNZOE0v?=
 =?utf-8?B?aFNVQkxQVFg3TXQ2Rk9GQVpmVUFuTXhUK1QzQXErRVdxMS9WWExWSmVIc2Nh?=
 =?utf-8?B?LzlVUm9FQnp2K3M5N2o4bXUxOHV2T3oxTUw3MGtQUXNKVm9HYTFtOGcwSUI5?=
 =?utf-8?B?TWQzQUxVNDlLeko0dWpQSUlUMFVERWNEN2hZcmJGUzZGQWZtSUJoSy9oaVhY?=
 =?utf-8?B?bDVXcnlKV0JlWTVQN1JlUDMzZ0g5bFNSdWRJYVdHaU9IL2dqOTBvWWJBdUR1?=
 =?utf-8?B?bnVqd3IvNlZOU0t5MTBUN0FHaGdYWEZNcy83N3RmSkg0d1VyUVlXVWNmekdR?=
 =?utf-8?B?MGxYOXNBNmVYYjJweUFGRlZIUEF3QnA2a2Jqdm1xODVGVVk4bE9iUmVoWVdu?=
 =?utf-8?B?RHkyeUFYOHFHN1I4c2Z2L2RNQXBqTFVQbXNHdS9DeWQ0dXFZdDE5V3lyZGla?=
 =?utf-8?B?emx4QlZKTEFOaENPRmtVMk0wY1c4VnNBdS8rVXltOWFndVBwL3pKVlk3UUta?=
 =?utf-8?B?QVZvUXZpUGZ5VU9DYnhQMTJYYVNnTWN6TDJwY2x0M1I1K1JqWUJUeWRIWEha?=
 =?utf-8?B?c3lIeFJ3aDJpUVZ1TEN5NERySGRPU3NYUmN3TFBuTjNrUm82RFZuRTg0SVFG?=
 =?utf-8?B?SG5WV0FLSWRGMnhoRXNjRnNhOFd6UFJpcTNLeEZSdGNoVzNRbk4yYmhySElN?=
 =?utf-8?B?RWlyNEJoZWNrcDV2T2hMUkRlZGx5a0lrSEY4ZVBlSE1YRCtReHhiUm1Pb0d4?=
 =?utf-8?B?ak50MVNXTWZubC83OFhBZFFua0wvbTkvT1FvQXBGcE1ieGlnN2s5Vm0vOG8x?=
 =?utf-8?B?bkZGSFRzWmpDb2xOeDRRZ0JzR2hLaUkxZnRsSTYzSUhqbHNjRHNVYkNuS242?=
 =?utf-8?Q?/mcg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a691e8c6-8b62-4400-a7d3-08dbe1b6a960
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 06:31:24.4990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAAUSYye0Ld5fpWSkq7qEY2wUk650dCDQRC3jZgHvXlG+JRGVdGRxQfMxTpsP8e71D95YDlC2y6+UTvGWKD/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
Subject: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgTm92ZW1iZXIgMTAsIDIwMjMgMTE6NTIgQU0NCj4gDQo+IE9uIDExLzkvMjAyMyA2
OjE1IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxp
bmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAy
MDIzIDM6MjggUE0NCj4gPj4NCj4gPj4gT24gMTEvOS8yMDIzIDE6NDYgQU0sIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgTm92IDA3LCAyMDIzIGF0IDA1OjI3OjIzUE0g
KzA4MDAsIFpodSwgTGluZ3NoYW4gd3JvdGU6DQo+ID4+Pj4gT24gMTEvNi8yMDIzIDU6NDkgUE0s
IE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPj4+Pj4gT24gRnJpLCBOb3YgMDMsIDIwMjMg
YXQgMDY6MzQ6MzRQTSArMDgwMCwgWmh1IExpbmdzaGFuIHdyb3RlOg0KPiA+Pj4+Pj4gV2hlbiBT
VVNQRU5EIGlzIHNldCwgZGV2aWNlIHN0YXRlcyBhbmQgdmlydHF1ZXVlIHN0YXRlcyBzaG91bGQg
YmUNCj4gPj4+Pj4+IHN0YWJsaXplZCwgdGhlcmVmb3JlIHRoZSBkcml2ZXIgc2hvdWxkIG5vdCBy
ZXNldCB2cXMgd2hlbiBTVVNQRU5EDQo+ID4+Pj4+PiBpcyBzZXQgaW4gZGV2aWNlIHN0YXR1cy4N
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFu
LnpodUBpbnRlbC5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+ICAgICBjb250ZW50LnRleCB8
IDMgKysrDQo+ID4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+
Pj4+Pj4NCj4gPj4+Pj4+IGRpZmYgLS1naXQgYS9jb250ZW50LnRleCBiL2NvbnRlbnQudGV4IGlu
ZGV4IGJjYzlkNGIuLjA2MGI1YzINCj4gPj4+Pj4+IDEwMDY0NA0KPiA+Pj4+Pj4gLS0tIGEvY29u
dGVudC50ZXgNCj4gPj4+Pj4+ICsrKyBiL2NvbnRlbnQudGV4DQo+ID4+Pj4+PiBAQCAtNDQ0LDYg
KzQ0NCw5IEBAIFxzdWJzdWJzZWN0aW9ue1ZpcnRxdWV1ZQ0KPiA+Pj4+Pj4gUmVzZXR9XGxhYmVs
e3NlYzpCYXNpYw0KPiA+PiBGYWNpbGl0aWVzIG9mIGEgVmlydGlvIERldmljZSAvDQo+ID4+Pj4+
PiAgICAgVGhlIGRldmljZSBNVVNUIHJlc2V0IGFueSBzdGF0ZSBvZiBhIHZpcnRxdWV1ZSB0byB0
aGUgZGVmYXVsdCBzdGF0ZSwNCj4gPj4+Pj4+ICAgICBpbmNsdWRpbmcgdGhlIGF2YWlsYWJsZSBz
dGF0ZSBhbmQgdGhlIHVzZWQgc3RhdGUuDQo+ID4+Pj4+PiArSWYgVklSVElPX0ZfU1VTUEVORCBp
cyBuZWdvdGlhdGVkIGFuZCBTVVNQRU5EIGlzIHNldCBpbg0KPiA+Pj4+Pj4gK1xmaWVsZHtkZXZp
Y2Ugc3RhdHVzfSwgdGhlIGRyaXZlciBTSE9VTEQgTk9UIHJlc2V0IGFueSB2aXJ0cXVldWVzLg0K
PiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gICAgIFxkcml2ZXJub3JtYXRpdmV7XHBhcmFncmFwaH17Vmly
dHF1ZXVlIFJlc2V0fXtCYXNpYw0KPiA+Pj4+Pj4gRmFjaWxpdGllcyBvZiBhDQo+ID4+IFZpcnRp
byBEZXZpY2UgLyBWaXJ0cXVldWVzIC8gVmlydHF1ZXVlIFJlc2V0IC8gVmlydHF1ZXVlIFJlc2V0
fQ0KPiA+Pj4+Pj4gICAgIEFmdGVyIHRoZSBkcml2ZXIgdGVsbHMgdGhlIGRldmljZSB0byByZXNl
dCBhIHF1ZXVlLCB0aGUNCj4gPj4+Pj4+IGRyaXZlciBNVVNUIHZlcmlmeSB0aGF0DQo+ID4+Pj4+
IFNlZW1zIHNvbWV3aGF0IGFyYml0cmFyeSBhbmQgYnJlYWtzIHRoZSBjbGFpbSB0aGF0IHRoZSBm
ZWF0dXJlIGlzDQo+ID4+Pj4+IG9ydGhvZ29uYWwgYW5kIGNhbiBoYXZlIHVzZXMgYmVzaWRlcyBt
aWdyYXRpb24uDQo+ID4+Pj4gd2hlbiBzdXNwZW5kZWQsIHRoZSBkZXZpY2UgaXMgZnJvemVuLg0K
PiA+Pj4+IFRoZSBkcml2ZXIgaXMgYXdhcmUgb2YgdGhpcyBwcm9jZXNzIGFuZCBzbyBzaG91bGQg
bm90IHJlc2V0IHRoZSB2cXMgSSB0aGluay4NCj4gPj4+IEFnYWluIHRoYXQgaXMgb25seSB0cnVl
IGJlY2F1c2UgeW91IHdhbnQgdG8gdXNlIGl0IGZvciBtaWdyYXRpb24uDQo+ID4+PiBCdXQgdGhl
biB5b3UgY2FuJ3QgY2xhaW0gaXQncyBhIGdlbmVyaWMgZmFjaWxpdHkuDQo+ID4+IEkgZG9uJ3Qg
Z2V0IGl0LiBUaGUgZGV2aWNlIHN0YXR1cyBpcyBhIGJhc2ljIGZhY2lsaXR5Lg0KPiA+Pg0KPiA+
PiBXZSBuZWVkIHRvIFNVU1BFTkQgdGhlIGRldmljZSBieSBzZXR0aW5nIFNVU1BFTkQgYml0LCB0
byBzdGFiaWxpemUNCj4gPj4gdGhlIGRldmljZSBzdGF0ZXMgZm9yIG1pZ3JhdGlvbi4NCj4gPiBJ
cyB0aGUgUENJJ3MgUE0gdGltZSBub3QgZW5vdWdoIHRvIHN1c3BlbmQgdGhlIGRldmljZT8NCj4g
PiBGb3IgbGFyZ2UgZGV2aWNlIEkgY291bGQgaW1hZ2luZSBpdCBjb3VsZCBiZSBzaG9ydC4NCj4g
QXMgeW91IHNlZSwgUENJIFBNLCBzbyB0aGlzIGlzIGEgbGF5ZXIgdmlvbGF0aW9uLCB2aXJ0aW8g
c2hvdWxkIGJlIHNlbGYgY29udGFpbmVkLA0KDQpJZiB5b3UgdGhpbmsgaXQgaXMgbGF5ZXIgdmlv
bGF0aW9uLCB0aGFuIHN1c3BlbmQgYml0IGZvciBzdXJlIGlzIG5vdCBuZWVkZWQuIFBDSSBQTSBp
bnRlcmZhY2Ugc2hvdWxkIHN1c3BlbmQvcmVzdW1lIHRoZSBkZXZpY2Ugb24gRDA8LT5EMyBzdGF0
ZSB0cmFuc2l0aW9ucy4NCg0KPiBhbmQgd2hhdCBhYm91dCBNTUlPIGFuZCBDQ1c/DQoNClRoZXkg
aGF2ZSBsYXJnZWx5IGxhY2tlZCB0aGUgcmljaG5lc3Mgb2YgUENJIHRyYW5zcG9ydC4gU28gdGhv
c2UgdHJhbnNwb3J0IG5lZWRzIHRvIGV2b2x2ZS4NCk90aGVyd2lzZSwgUENJIG9mZmVycyByaWNo
IHRyYW5zcG9ydCBmYWNpbGl0aWVzIGNvbXBhcmVkIHRvIE1NSU8sIGhlbmNlLCBpdCB3aWxsIGNv
bnRpbnVlIHdpZGVyIHVzZS4NCg0KPiBUaGlzIHNob3VsZCBiZSBhIGJhc2ljIGZhY2lsaXR5Lg0K
T3RoZXIgdHJhbnNwb3J0IGNhbiBhbHNvIG9mZmVyIGxpa2UgUENJLg0KDQo+ID4NCj4gPiBJbiB0
aGF0IGNhc2UgaWYgdGhlcmUgaXMgc3VzcGVuZCB0aGUgZGV2aWNlIGF2YWlsYWJsZSwgaXQgd2ls
bCBiZSB1c2VkIGJ5IHRoZQ0KPiBndWVzdCBkcml2ZXIgaXRzZWxmLCBoeXBlcnZpc29yIHdvdWxk
buKAmXQga25vdyBhYm91dCBpdCB3aGVuIHRob3NlIHJlZ2lzdGVycyBhcmUNCj4gbm90IHRyYXBw
ZWQuDQo+ID4gU28gd2UgbmVlZCB0d28gd2F5cyB0byBzdXNwZW5kLg0KPiA+IE9uZSBpcyBndWVz
dCB2aXNpYmxlLCBhbmQgZ3Vlc3QgY29udHJvbGxlZC4NCj4gPiBTZWNvbmQgaXMgaHlwZXJ2aXNv
ciBjb250cm9sIHRvIGZ1bGZpbGwgdGhlIGRldmljZSBtaWdyYXRpb24gbmVlZHMuDQo+IFRoZSBn
dWVzdCBjYW4gZXZlIHJlc2V0IHRoZSBkZXZpY2UuDQo+ID4NCj4gPiBTbyBpZiB5b3UgY2FuIHBs
ZWFzZSB0YWtlIGEgbG9vayBpZiB0aGUgcHJvcG9zZWQgYWRtaW4gY29tbWFuZCB0bw0KPiBmcmVl
emUvc3RvcCBtb2RlIGNhbiBiZSB1c2VkIGluIHRoZSBlbXVsYXRlZCByZWdpc3RlciBjYXNlIG9y
IG5vdC4NCj4gPiBJdCBoZWxwcyB0byBoYXZlIHRoZSBzdXNwZW5kIGJpdCBpbiBndWVzdCBjb250
cm9sIGFzIHdlbGwgd2l0aC93aXRob3V0DQo+IGVtdWxhdGlvbiBtb2RlLg0KPiBQYXJhdiwgcGxl
YXNlIGJlbGlldmUgSSBoYXZlIHJlYWQgeW91ciBzZXJpZXMsIEkgZGlkbid0IGNvbW1lbnQgdGhl
cmUgYmVjYXVzZSBJDQo+IHdhbnQgdG8gYXZvaWQgZnVydGhlciBjb25mbGljdHMvZGViYXRpbmcs
IHdlIGhhdmUgZG9uZSB0aGVzZSBlbm91Z2guDQo+IA0KSSBiZWxpZXZlIHRoZSBzZXJpZXMgcG9z
dGVkIGluIHYzIGNhbiBzdXBwb3J0IHZkcGEgdXNlIGNhc2UgYXMgd2VsbC4NClNvIEkgd2lsbCBw
cm9ncmVzcyB0byBwb3N0IHY0Lg0KDQo+IEFzIGV4cGxhaW5lZCBiZWZvcmUsIGZyZWV6ZS9zdG9w
IHRoZSBkZXZpY2UgYnkgUENJIGlzIGEgbGF5ZXIgdmlvbGF0aW9uLg0KSSBhbSBhZnJhaWQsIHdl
IGhhdmUgZGlmZmVyZW50IHZpc2lvbi4NCkkgZG9u4oCZdCBzZWUgYW55IGxheWVyIHZpb2xhdGlv
bi4NClN1c3BlbmQgaXMgZW5vdWdoIGluIHRoZSBQQ0kgUE0uDQpPdXIgdmlzaW9uIGlzIG1vcmUg
YWxpZ25lZCB3aXRoIHJlc3Qgb2YgdGhlIGh5cGVydmlzb3Iga25vYnMgdGhhdCBvd25zIHRoZSBt
aWdyYXRpb24gZnJhbWV3b3JrLg0KDQo+IA0KPiBBbmQgZGV2aWNlIHN0YXR1cyBjYW4gYmUgcGFz
cy10aHJvdWdoKHdpdGhvdXQgZW11bGF0aW9uLCBqdXN0IG1hcCBpdCB0bw0KPiBndWVzdCkgdG8g
dGhlIGd1ZXN0IG9yIHRyYXBwZWQodHJhcCBhbmQgZW11bGF0ZSBieSB0aGUgaHlwZXJ2aXNvciwg
Zm9yIGV4YW1wbGUNCj4gc2V0X3N0YXR1cyBpbiB2RFBBKS4NCldoZW4gaXQgaXMgcGFzcy10aHJv
dWdoLCBpdCBpcyBjb250cm9sbGVkIGJ5IHRoZSBndWVzdCwgc28gZm9yIGV4YW1wbGUsIGlmIHRo
ZSBndWVzdCByZXNldHMgdGhlIGRldmljZSwgaHlwZXJ2aXNvciBoYXMgbG9zdCB0aGUgY29udHJv
bCBvZiBtaWdyYXRpb24gY29udGV4dCBldGMuDQpIZW5jZSwgaHlwZXJ2aXNvciBuZWVkcyBhIGNo
YW5uZWwgd2hpY2ggaXMgbm90IGd1ZXN0IG93bmVkLg0KDQpTYW1lIGNoYW5uZWwgY2FuIHdvcmsg
d2hlbiB0cmFwK2VtdWxhdGlvbiBpcyBkb25lLg0KDQo+ID4NCj4gPj4gVGhpcyBjYW4gYWxzbyBi
ZSB1c2VkIGZvciBkZWJ1Z2dpbmcgSSB0aGluay4NCj4gPiBBcyBNaWNoYWVsIGxpc3RlZCwgYSBk
ZWRpY2F0ZWQgZGVidWcgaW50ZXJmYWNlIGlzIHVzdWFsbHkgbW9yZSB1c2VmdWwgaW5zdGVhZA0K
PiBvZiBpbi1iYW5kLg0KPiByZS11c2luZyBhbm90aGVyIGZhY2lsaXR5IHdpdGhvdXQgZXh0cmEg
ZWZmb3J0cyBpcyBub3QgYSBiYWQgdGhpbmcgYW55d2F5Lg0KDQpJIGp1c3QgZG9u4oCZdCBzZWUg
aG93IGEgc3VzcGVuZCBiaXQgc29tZSBkZWJ1ZyBmZWF0dXJlLg0KQWxtb3N0IGV2ZXJ5dGhpbmcg
d2l0aCB0aGF0IHJlZ2FyZCBpcyBhIGRlYnVnIGZlYXR1cmUgdG8gbWUuDQo=

