Return-Path: <virtio-comment-return-7885-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FABC001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:47:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C53E2CAD5
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:47:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1080986938
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:47:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD8F7986931; Fri, 20 Oct 2023 12:47:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D044F986932
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbV4U6MNI6j4Xwe0IPbRN4kGk5qxQ6h7aQwmScgfp0gtwFKHCz60xOroee0z85feye7J2kayGe561oV24ipeLfEJ/qzp18RB81IB6eyMB/J5z0T5IvqKaK92TbXrB5ZqWia0YNOluh8wCNbNeW4BcEWWAXpbXloEjueohI8wEoeQ7hImYQdOInXoMaI7wItqQXDkTw8N0sjh0+YRNWSzDFQBw15/gFzz7FYHn4ibmZ4pSztXXSxr2+ySLLoS1bMowatUWcZUsxWC/JGVlzR64lBpiLG6dn/BMM2l97R/t2/svyodH1Yb1c2u4KcY5Vxh+b3ts63YrAS2K/f2wI/FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF90EjoSMCv29ddZFW/Wuc5H3GoV6656AEavtzv9w1s=;
 b=ixFYyQQJ8KaGT/48rVMMhLxs0AjWvtRdRHJg2FbK2i4jh2pJ72/akAhTES5OqOzqGg7Ja3L30Dgo47CwXKGfAsmISokt/Be5uYd0eUyn5X72EPqQoR6orhrvBCHb/RDgdz2i2wwJ4cMVmS6WZDaKTnEibTNEd4VaIx0a8tXE9To4BlE2E8g04RMvJHWI+BLFX5PYky2k5e5/d2BTiLcfCqrGWw7/t2oMcgjmMrqiEvFfx4braIgvygdz6pDZa3RN2KeRLz3DvE70EckC3J8cB3xBU5oiH034HrJ1aEX4HCTTzFGdaZKSN3LcVV8VJdlkHi9ZECfkRkUh8k0kmN/CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAAALdAIAAGU2AgAAZUrA=
Date: Fri, 20 Oct 2023 12:47:12 +0000
Message-ID:
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
In-Reply-To: <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6996:EE_
x-ms-office365-filtering-correlation-id: 4aba61ce-4b20-4459-8273-08dbd16aae32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AuPHVqbl3HCkoEuHKnUJrYuCB5r0Kap9NAdM8VIuH8vgYh6LZwHeaJlmdfzBFgtuFgbwhNQshNCZWWtvtqd1N5eZv4UhhDXEI+7pSXpnCfYcPBLaG8JtmHBYt6O6yh+Otmg17S6rqNNXpWhYB+/gcVatTT4f6T+HFeYsFI6pLBTSYUFhlDLRfnnPHFMDetDMgSdNl4NDCulLpfWceMjDwNNl5+xM4pr3iRu9hDGxyLnqp8A2C4VpIpEH5LEn43MIa7rnTr0ghhea5884FUth1FposJdb7MxrTIogwvuqK/iaJlEZ5BdcomASbvk7A43t/achxuEz5NtxfrWQuYHrpsydpQcHXSggrgXjVYfKIv8lGdqAXgz0ABmchhY6iq36qMZbMw4cKgwZk2GMxAexqbArRWsdkG+a6Wjwopadvx7pNdBBgMLoGWKnTkQBBDA4WfyY0qcgPygJng6vhQiffCmpv/fSg1FwN1XAr/fOOreBewbakMPHmhfzkzEPuFfrVBGqb6ZeO9bG1geQ7sTETL6BmytqHMTgsYLYhkkHl8c5FiWL5hhZkgGTNcCFPtUmUwIbMEPM18p/7ZUGlfJQ2vUhC+YflRiSXHe4V7m3Hz80jOM5SSXks7WJZ5DyVZNY0vUNDpYElm/AV0ITd0gmeX0Qczpm0YlevVDCXgwh7zM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(55016003)(86362001)(5660300002)(33656002)(2906002)(6506007)(76116006)(53546011)(83380400001)(26005)(478600001)(122000001)(966005)(7696005)(9686003)(8676002)(4326008)(8936002)(52536014)(107886003)(66446008)(64756008)(41300700001)(54906003)(110136005)(316002)(38100700002)(38070700009)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UURNZU1VR0NPUmxnNjdaU0FoQWZmcllPVnhmSkU0cmNXeEtaRmtMbWcrbWFU?=
 =?utf-8?B?aHd6QlFlU1ZyUnlvQnEvRlpqa04xaUhLTnZlN2R3WTVyRUFRZ0tuZ3JUd3ll?=
 =?utf-8?B?NmxYaDhPcGVvZ015WXdYOHNQMmVhZlNxRFBVMFhnTGlJd3pua2c0TlBkV3dx?=
 =?utf-8?B?cjZIcS9tby9xZ1YzbWpzUmdoREdwY1pBbjdObzI2UzRNZjUzTFozQ1pldG5r?=
 =?utf-8?B?ajJQMFRULzV5TkNCZWc2SlVXQ0d1SXBkYTJXcnYwRndJa29jZG1BcGRlNWV3?=
 =?utf-8?B?b21NbnhsQWF0S0FSZmErQTZrYUFiNkpqTmdkOHdyUVlVU3VTTXJ2a0pYSkxF?=
 =?utf-8?B?K2xvVzlpNlVVUFEzRzlzMWhsaVJjQXJ6OGlUYU1DZGdhVlp6emVFWjRoQjdv?=
 =?utf-8?B?UlExbW0rVlFSZlhhTzMzb1FHSzcrVHkrd1JvSjlESjhYV3R2L3NiRDNVSzNO?=
 =?utf-8?B?V29OQUp5V014MWgwT0J1QUhoOEdKYXhENnhKemp5VzFsWkx0MlNCRDZuWFZ4?=
 =?utf-8?B?blQ2K0Ixak02YlRZSmRJbFVqeDE5UWxlekxXNE1KUStvMk9jZGJWejV0SGNJ?=
 =?utf-8?B?TXlnR2xjSU9Ccm9zMlFKYVN0bS8wWmVPZDJNU0dNUFY4ajc5QjZkWG4xRFl3?=
 =?utf-8?B?cnA3OTU0S1BuWERnM0RVSjd0cjhNVmxhMXpUek5JZVFNQ2ZiMFJSR2FvTXR0?=
 =?utf-8?B?UWlhMjZhR3FpZnFsMTlvKzBGNkQwV1Fxc094SVVsaVFmbFhaYTcwQ014Um5W?=
 =?utf-8?B?bXNZdDNNUzNBcE5JRmZ3czBjK1JHWkRHbkk5Nml4WmxuRHZwcjV1cEdLZnFK?=
 =?utf-8?B?dU55eENSdjR1MTRYUXAwelVVM3hIV1NuYUwzd3RjOHk5bGRDckszRGQ4OXo1?=
 =?utf-8?B?eWpxNTd4cmhuZlBSc0FnU1A0cVEzd3FJeGNIUFZ3K1NnN0phRUZXSHJkY3A5?=
 =?utf-8?B?YWc5MlV5STBoQkJUZzNEZEUyVTVtQ1BGT2xkejlYSzRwanpBTFlpaXVnODNj?=
 =?utf-8?B?ZUpXVGZEUVBQc3ppeElOcjQ1NUJrbkpWZUdudjE2ZEZMUkw0SkRJZVV6eTVM?=
 =?utf-8?B?aWQ3azVlbTVhTXFtbXNyRUhZWndSTjlWaE1NVDkzMHljN3Zzdi9Ic3hWbWtH?=
 =?utf-8?B?ajZ4OU9rNDhRbU9QMWFDc2JDcE1CdDdqcGM5eTZTWUtocHA0cWpaaFVLNVZq?=
 =?utf-8?B?RllCT2JkS3RCS3V3dG5HM01hZjFySm1uKzN5VUN1TjFoK3hCdlh2SGdVR1dp?=
 =?utf-8?B?VllYSXJVaE15MnJvVzAyclpWa3BHNk5NUzd4TlNpY0VjM1Q2SGxJR0w4QVFP?=
 =?utf-8?B?cXQrZU9DaHh4Qk4zWnBmTG44RzhQdnNJcHRKakZ3MVF5UkF6VFpHbjRQTUg4?=
 =?utf-8?B?V3BQU2MvZERaeTk2SEJzdXpMWFJVNEZyMlprcWtJQUM3MENlaGxvbWlsS3Jp?=
 =?utf-8?B?ODhKbHpLc0M4bXhsNE9GdUZ0REhXbGVqQ3RMN0ptaWREVyt5MEwySmxjRmlt?=
 =?utf-8?B?OFJRQTdiZFM2MFQyLzlDekpqdGZlQmJJR0Zrb2dZTGd4eDFLV1RwS01LRjMz?=
 =?utf-8?B?aXhkaFZ4SjlLYVZqOEZHRUgvOHBadUlTV1JyVWpRaFkxbkhScjlKN3RMclZ6?=
 =?utf-8?B?VUZvYWlrLzZ5Mk9YYmE1UkZLS05mcVV6ck5GQXBEUW4rSS9kZ0IwYTc3anJ2?=
 =?utf-8?B?VlNwWHUrRkVMNWJHbmtha0hTMzdHeWxjMkZDWXdKbnI3YUlzUzB5U2ZuUXN4?=
 =?utf-8?B?MDVTMXVYYTRNcWx2UENTSkFRdFREbFFTaG80Q0xZdmszZGFGRjkwa2ttWE04?=
 =?utf-8?B?TlozR2NmRWRMVHhZT2FFZGtoVnVyUFc2ckVDMW5WTUluL3YwQ0E5WS9Sci9h?=
 =?utf-8?B?bm1QelFMTEJmTUlwR1dKL0ZwNnJ3TWVxRFlZYXRReDZrU21mVmQrL3JQQnRm?=
 =?utf-8?B?M3ZHcHhuU1JJdEhIcTgyWkcxdCtaK1BYaldERlByL2ZCRmp3S3krUVJhLzBK?=
 =?utf-8?B?dnkwcEk1VFZ1WktOVmJiOFBWM0VTNXNVYUJoT0JuU0NOUFRUZGxHU0tMYTBJ?=
 =?utf-8?B?S1V4a1dKUWtoZkZicDhaYnlwaUZZTzhyR1BDVW9kNFhQL2NZVkIzdlRZTE5T?=
 =?utf-8?Q?hwz8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aba61ce-4b20-4459-8273-08dbd16aae32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 12:47:12.2266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdeKGszSynC2HaaXoIEwbx99U4eT6DW2b0BO7Z5eb759c5SwCf5czje0MvByxO8ODMtVbXyaP5fSe38mQiPkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgT2N0b2JlciAyMCwgMjAyMyA0OjQyIFBNDQo+IA0KPiBPbiAxMC8yMC8yMDIzIDU6
NDEgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiBPbiBGcmksIE9jdCAyMCwgMjAy
MyBhdCAwNTozMTowMVBNICswODAwLCBaaHUsIExpbmdzaGFuIHdyb3RlOg0KPiA+Pg0KPiA+PiBP
biAxMC8xOS8yMDIzIDY6MzMgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBa
aHUsIExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+IFNlbnQ6IFRodXJz
ZGF5LCBPY3RvYmVyIDE5LCAyMDIzIDI6NDggUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDEwLzE5LzIw
MjMgNToxNCBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+Pj4+PiBPbiBUaHUsIE9j
dCAxOSwgMjAyMyBhdCAwOToxMzoxNkFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+
Pj4+Pj4gT2gsIHJlYWxseT8gUXVpdGUgaW50ZXJlc3RpbmcsIGRvIHlvdSB3YW50IHRvIG1vdmUg
YWxsIGNvbmZpZw0KPiA+Pj4+Pj4+IHNwYWNlIGZpZWxkcyBpbiBWRiB0byBhZG1pbiB2cT8gSGF2
ZSBhIHBsYW4/DQo+ID4+Pj4+PiBOb3QgaW4gbXkgcGxhbiBmb3Igc3BlYyAxLjQgdGltZSBmcmFt
ZS4NCj4gPj4+Pj4+IEkgZG8gbm90IHdhbnQgdG8gZGl2ZXJ0IHRoZSBkaXNjdXNzaW9uLCB3b3Vs
ZCBsaWtlIHRvIGZvY3VzIG9uDQo+ID4+Pj4+PiBkZXZpY2UNCj4gPj4+PiBtaWdyYXRpb24gcGhh
c2VzLg0KPiA+Pj4+Pj4gTGV0cyBwbGVhc2UgZGlzY3VzcyBpbiBzb21lIG90aGVyIGRlZGljYXRl
ZCB0aHJlYWQuDQo+ID4+Pj4+IFBvc3NpYmx5LCBpZiB0aGVyZSdzIGEgd2F5IHRvIHNlbmQgYWRt
aW4gY29tbWFuZHMgdG8gdmYgaXRzZWxmDQo+ID4+Pj4+IHRoZW4gTGluZ3NoYW4gd2lsbCBiZSBo
YXBweT8NCj4gPj4+PiBzdGlsbCBuZWVkIHRvIHByb3ZlIHdoeSBhZG1pbiBjb21tYW5kcyBhcmUg
YmV0dGVyIHRoYW4gcmVnaXN0ZXJzLg0KPiA+Pj4gVmlydGlvIHNwZWMgZGV2ZWxvcG1lbnQgaXMg
bm90IHByb29mIGJhc2VkIGFwcHJvYWNoLiBQbGVhc2Ugc3RvcCBhc2tpbmcgZm9yDQo+IGl0Lg0K
PiA+Pj4NCj4gPj4+IEkgdHJpZWQgbXkgYmVzdCB0byBoYXZlIHRlY2huaWNhbCBhbnN3ZXIgaW4g
WzFdLg0KPiA+Pj4gSSBleHBsYWluZWQgdGhhdCByZWdpc3RlcnMgc2ltcGx5IGRvIG5vdCB3b3Jr
IGZvciBwYXNzdGhyb3VnaCBtb2RlDQo+ID4+PiAoaWYgdGhpcyBpcyB3aGF0IHlvdSBhcmUgYXNr
aW5nIHdoZW4geW91IGFyZSBhc2tpbmcgcHJvdmUgaXRzIGJldHRlcikuDQo+ID4+PiBUaGV5IGNh
biB3b3JrIGZvciBub25fcGFzc3Rocm91Z2ggbWVkaWF0ZWQgbW9kZS4NCj4gPj4+DQo+ID4+PiBB
IG1lbWJlciBkZXZpY2UgbWF5IGRvIGFkbWluIGNvbW1hbmRzIHVzaW5nIHJlZ2lzdGVycy4gTWlj
aGFlbCBhbmQgSQ0KPiBhcmUgZGlzY3Vzc2luZyBwcmVzZW50bHkgaW4gdGhlIHNhbWUgdGhyZWFk
Lg0KPiA+Pj4NCj4gPj4+IFNpbmNlIHRoZXJlIGFyZSBtdWx0aXBsZSB0aGluZ3MgdG8gYmUgZG9u
ZSBmb3IgZGV2aWNlIG1pZ3JhdGlvbiwgZGVkaWNhdGVkDQo+IHJlZ2lzdGVyIHNldCBmb3IgZWFj
aCBmdW5jdGlvbmFsaXR5IGRvIG5vdCBzY2FsZSB3ZWxsLCBoYXJkIHRvIG1haW50YWluIGFuZA0K
PiBleHRlbmQuDQo+ID4+PiBBIHJlZ2lzdGVyIGhvbGRpbmcgYSBjb21tYW5kIGNvbnRlbnQgbWFr
ZSBzZW5zZS4NCj4gPj4+DQo+ID4+PiBOb3csIHdpdGggdGhhdCwgaWYgdGhpcyBjYW4gYmUgdXNl
ZnVsIG9ubHkgZm9yIG5vbl9wYXNzdGhyb3VnaCwgSSBtYWRlDQo+IGh1bWJsZSByZXF1ZXN0IHRv
IHRyYW5zcG9ydCB0aGVtIHVzaW5nIEFRLCB0aGlzIHdheSwgeW91IGdldCBhbGwgYmVuZWZpdHMg
b2YgQVEuDQo+ID4+PiBBbmQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQsIHdoeSBBUSBjYW5ub3QgcG9z
c2libGUgb3IgaW5mZXJpb3I/DQo+ID4+Pg0KPiA+Pj4gSWYgeW91IGhhdmUgY29tbWFuZHMgbGlr
ZSBzdXNwZW5kL3Jlc3VtZSBkZXZpY2UsIHJlZ2lzdGVyIG9yIHF1ZXVlDQo+IHRyYW5zcG9ydCBz
aW1wbHkgZG9u4oCZdCB3b3JrLCBiZWNhdXNlIGl0J3Mgd3JvbmcgdG8gYmlmdXJjYXRlIHRoZSBk
ZXZpY2Ugd2l0aA0KPiBzdWNoIHdlaXJkIEFQSS4NCj4gPj4+IElmIHlvdSB3YW50IHRvIGJpZmVy
YWNhdGUgZm9yIG1lZGlhdGlvbiBzb2Z0d2FyZSwgaXQgcHJvYmFibHkgbWFrZXMgc2Vuc2UgdG8N
Cj4gb3BlcmF0ZSBhdCBlYWNoIFZRIGxldmVsLCBjb25maWcgc3BhY2UgbGV2ZWwuIFN1Y2ggYXJl
IHZlcnkgZGlmZmVyZW50IGNvbW1hbmRzDQo+IHRoYW4gcGFzc3Rocm91Z2guDQo+ID4+PiBJIHRo
aW5rIHZkcGEgaGFzIGRlbW9uc3RyYXRlZCB0aGF0IHZlcnkgd2VsbCBvbiBob3cgdG8gZG8gc3Bl
Y2lmaWMgd29yayBmb3INCj4gc3BlY2lmaWMgZGV2aWNlIHR5cGUuIFNvIHNvbWUgb2YgdGhvc2Ug
d29yayBjYW4gYmUgZG9uZSB1c2luZyBBUS4NCj4gPj4+DQo+ID4+PiBbMV0NCj4gPj4+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby1jb21tZW50Lzg3MGFjZTAyLWY5OWMtNDU4Mi05MzJm
LWJkMTAzDQo+ID4+PiAzNjJkYWU5QGludGVsLmNvbS9ULyNtMzc3NDNhYTkyNDUzNmQwMjU2ZDZi
M2I4ZTgzYTExYzc1MGYyODc5NA0KPiA+PiBXZSBoYXZlIGJlZW4gdGhyb3VnaCB5b3VyIHN0YXRl
bWVudCBmb3IgbWFueSB0aW1lcy4NCj4gPj4gVGhpcyBpcyBub3QgYWJvdXQgaG93IG1hbnkgdGlt
ZXMgeW91IHJlcGVhdGVkLCBpZiB5b3UgdGhpbmsgdGhpcyBpcw0KPiA+PiB0cnVlLCB5b3UgbmVl
ZCB0byBwcm92ZSB0aGF0IHdpdGggc29saWQgZXZpZGVuY2UuDQo+ID4+DQo+ID4+DQo+ID4+IEZv
ciBwYXNzLXRocm91Z2gsIEkgc3RpbGwgcmVjb21tZW5kIHlvdSB0byB0YWtlIGEgcmVmZXJlbmNl
IG9mDQo+ID4+IGN1cnJlbnQgdmlyaXRvLXBjaSBpbXBsZW1lbnRhdGlvbiwgaXQgd29ya3MgZm9y
IHBhc3MtdGhyb3VnaCwgcmlnaHQ/DQo+ID4gQ3VycmVudCBtaWdyYXRpb24gaW1wbGVtZW50YXRp
b24gaW4gZS5nLiBRRU1VPyBJdCBkb2VzIGJ1dCBpdCB0cmFwcw0KPiA+IGRhdGEgcGF0aCBhY2Nl
c3Nlcy4gVGhhdCwgSSB0aGluayB3ZSBjYW4gYWdyZWUsIHNob3VsZCBub3QgYmUgdGhlIG9ubHkN
Cj4gPiBvcHRpb24gdG8gbWlncmF0ZS4NCj4gT0ssIEkgYW0gZ2xhZCB3ZSBhZ3JlZSB0aGF0IGNv
bmZpZyBzcGFjZSB3b3JrIGZvciBwYXNzLXRocm91Z2gsIGhvcGUgd2UgZG9uJ3QNCj4gbmVlZCB0
byBkaXNjdXNzIHRoaXMgYW55bW9yZS4NCj4gPg0KPiA+PiBGb3Igc2NhbGUsIEkgYWxyZWFkeSB0
b2xkIHlvdSBmb3IgbWFueSB0aW1lcyB0aGF0IHRoZXkgYXJlIHBlci1kZXZpY2UNCj4gPj4gZmFj
aWxpdGllcy4gSG93IGNhbiBhIHBlci1kZXZpY2UgZmFjaWxpdHkgbm90IHNjYWxlPw0KPiA+PiB2
RFBBIHdvcmtzIGZpbmUgb24gY29uZmlnIHNwYWNlLg0KPiA+Pg0KPiA+PiBTbywgaWYgeW91IHN0
aWxsIGluc2lzdCBhZG1pbiB2cSBpcyBiZXR0ZXIgdGhhbiBjb25maWcgc3BhY2UgbGlrZSBpbg0K
PiA+PiBvdGhlciB0aHJlYWQgeW91IGhhdmUgY29uY2x1ZGVkLCB5b3UgbWF5IGltcGx5IHRoYXQg
Y29uZmlnIHNwYWNlDQo+ID4+IGludGVyZmFjZXMgc2hvdWxkIGJlIHJlLWZhY3RvcmVkIHRvIGFk
bWluIHZxLg0KPiA+IFRoZXJlIGFyZSBnb29kIGFyZ3VtZW50cyB0aGF0IHllcywgdmlydGlvIG5l
ZWRzIGEgdHJhbnNwb3J0IGZvciBjb25maWcNCj4gPiBzcGFjZSB0aGF0IGlzIERNQSBiYXNlZCBh
cyBvcHBvc2VkIHRvIG1lbW9yeSBtYXBwZWQgYmFzZWQuICBUaGlzIGlzDQo+ID4gb25lIG9mIHRo
ZSB0aGluZ3MgYWxsIHZlbmRvcnMgc2VlbSB0byBwcmVmZXIgaW4gSURQRiBzbyB2aXJ0aW8gc2hv
dWxkIGhhdmUgdGhlDQo+IG9wdGlvbi4NCj4gRG8geW91IHJlYWxseSB3YW50IHRvIHJlZmFjdG9y
IHZpcnRpby1wY2kgY29tbW9uIGNvbmZpZyBmaWVsZHMgdG8gUEYncyBhZG1pbiB2cT8NCj4gRS5n
LCBkbyB5b3UgcmVhbGx5IHdhbnQgdG8gbW92ZSBxdWV1ZV9lbmFibGUgaW4gdmlydGlvLXBjaSBj
b21tb24gY29uZmlnDQo+IGZpZWxkcyB0byBQRidzIGFkbWluIHZxPw0KPiANCk5vLiBQbGVhc2Ug
cmVhZCB0aGUgcmVzcG9uc2UgY2FyZWZ1bGx5Lg0KSSBzYWlkICdGb3Igbm9uLWJhY2t3YXJkIGNv
bXBhdGlibGUgU0lPViBkZXZpY2Ugb2YgdGhlIGZ1dHVyZSwgeWVzLCB2aXJ0aW8tcGNpIGNvbW1v
biBjb25maWcgKG5vbiBpbml0IHJlZ2lzdGVycykgc2hvdWxkIGJlIG1vdmVkIHRvIGEgdnEsIGxv
Y2F0ZWQgb24gdGhlIG1lbWJlciBkZXZpY2UgZGlyZWN0bHkuJw0KTm90aWNlIHRoZSAnbWVtYmVy
IGRldmljZSBkaXJlY3RseScuDQpOb3QgdGhlIFBGIGFkbWluIHZxLg0KDQo+IENvbmZpZyBzcGFj
ZSBpcyBjb250cm9sIHBhdGgsIERNQSBpcyBkYXRhLXBhdGgsIGxldCdzIGJldHRlciBub3QgbWl4
IHRoZW0sIHdlDQo+IG5ldmVyIGV4cGVjdCB0byB1c2UgY29uZmlnIHNwYWNlIHRvIHRyYW5zZmVy
IGRhdGEuDQo+IA0KQW5kIHRoYXQgY29udHJvbCBwYXRoIGlzIG9ubHkgZm9yIHRoZSBpbml0IHRp
bWUgY29uZmlndXJhdGlvbiBhcyBjb3JyZWN0bHkgbGlzdGVkIGluIHRoZSB2aXJ0aW8gc3BlYyBh
cywNCg0KIiBEZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZSBzaG91bGQgb25seSBiZSB1c2VkIGZv
ciBpbml0aWFsaXphdGlvbi10aW1lIHBhcmFtZXRlcnMuIi4NCg0KPiBTbyB3ZSBuZWVkIERNQSB0
byB0cmFuc2ZlciBkYXRhLCBmb3IgZXhhbXBsZSBJIHRha2UgYWR2YW50YWdlcyBvZiBkZXZpY2Ug
RE1BDQo+IHRvIGxvZ2dpbmcgZGlydHkgcGFnZXMsIFRoaXMgYWxzbyBhcHBsaWVzIHRvIGluLWZs
aWdodCBkZXNjcmlwdG9ycy4NCj4gDQpDYW4geW91IHBsZWFzZSBleHBsYWluIHZpYSB2aXJ0cXVl
dWUgY2Fubm90IGJlIHVzZWQgZm9yIERNQSBidWxrIGRhdGEgdHJhbnNmZXIgYXMgbGlzdGVkIGlu
IHZpcnRpbyBzcGVjLg0KDQoiIFRoZSBtZWNoYW5pc20gZm9yIGJ1bGsgZGF0YSB0cmFuc3BvcnQg
b24gdmlydGlvIGRldmljZXMgaXMgcHJldGVudGlvdXNseSBjYWxsZWQgYSB2aXJ0cXVldWUiDQo=

