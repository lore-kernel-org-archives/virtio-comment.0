Return-Path: <virtio-comment-return-7805-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26909CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:23:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5EB54129205
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:23:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4433798689C
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:23:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 367BC986898; Wed, 18 Oct 2023 10:23:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27450986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvwa4akOhno1HhCHbpOjcOAhOcHcD4b0y8plWUzXwt+EJnetPkaiaahFja6DEuP0NE2VT8Fp0G84ZhnCnljhW0uEHp/6RrDaKEI+7MkJtjw13/xUSAL8IeBGwTy6E5hhdwFIS/me0i0J1DT3hXKV39FhdqFLRQ2BxrmbnPI2Gw8a5X9fzX3+lUdqGgk8cyv8zoX+23Xrz737etxOrtNSIxeUXZKbpJT7+bUM5lyoB5VTKNEKwLgErKN74vP+nJWmae8bY8EKm4f0RiDYKMM1fhoglliECO8jAtjTg0BDbHSDGFVgmfeffZ5NqJT6lDKPs0c/D1Lm8SzSrXWiPopC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj1Q/VgasiQnPu/rTHjASU7ZPdKR03Z+ndMj44007ek=;
 b=YhdzJ8Yzh38/KYtBlFJoEfflpsvkGs3LxZmoGRlvPdIDjpSn92MXvj9DxzrYRntCOS+dd7QbrBnWAbFca0EUs8RhH4GuE6fFPnsW+D0qKKUSHon90tKgUeroluWlLF9LNi4JHdFoSeEEC++WzxqkTafqHXV3JAQBlLHFvpW+jDYreQz/PR0SjwslE3KmHxWXb67i2n3lfwIuoXZ/4D5xbIGKfRAr84Iwzm8S6fb/HtZwcIq/ib3Zk1KeZv9JTnHUOwUF4twkdv/3sYszuU+KGwelAeR+62xt/CXlgSK7+izVnub08dgKopeEnviXd/rEcL0eTKaLnPnlyoFEZKOrEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMA=
Date: Wed, 18 Oct 2023 10:22:57 +0000
Message-ID:
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231018055422-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW5PR12MB5651:EE_
x-ms-office365-filtering-correlation-id: e511a6c4-ac6d-4976-c2ed-08dbcfc432a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Qn1V1mpJUAuL1JJg2RnW+BrjSS5no1xSu2XoK5cJeGUVun1hwuKUrUrf4mv4CEM/fV7rRe0jrDB7ttsZ9HWP9RlvoaluOpkGgNA+gbLMDj1dB8358I9h0pWyqEetUuR0+N30kDsG8pbp1SSqNLYPLYNZMgGTk6lIsN07jZrqzNyEFKS5r8M4G7g333xXys3vR9OwSatw6+e7P3zBI+dc28GOLX35sNFMFEx3a7HeGKq8DQyQIkaY0s8EO6cE9uzXSuqw/qcuHMFCoUrV7IyPY5RsouBS3Z2YRJxWVtEnmf1RAmg+kmc5+0JedDiU3Q8jskoYsnFVIACk9coA3NtE32Nn6M/yPtogWg2NStIbrpmyUQw4XzNNU5nAVITybhtX+8/6GegbZukLC2YHjDkttip4N8EX1Kor+DLTrDnIDrE5QUSrUOUolbEDMbZHWnoc2O7Vx2eQDsvhcZH8+FkWcUIIQrIVqeH11mA5aysot21TUwTTzWgXBwjekhJlDqQzaiCI8VGHYhFoQLzQDeX4VaYeo7O2+kHcRxZre1857oNXGz8+SBNQebvb4AWn5aqhR9kKV+uMXuFlBwtl3edTyhM5BP5ZHhmCGnrr10rYZ/vCx8723teV/psTQVajrFBY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(2906002)(122000001)(33656002)(86362001)(52536014)(4326008)(8936002)(8676002)(71200400001)(38070700005)(83380400001)(26005)(38100700002)(107886003)(7696005)(6506007)(9686003)(316002)(6916009)(478600001)(5660300002)(41300700001)(54906003)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU4zbjUzTFdLbDNpN3YwL0E3Nkg1L2huWGdiMTMxdFpqSXQ0TlhvSzdCVGp1?=
 =?utf-8?B?U1FRZUZHM2F6cXRtQlFSN254U0FXRU9ZNDVjU1NaNXpnZkMxc2toU2VQZVor?=
 =?utf-8?B?ZU9wNlR2ckhBOGpJOUlYN3A5U1VmRFRIcHV6WHFwUm1YbGhWVUNsWmY3TGtT?=
 =?utf-8?B?VlhZV2xQZTlHVkZOV3dEamhFNW1JYkpSU2V4b2VzMjc0M1UyYXdMN2xmV0g3?=
 =?utf-8?B?UHNNSnFvM0I5S0l5TG92aUZRbzBHbEpzOXA3QStTRE9HQzVSRFltRVhQZHl2?=
 =?utf-8?B?OTAvRXFOQUhmKzg3dkRrdFJEZitnTGQ0STRoNlRoTkpqSGdwajlCaHp6elZs?=
 =?utf-8?B?QmxmaElCMkw3ZTlwL0IvcjZzK3M2cGFLOTdWYjlBbmhKZ29zL1V4cVk2YTJT?=
 =?utf-8?B?NVFKcS9OOE1kalFuNFlsUmZyd3haMHdsQjdTdEVmaDl2djF0N0h4TXkyYnJP?=
 =?utf-8?B?UkxUcThUTWVZV09DVVQvL1ZBdXZRcndYUkhHWEZjWkM5RGJtcUdJd2VHU0tk?=
 =?utf-8?B?UWtqeEVQMmozbDQwQlhSbmhMemkrODJDZ2Y1WWRwbVVaaElSYnRHWDJXMW1L?=
 =?utf-8?B?dHlnaU5acFBBREVWa20rMGJMTTlNUy8wTi95anBrRWZ3c0VyaFFyRkN2Nmxx?=
 =?utf-8?B?TktzQWkrczQ4Ny9oK3V4QTh4b1hhTTF3SVd4Rmh0ek1WS1hhenpKamx6dWpD?=
 =?utf-8?B?a3FRNTYwS2ZqaTFYamxwU2doWWNFTExUTFZKejZ3bElZN29Ray8rVnpvN1lC?=
 =?utf-8?B?MjJCRVN5MjVsREZOMjBPZkNodzNrakw1d1RSWkdhNHRqZnVtOHcyc3poaVZZ?=
 =?utf-8?B?L2RJWk42Uy8wODJlRnZDa01NMFNXZ1lkTE10YS9lTmxKYko2STJ1TU5DZzgv?=
 =?utf-8?B?bVdrdHBsdG82MlVuSTVCWjZlYjYwY0VuREhxR25MN0pweTg3RlovaW9zRDJx?=
 =?utf-8?B?M2lxSE5sSC85QVVkNnpRR2RDb283YlpNMkpSQzJNUDVRcVFuSGRaRktOdnlk?=
 =?utf-8?B?ZG1SdHFaWEo5NkFTWTVvWkpqQXZCYzZvSHh5QTRsQi9YSENWZ0NOYW5uVE1E?=
 =?utf-8?B?Y1VsUG4wRHpMNk5nSkg4aldJU29qcHNkaUJzYUJSQ0N5aTAzZTY4MVE2dWw1?=
 =?utf-8?B?UFEwQnV3dC9hNTRBSnl3VmlpcWduSldza2xBa3hGak44RXMzOEtOaVlMTWF5?=
 =?utf-8?B?RHFTSklFd2MrZWtEVXZ5QkZCaS8xTWQxOTcySXJybzc4NFFOaE9PVjd3TXFZ?=
 =?utf-8?B?YlVVRDNORVhJVGVocWJhQU1yUWZQd1hXdzlqdVhUSDhpblhrbkNJNEpMNktY?=
 =?utf-8?B?ZFo0MHVhRzR6OEM0SFN2Yk8wUEZyMys3YTZsOVhWUXVVVGx5OFdjbW1lSVRa?=
 =?utf-8?B?b3VHSUYrbExEUWZva3ZvQmFwK012d21hcm1CRzlVem93K01lS3hPejFDVWdy?=
 =?utf-8?B?YUc2OTdlckxXcGVmelRlaVVUK1hUZlJMWDB3QXZCL1doOEJvK1QzQTNodm94?=
 =?utf-8?B?V2tIVmdjRmVDNjJ6cmN4aUtFY1Fxb0ZkUVFKYUxGNmM4K2Y1czJFWnNsUFhI?=
 =?utf-8?B?cExVaGVXT1oyMUdpanFlS0NiSGV0YjRObWlZMU5uWStSUHp1aFVFTmNsbDF6?=
 =?utf-8?B?dFpPS2NXMGxRUDlmb2svSDhCTksxUnZBVzY5bFRrWWhUVzFkanVWUWQ2eHQ2?=
 =?utf-8?B?WVRTNVdJWUFSeW9jWHN0cE9JVUY2Nzluc2VRVEh3aXd2M2tiQ1JOditZN3RG?=
 =?utf-8?B?VEl5S2NXWXZsaHVOKzZDdUJqMXZYbzU5U3B1YThjYjFwT1YrU3lRbHdkYy9o?=
 =?utf-8?B?ckxXMmtYK1lPNUpWcDF3ZTU2NXczZWM2aVkyQ1UzUGlJemx0RXdoYURDUUZw?=
 =?utf-8?B?YldtaXlOZ0FzRnRIajRYcTBHWk5Vb0ZtcnNmMnEzSlRPSE1qZlZVN2ptNjRZ?=
 =?utf-8?B?Y0VQZnNCWTJPbitHVlBKcVNIaDRmUDdJZUJkOWtvTzh6bnkvRUVhODNwL21U?=
 =?utf-8?B?SFNVdWphUlNiaU5peERjUENuSkEwM1ZzTWZaMWh4NXRnZUl2UTZITFk4MHhZ?=
 =?utf-8?B?VjBhVGtVa1JoQUlSenZUYjVMYzhaRGRaWkptQjhndTFLU0lHRWdzSFJoaUEr?=
 =?utf-8?Q?BDh8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e511a6c4-ac6d-4976-c2ed-08dbcfc432a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:22:57.2970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7fqR7gBpjboMr6sJ0u77P86yRumVvDZhOVXAD8ulS7ByvxMpPrG7jz+xUED9GXNa45dC2jQfQZZYmtW8PQ1yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgT2N0b2JlciAxOCwgMjAyMyAzOjI2IFBNDQoNCj4gRm9yIGNvbXBsZXRlbmVzcywg
YW5kIHRvIHNob3J0ZW4gdGhlIHRocmVhZCwgY2FuIHlvdSBwbGVhc2UgbGlzdCBrbm93bg0KPiBp
c3N1ZXMvdXNlIGNhc2VzIHRoYXQgYXJlIGFkZHJlc3NlZCBieSB0aGUgc3RhdHVzIGJpdCBpbnRl
cmZhY2UgYW5kIGhvdyB5b3UgcGxhbg0KPiBmb3IgdGhlbSB0byBiZSBhZGRyZXNzZWQ/DQoNCkkg
d2lsbCBhdm9pZCBsaXN0aW5nIGtub3duIGlzc3VlcyBmb3IgYSBtb21lbnQgZm9yIHN0YXR1cyBi
aXQgaW4gdGhpcyBlbWFpbC4NCg0KU3RhdHVzIGJpdCBpbnRlcmZhY2UgaGVscHMgaW4gZm9sbG93
aW5nIGdvb2Qgd2F5cy4NCjEuIHN1c3BlbmQvcmVzdW1lIHRoZSBkZXZpY2UgZnVsbHkgYnkgdGhl
IGd1ZXN0IGJ5IG5lZ290aWF0aW5nIHRoZSBuZXcgZmVhdHVyZS4NClRoaXMgY2FuIGJlIHVzZWZ1
bCBpbiB0aGUgZ3Vlc3QtY29udHJvbGxlZCBQTSBmbG93cyBvZiBzdXNwZW5kL3Jlc3VtZS4NCkkg
c3RpbGwgdGhpbmsgZm9yIHRoaXMsIG9ubHkgZmVhdHVyZSBiaXQgaXMgbmVjZXNzYXJ5LCBhbmQg
ZGV2aWNlX3N0YXR1cyBtb2RpZmljYXRpb24gaXMgbm90IG5lZWRlZC4NCkQwLT5EMyBhbmQgRDMt
PkQwIHRyYW5zaXRpb24gb2YgdGhlIHBjaSBjYW4gc3VzcGVuZCBhbmQgcmVzdW1lIHRoZSBkZXZp
Y2Ugd2hpY2ggY2FuIHByZXNlcnZlIHRoZSBsYXN0IGRldmljZV9zdGF0dXMgdmFsdWUgYmVmb3Jl
IGVudGVyaW5nIEQzLg0KKExpa2UgcHJlc2VydmluZyBhbGwgcmVzdCBvZiB0aGUgZmllbGRzIG9m
IGNvbW1vbiBhbmQgb3RoZXIgZGV2aWNlIGNvbmZpZykuDQpUaGlzIGlzIG9ydGhvZ29uYWwgYW5k
IG5lZWRlZCByZWdhcmRsZXNzIG9mIGRldmljZSBtaWdyYXRpb24uDQoNCjIuIElmIG9uZSBkb2Vz
IG5vdCB3YW50IHRvIHBhc3N0aHJvdWdoIGEgbWVtYmVyIGRldmljZSwgYnV0IGJ1aWxkIGEgbWVk
aWF0aW9uLWJhc2VkIGRldmljZSBvbiB0b3Agb2YgZXhpc3RpbmcgdmlydGlvIGRldmljZSwNCkl0
IGNhbiBiZSB1c2VmdWwgd2l0aCBtZWRpYXRpbmcgc29mdHdhcmUuDQpIZXJlIHRoZSBtZWRpYXRp
bmcgc29mdHdhcmUgaGFzIGFtcGxlIGR1cGxpY2F0ZWQga25vd2xlZGdlIG9mIHdoYXQgdGhlIG1l
bWJlciBkZXZpY2UgYWxyZWFkeSBoYXMuDQpUaGlzIGNhbiBmdWxmaWwgdGhlIG5lc3RlZCByZXF1
aXJlbWVudCBkaWZmZXJlbnRseSBwcm92aWRlZCBhIHBsYXRmb3JtIHN1cHBvcnQgaXQuDQooUEFT
SUQgbGltaXRhdGlvbiB3aWxsIGJlIHByYWN0aWNhbCBibG9ja2VyIGhlcmUpLg0KDQpIb3cgdG8g
SSBwbGFuIHRvIGFkZHJlc3MgYWJvdmUgdHdvPw0KYS4gIzEgdG8gYmUgYWRkcmVzc2VkIGJ5IGhh
dmluZyB0aGUgX0ZfUE0gYml0LCB3aGVuIHRoZSBiaXQgaXMgbmVnb3RpYXRlZCBQQ0kgUE0gZHJp
dmVzIHRoZSBzdGF0ZS4NClRoaXMgd2lsbCB3b3JrIG9ydGhvZ29uYWwgdG8gVk1NIHNpZGUgbWln
cmF0aW9uIGFuZCB3aWxsIGNvLWV4aXN0IHdpdGggVk1NIGJhc2VkIGRldmljZSBtaWdyYXRpb24u
DQoNCmIuIG5lc3RlZCB1c2UgY2FzZToNCkwwIFZNTSBtYXBzIGEgVkYgdG8gTDEgZ3Vlc3QgYXMg
UEYgd2l0aCBlbXVsYXRlZCBTUi1JT1YgY2FwYWJpbGl0eS4NCkwxIGd1ZXN0IHRvIGVuYWJsZSBT
Ui1JT1YgYW5kIG1hcHBpbmcgdGhlIFZGIHRvIEwyIGd1ZXN0Lg0KQ29uc3VsdGluZyBpbmR1c3Ry
eSBlY29zeXN0ZW0gdG8gc3VwcG9ydCBuZXN0ZWQgb3V0c2lkZSBvZiB2aXJ0aW8uDQo=

