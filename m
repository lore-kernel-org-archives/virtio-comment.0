Return-Path: <virtio-comment-return-8204-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD007C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 20D8D2AC57
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EAF5698672D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:52:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D1F7998671A; Mon,  6 Nov 2023 10:52:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1C6A98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhWJWbU0XTvdjS/ATIewY1mE6fCXAaMEbxJ4N4bcortl/p1CpUZA9xulq90ZLX+RMoKnBuGs0BrfiuyCVNq9rCmldC83lzSOGYkTUoDSPtKsnpx07xbWtNw5VEFbCPnAcvq8hPDQxY0bP173YIJrArEfrH/QXjCgOjP609XcWtEPuyC+Fk9s1RyLtsF8OTifnLv8giXFJs1QH/uwzTwE7C85kOLLTaAlTBBbTkx+tvoYEzp44VKkmOGPFgAMKayk/n2Xn+xisCJwGQ7hUbO6D9PKZdNlFMJxJ85jcp7BGQ33cFOiE6nTyMGrtu7LEWC4cjGSSNCaZK4xWO8QTAjG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ3IcT5P04xt0JHkGyOUJnAyJWtMiOfCrpix5hkU9ZY=;
 b=kqh940tYaNwY6RFfGUnzgy6MMd2MAV90mebpicVytm+HDtyJBVCaqf2/b18ugzyZyDKeGVSNwfHGrNlLaTWQL1GTC5rPm6mmft8UHyJO3X937hiKG/Dmcd03b9xgUXFHX93bFZ+wjkkxiBPcLhjnQw+d2kFpiw7jwC5KVScOCw9setnk97IzkEJ2qvaWKfStd5C7h6bscRQxjPT9q4Dh1nJ/89ieTUk4X/DIyg5kwFyk8k5NTMOmCNpsXlHzs4ObNFrAvmn4oIukFtAip8pMlT+WSIoKR4dCRh3ZXr3RhpCIbKRtFXONjZPSdXZpmzeXZIJu2nRr/86SSgJX4MOT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND
 bit in device status
Thread-Index:
 AQHaDkFjjjC0DC7RqE21KFAcdDb+trBob5HQgAA/agCAAA+P0IAD59oAgAAJz5CAAFh+AIAACRHw
Date: Mon, 6 Nov 2023 10:52:38 +0000
Message-ID:
 <PH0PR12MB54810A60FD26411387DBC7D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
 <PH0PR12MB5481F05E5A952E9A43B96F73DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
 <PH0PR12MB5481CD22F4AFF3DFA7F53B91DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <850caea9-f7dc-4dee-ae00-936766287ba3@intel.com>
In-Reply-To: <850caea9-f7dc-4dee-ae00-936766287ba3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB5618:EE_
x-ms-office365-filtering-correlation-id: 75b4e9d7-bd34-42aa-edfa-08dbdeb67e24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 i+fmKlex4G+H8Q7sGRicNAUcndN46+YLGgT+QVHFzldQiT28T2MNBz9yG74ErPdra2c2TDEAcTg1mJYS5yc/qeR1L4ejeEJNIjkdnIIUec/7NdnBSvNQSkvDeO8ChQJoSXq+ACSiZNO4MqeIp+CaxWA2/lbly7d+sw4PH/7YUeMBfCiRuQaKq0y9l6zvmqhviVWZQcZTAQ38KnTag1iuX56gx8cKDwK5fmqKoMet2j4sf16WnQ5PlPVkH+D69by6xQmhg0RGMEsDKJ8g8VbyQ8f27J6uZkII5DkBzlMr+9RFJHcRG9fuBv3hwsRkuKSND6LINFFBJviv3QSEnZJb3CEtCGYCJ8qMVg2YsxC+g+ScIUnAqb+jxxYhnMr3QEcSgmzdMEG3y7Vjr/VdJDXZ/htadr3CVGNx85hKE543z320jLL4MlxxOIlqZl30BH8t7V4Y3PlYVkRqNQ5kl64Vbeh8vToe/RithOirLVVfnAroeHVHAn0WMo7Ujhj+pLvTgTCmJVEkBQwEgbCbpqIKL8VT7pkuEU2n/9dC/dQslaSxqwQcEiAOdmChvlnd4khoAbl976p2XM770ssJ7ijxPlziXu70FG5SK/s1iMkYOYF9zGPUZk0pWU3bfEJ7sFTreEA2jnLwwZxGcM4GsDz0H7eRTfuTaaayHs7wZFJblI0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(33656002)(41300700001)(4326008)(8676002)(8936002)(52536014)(86362001)(15650500001)(5660300002)(38070700009)(38100700002)(55016003)(478600001)(966005)(71200400001)(9686003)(53546011)(6506007)(7696005)(83380400001)(76116006)(66556008)(66446008)(66476007)(66946007)(26005)(110136005)(122000001)(64756008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGh0Sy9maFYrdERyeGdSYThhMVREM25HNVpUMHZrNnNmWnRiVzBtUUVJUmFZ?=
 =?utf-8?B?a1p3N2R6K0tqeHNsK3JCcjdVRVpiVTdudkRTaHVvMkNkNHF0alBLOUZEdjAy?=
 =?utf-8?B?RGtEVTh5R1BpaGptNEcwMFV3dkEzYk1SL0JuTzczU2tReFBoNXhmV1lYNUpy?=
 =?utf-8?B?N1FFQ1hkbkQ3dzkwb1hTZVc1OER3eEltdndFTnFsYWJlUURFNDExYngwdzVu?=
 =?utf-8?B?aU9FYTVTY1dUWHJENHIva3UySk1IT2VWb3BsTkhyUGpiV0kxVUFZcXdlQ2VW?=
 =?utf-8?B?SFN6OWV0NzBqM0ZucHhZWDcxOGNtTmJXVm1CdFFmV0hCNW1RenM2N3VOQ09x?=
 =?utf-8?B?WkZva253RXZpUGFZQUxOQzUvOEdBSkdsMEk0cWdZeUFsV2NybGgzNExMNlVp?=
 =?utf-8?B?ODI4VDZEZDM0OUh0Q0laSGdoVEFSM2JyOUhnblA5Y1pIKzZnWEk5Ynp6MWdT?=
 =?utf-8?B?cUNEYzM3RXQ2dlU1UndWVXpmZlZON0UvNHpCVTVWOVNzWVFtTHdEOFUzVDRz?=
 =?utf-8?B?aGZZK0JtNEZmb0pySXVwaktpNEZaMC9MNVlrZ1BNVUo4ZTdOT2ZyaVpuMGJk?=
 =?utf-8?B?ZWZuRU9FRzI3WDl0dDExRFB6bTZmdlBqSEtXb3J6ektIRVNld2RQaHkwVnEw?=
 =?utf-8?B?clI3SnJQZUFMMVFHblVlRmFqYXJNY3l0RWxHTDlxTGVqcVFraDdpSU9INHhk?=
 =?utf-8?B?ODF5TWNLa2NneTBZakZZeW1YUHJ0NGpZdE1QM0FORktZT25VQ3ZOY0pvdm5Q?=
 =?utf-8?B?ZnJQZ0hLZDAraHJOcEFUQmpaRWdFeGRtaXZzNWF1c3pUZXh5eG9MZUVLZ3FP?=
 =?utf-8?B?Y25ZY3BOdGYyZkpodElNN243Z0xZdVJKb0YxclRZdW9rcVdab1VqU3FBWFpJ?=
 =?utf-8?B?NTlIcTdHR1ZiN1hCVFdkaWZFQ1M3eWo5dGd5MThVN3N1MXVUOGRtdlk4b0hp?=
 =?utf-8?B?Q1J6S0xsclpGaGtpWVAyMGJWMjlRTW9RZlVHcUdUZ3NsQi9RcWtOenFQSUNk?=
 =?utf-8?B?WDRockNhSU9TOFg2VzdoclEvaUt5UXpRWmh5Mmp6M1dPempEU2tFbldGSSta?=
 =?utf-8?B?UDg2MEZlWFczdG9FaU9xSFdZTTVHVzZ2NzRGbE1TZEpUd1Zmemw2ZitDSWlB?=
 =?utf-8?B?cThQM3pWRnVYdkdLOElMQVJKUmRTOHZ4NzVoRFRZaTlxQk9XcmM5aXpFb1VE?=
 =?utf-8?B?MWM5UGxYb2I5a1M5UUg3Z1V5dVpXWE4rc0VzbkR6UE9ncTc1Rm9ZSHZSRFdW?=
 =?utf-8?B?ckRvbWJoUzRiY1EybG5Ub0JQYjhZZm1YOVljUWVwbG04TFJUUVlDYVRPL3ph?=
 =?utf-8?B?MndrVGdVdmkvTkdTV1VEMWxEZGswOHRmMUdTb25RNkVWZGw5eTFNM2lNRWxm?=
 =?utf-8?B?REZiSm1CUDBCNGhieTlmNW9kdElwUVpFaUlrZ091Z2huV2QzQVp4UzY0NVJX?=
 =?utf-8?B?ZkdSNGJWTXMyamkwTndMMExLN1pIU1N1NkRkc0NndHRUeitGblBybVUrUG5F?=
 =?utf-8?B?TEYwaGxNby9heG1LeDBqQlFnTEQrYVhWOWdWYUNpVEtac1RPK2hzRG9JQXNT?=
 =?utf-8?B?UXl6b3AxZzR3eUg0QU5zMTgyMzNKbTZWKzVZKzBKK3V5NENyU2hoS3RSZk5R?=
 =?utf-8?B?dTh5ZjFhV3hlMENWMjgxcGxjTnVqWlU0bmZEckFVNnVwZGp3eFFoUjgvQVgx?=
 =?utf-8?B?THE2a1JzRnFmVTRWTzNUS1JsZk9RZGthVUZGQUxVL3dnVFN6TmV3ZklBem5z?=
 =?utf-8?B?aDFtTGFvZUlSL29GQXNNL3lJajF5NUhSVDRORFJOVWw0YVNIaWgvdCtQR0pK?=
 =?utf-8?B?ZG5lYWxoWVUvMGdtay9FQnllbGxwL3FRL3BtTC90ZjM1aDJIMnhJT0UrOHVk?=
 =?utf-8?B?aUcycGZKUzZRdm1ndk96enZQUzAyVnkzNUxDMjRzbFJTVG9NR2pWSDQ0SkVL?=
 =?utf-8?B?YjlLNWdta2gvbVZ5SmhqV3hTLzgybVh5TExzbXF1NStjc1k2QkpKOVNkOWQz?=
 =?utf-8?B?OFc2dGJhd3JuNUUwUlhoN01sTC82VjdrMmswVnNYL3hrQlVBQzljQWtHV09R?=
 =?utf-8?B?Y1BqL29JRCt3bTk5Q2MzSDVaSTRjbCtxQ3ZVTlozZ2kwWjZ6SmlYUW9RZERj?=
 =?utf-8?Q?Xt8s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b4e9d7-bd34-42aa-edfa-08dbdeb67e24
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 10:52:38.4617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SEJT7d9zLOHVWy5SIl3QWbXnG44JfiQbNfmQ5mgX85YL3Jy0bIgjSV7C4IkegsUxFGMRXObU7tOIa+kkRFlvRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5618
Subject: RE: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND bit
 in device status

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyAyOjUxIFBNDQo+IA0KPiBPbiAxMS82LzIwMjMgMTI6
MDcgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA2LCAyMDIz
IDk6MDAgQU0NCj4gPj4NCj4gPj4gT24gMTEvMy8yMDIzIDExOjU0IFBNLCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNv
bT4NCj4gPj4+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgODoyNSBQTQ0KPiA+Pj4+
DQo+ID4+Pj4gT24gMTEvMy8yMDIzIDc6MzUgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+
Pj4+IEZyb206IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+Pj4+
IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA0OjA1IFBNDQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHN0YXR1cyBiaXQgaW4gdGhlIGRldmljZSBz
dGF0dXM6IFNVU1BFTkQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhpcyBTVVNQRU5EIGJpdCBjYW4g
YmUgdXNlZCBieSB0aGUgZHJpdmVyIHRvIHN1c3BlbmQgYSBkZXZpY2UsDQo+ID4+Pj4+PiBpbiBv
cmRlciB0byBzdGFiaWxpemUgdGhlIGRldmljZSBzdGF0ZXMgYW5kIHZpcnRxdWV1ZSBzdGF0ZXMu
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gSXRzIG1haW4gdXNlIGNhc2UgaXMgbGl2ZSBtaWdyYXRpb24u
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hh
bi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gPj4+Pj4gWW91IGNvbnN0YW50bHkgY29tcGxhaW5lZCB0aGF0
IHdoYXRldmVyIHdhcyBwcm9wb3NlZCB1c2luZyBhZG1pbg0KPiA+Pj4+IGNvbW1hbmRzIG1ldGhv
ZCBpbiBbMV0gbXVzdCB3b3JrIGZvciBwYXNzdGhyb3VnaCBhbmQgbm9uLXBhc3N0aHJvdWdoLg0K
PiA+Pj4+PiBBbmQgaGFsZndheSBpbiB0aGUgZGlzY3Vzc2lvbiB5b3UgcHJvcG9zZSBhIG1ldGhv
ZCBhZnRlciBsZWFybmluZw0KPiA+Pj4+PiBhbGwgdGhlDQo+ID4+Pj4gbGltaXRhdGlvbnMgb2Yg
aW4tYmFuZCwgeW91IHByb3Bvc2UgYSBzb2x1dGlvbiBvbmx5IHdvcmtzIGZvcg0KPiA+Pj4+IG5v
bi1wYXNzdGhyb3VnaCBtb2RlLg0KPiA+Pj4+PiBZb3UgYXNrZWQgc29tZW9uZSB0byBoYXZlIGNv
bXByZWhlbnNpdmUgcHJvcG9zYWwgYW5kIHdoZW4gaXQgY29tZXMNCj4gPj4+Pj4gdG8NCj4gPj4+
PiB5b3UgZm9sbG93aW5nIGl0LCB5b3UganVzdCBkb27igJl0Lg0KPiA+Pj4+IG5vdCBzdXJlIHdo
YXQgeW91IGFyZSB0YWxraW5nIGFib3V0Lg0KPiA+Pj4+PiBBbmQgaGF2ZSBtb3N0IHNoYWxsb3cg
Y29tbWl0IG1lc3NhZ2UgdG8gbm90IGV2ZW4gbWVudGlvbiBpdC4NCj4gPj4+Pj4NCj4gPj4+Pj4g
UGxlYXNlIGJlIGNvbnNpc3RlbnQgaW4gZGVzaWduIGFwcHJvYWNoLg0KPiA+Pj4+PiBBbmQgaWYg
eW91IGRvbuKAmXQgd2FudCB0byBiZSwgc3RvcCBhc2tpbmcgb3RoZXJzLg0KPiA+Pj4+IHRoaXMg
U1VTUEVORC9SRVNVTUUgZG9lc24ndCBjaGFuZ2Ugc2luY2UgdGhlIFJGQyBzZXJpZXMsIGhvdyBj
YW4gaXQNCj4gPj4+PiBub3QgYmUgaW5jb25zaXN0ZW50Pz8/DQo+ID4+Pj4+IFRoaXMgaXMgbm90
IHRoZSB3YXkgVEMgY29sbGFib3JhdGlvbiB3b3Jrcy4NCj4gPj4+Pj4gSSBwcm9iYWJseSBzaG91
bGRu4oCZdCBldmVuIGV4cGVjdCB0aGlzIGZyb20geW91Lg0KPiA+Pj4gWW91ciBwcm9wb3NhbCBk
b2VzIG5vdCBjb3ZlciBib3RoIHRoZSB1c2UgY2FzZXMgb2YgcGFzc3Rocm91Z2ggYW5kDQo+ID4+
PiBub24tDQo+ID4+IHBhc3N0aHJvdWdoLg0KPiA+Pj4gWWV0IHlvdSBrZXB0IGRlbWFuZGluZyB0
aGVtIGZvciBvdGhlcnMuDQo+ID4+PiBUaGlzIGlzIGp1c3Qgd3JvbmcuDQo+ID4+Pg0KPiA+Pj4g
SSBhbSBhd2FyZSB0aGF0IGJvdGggbW9kZWxzIGFzIHRlY2huaWNhbCBwcm9zIGFuZCBjb25zLg0K
PiA+PiBXaHkgdGhpcyBkb2Vzbid0IHdvcms/IHRoZSBkZXZpY2Ugc3RhdHVzIGJ5dGUgaGFzIGJl
ZW4gd29ya2luZyBmb3INCj4gPj4gbWFueSB5ZWFycywgYW5kIGRvIHlvdSBrbm93IHdoZW4gZ3Vl
c3QgZnJlZXplLCB0aGUgaHlwZXJ2aXNvciBvd25zIHRoZQ0KPiBkZXZpY2U/Pz8/DQo+ID4gV2hl
biB0aGUgZ3Vlc3QgaXMgbm90IGZyb3plbiBhbmQgZHVyaW5nIHRoZSBwcmUtY29weSBwaGFzZSwg
aHlwZXJ2aXNvciBuZWVkcw0KPiB0byBhY2Nlc3MgdGhlIGRldmljZSAoY29udGV4dCwgZGlydHkg
cGFnZXMpLg0KPiA+IEhvdyBkb2VzIGl0IHdvcmsgaWYgdGhlIGd1ZXN0IG93bnMgdGhlIGRldmlj
ZT8NCj4gSGF2ZSB5b3Ugc2VlbiBQQVNJRCB0aGVyZT8NClBBU0lEIGRvZXMgbm90IGhlbHAgYmVj
YXVzZSBhcyBleHBsYWluZWQgdmlydGlvIGNvbW1vbiBjb25maWcgc3BhY2UgYW5kIGRldmljZSBz
cGVjaWZpYyBjb25maWcgc3BhY2UgaXMgb3duZWQgYnkgdGhlIGd1ZXN0IGRyaXZlci4NCg0KU2Vj
b25kbHkgUEFTSUQgc3BhY2UgaXMgYWxzbyBvd25lZCBieSB0aGUgZ3Vlc3QgZHJpdmVyLg0KDQo+
ID4NCj4gPj4+Pj4gWzFdDQo+ID4+Pj4+IGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJj
aGl2ZXMvdmlydGlvLWNvbW1lbnQvMjAyMzEwL21zZzAwNA0KPiA+Pj4+PiA3Mg0KPiA+Pj4+PiAu
aA0KPiA+Pj4+PiB0bWwNCj4gPj4+PiBQbGVhc2UgZG9uJ3QgYmUgc28gZW1vdGlvbmFsIGFuZCBw
bGVhc2UgYmUgcHJvZmVzc2lvbmFsLg0KPiA+Pj4+DQo+ID4+Pj4gV2h5IHRoaXMgc29sdXRpb24g
Y2FuIG5vdCB3b3JrIGZvciBwYXNzLXRocm91Z2g/IERvIHlvdSBrbm93IHRoZQ0KPiA+Pj4+IGRl
dmljZSBvd25lcnNoaXAgd2lsbCBiZSB0cmFuc2ZlcnJlZCB0byB0aGUgaHlwZXJ2aXNvciB3aGVu
IGd1ZXN0DQo+ID4+Pj4gc3VzcGVuZGVkIGluIGxpdmUgbWlncmF0aW9uPw0KPiA+Pj4gSSBleHBs
YWluZWQgNSByZWFzb25zIHdoeSBpdCBkb2VzIG5vdCB3b3JrIGluIHByZXZpb3VzIHJlcGx5Lg0K
PiA+Pj4NCj4gPj4+IEFzIHRoZSB3b3JkIGluZGljYXRlcyAibGl2ZSBtaWdyYXRpb24iLCB0aGUg
aHlwZXJ2aXNvciBuZWVkcyB0bw0KPiA+Pj4gYWNjZXNzIHRoZQ0KPiA+PiBkZXZpY2Ugd2hlbiBp
dCBpcyAibGl2ZSIgKG5vdCBqdXN0IGFmdGVyKS4NCj4gPj4+IEhlbmNlLCBwYXNzdGhyb3VnaCBt
b2RlIG11c3QgYmUgYWJsZSB0byBjYXB0dXJlIHRoZSBzdGF0ZSBvZiB0aGUNCj4gPj4+IGRldmlj
ZSBhbmQNCj4gPj4gZGlydHkgcGFnZXMgZGF0YWJhc2Ugd2hlbiBpdHMgbGl2ZS4NCj4gPj4+IChh
bmQgYWZ0ZXIgdGhlIHNvdXJjZSBpcyBzdXNwZW5kZWQpLg0KPiA+PiBObywgdGhlIGh5cGVydmlz
b3Igc2hvdWxkIG9ubHkgY29sbGVjdCBkaXJ0eSBwYWdlcyB3aGVuIHRoZSBkZXZpY2UgYWxpdmUu
DQo+ID4gSXQgaXMgbmVlZGVkIGR1cmluZyBib3RoIHRoZSB0aW1lcy4NCj4gPiBXaGVuIHRoZSBk
ZXZpY2UgYW5kIGd1ZXN0IGlzIGxpdmUgZHVyaW5nIHByZS1jb3B5IHBoYXNlLg0KPiA+IEFuZCBh
ZnRlciB0aGUgZGV2aWNlIGlzIGZyb3plbiwgdG8gZ2V0IHRoZSBmaW5hbCByb3VuZCBvZiBwYWdl
cy4NCj4gV2l0aCBQQVNJRCwgZGlydHkgcGFnZSB0cmFja2luZyBmYWNpbGl0eSBjYW4gYmUgaXNv
bGF0ZWQgZnJvbSB0aGUgZ3Vlc3QsIG1lYW5zDQo+IHRoZSBoeXBlcnZpc29yIG93bnMgdGhpcyBm
YWNpbGl0eS4gU28gdGhlIGh5cGVydmlzb3IgY2FuIGNvbGxlY3QgdGhlIGRpcnR5IHBhZ2VzLg0K
PiANCj4gV2hlbiB0aGUgZGV2aWNlIHN1c3BlbmRlZCwgaXQgc2hvdWxkIHJlcG9ydCB0aGUgbGFz
dCByb3VuZCBvZiBkaXJ0eSBwYWdlcw0KPiB0aHJvdWdoIGRpcnR5IHBhZ2UgdHJhY2tpbmcgZmFj
aWxpdHkgYXMgZXhwZWN0ZWQuDQo+IA0KPiBUaGlzIGNhbiB3b3JrLCByaWdodD8NClVuZm9ydHVu
YXRlbHkgbm8sIGFzIG5vbiBhdG9taWMgYml0bWFwIGNhbm5vdCByZXNpZGUgaW4gdGhlIGhvc3Qg
bWVtb3J5LA0KQW5kIHdoYXRldmVyIGlzIGluIHRoZSBkZXZpY2UgZ2V0cyByZXNldCBvbiBkZXZp
Y2UgcmVzZXQgYW5kL29yIEZMUi4gU28gdGhlIGRpcnR5IG1hcCBkZXRhaWwgaXMgbG9zdC4NClNp
bWlsYXJseSB0aGUgZGV2aWNlIGNvbnRleHQgaXMgYWxzbyBsb3N0IG9uIHRoZXNlIHR3byBldmVu
dHMgdHJpZ2dlcmVkIGJ5IGd1ZXN0Lg0KDQo+ID4NCj4gPj4gQXMgeW91IGNhbiBzZWUsIHRoZSBk
aXJ0eSBwYWdlIHRyYWNraW5nIGZhY2lsaXR5IGhhcyBhIFBBU0lEIGZvcg0KPiA+PiBpc29sYXRp
b24uIEJ1dCBzdGlsbCwgdGhlIHF1ZXN0aW9uIGlzLCB3ZSBzaG91bGQgYmV0dGVyIHVzZSBwbGF0
Zm9ybQ0KPiA+PiBkaXJ0eSBwYWdlIHRyYWNraW5nDQo+ID4+DQo+ID4gTm90aGluZyB0byBkbyB3
aXRoIFBBU0lELCBhcyBQQVNJRCBpcyBvd25lZCBieSB0aGUgZ3Vlc3QuDQo+IEl0IGxvb2tzIHlv
dSBkb24ndCBrbm93IGhvdyBQQVNJRCB3b3JrLg0KDQo+IA0KPiBIb3N0IGNhbiBzZXR1cCBQQVNJ
RCB0byBpc29sYXRlIHNvbWUgZmFjaWxpdGllcywgcmlnaHQ/DQpUaGVyZSBhcmUgZmV3IGxpbWl0
YXRpb25zIHdpdGggUEFTSUQuDQphLiBBbGwgcGxhdGZvcm1zIGRvIG5vdCBoYXZlIFBBU0lEIGFu
ZCANCmIuIEkgZXhwbGFpbmVkIGFib3ZlIFBBU0lEIGRvIG5vdCB3b3JrIGFsd2F5cyBhcyBQQVNJ
RCBvbmx5IGJpZnVyY2F0ZXMgRE1BIG5vdCB0aGUgZGV2aWNlIF9mdW5jdGlvbmFsaXR5Xy4NCmMu
IFBBU0lEIHRvIGJlIGF2YWlsYWJsZSB0byBndWVzdCBhc19pcyB3aGF0IGlzIHByZXNlbnQgb24g
dGhlIGRldmljZQ0KDQo+ID4NCj4gPj4gVGhlbiBzdXNwZW5kIHRoZSBkZXZpY2UgYWZ0ZXIgZ3Vl
c3QgZnJlZXplLCB0byBzdGFiaWxpemUgdGhlIGRldmljZQ0KPiA+PiBzdGF0dXMsIHRoZW4gcmVh
ZCB0aGUgc3RhdHVzLg0KPiA+Pg0KPiA+PiBIb3cgY2FuIHlvdSBzYXkgdGhpcyBkb2VzIG5vdCB3
b3JrPz8/DQo+ID4gSSBleHBsYWluZWQgYWJvdmUuDQo+IHNlZSBhYm92ZQ0KDQo=

