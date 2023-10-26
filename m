Return-Path: <virtio-comment-return-7964-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAFBC0032E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:31:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2A922B07C
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:31:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5623986A42
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 03:31:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B5053986A3E; Thu, 26 Oct 2023 03:31:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 998A5986A3F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 03:31:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8lFWrsMTIzJxhHHPV+rE3CSO+xTb9p9oBby1b+mORbCsC1AQKnPlcfu6no4ADcpQg4cuHj8Xi5x5Qa9H+xMlso4oTO4CC9H4GnyyfINs215roW1QmL2Ek6HknyF/2bbFejICNSJOBGtHTTrH0vAz4Xs/IhFvOyePlhRHrI+v6npDFaasXv7vtc8v0PZBJcp4f44nAD5h/9i1p65qK8AUJ8JsST88agD5dhFPqcHucxsrrjfmVgG09MTTsMJrRR1iASI8Hi33BQusbIzPShnfJV+ohNFGJDUoTq1MhCFmEHYYbN/sup0jPY4qvYddDuwi6o7Z93In8s1aS2hQkV+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CCibGLC04BgPsz9kBDDBPBelfeylfQdGULHU3XSUf8=;
 b=htnbBQoIlF52RsrJihxPZgc/ZebcC7LrAd2oXCPQo52dM0tYQitP2g9MsgO1EyqHd8aDgt10Icmh43GHL9mKkqkl4qo56YuhZhvMa1khh8uIdj2QDNb64z+dWDQ3mLArF4w6ND7mG7kFAFsKoMI/xhAGla18u+Qz3wVErybD5nVMTUACXvD8AzkOS5ovazo+zd9fnpfjnfjO9Wn2LzrTl34dpcU4toiojri4Hv3mDPX9CHEGLaqssEK09gvcqzaC3oL6HRi08j8BrSz3Fb1KgAoP/KfngrxS9aqKIWMJCBoWs7siahpVBGn0EFIl7ENxDgICH1rE+B1tPwo9PAJbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TA=
Date: Thu, 26 Oct 2023 03:30:56 +0000
Message-ID:
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231025062207-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|LV2PR12MB5894:EE_
x-ms-office365-filtering-correlation-id: 3875b361-4acb-4040-8720-08dbd5d3f75f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YGhetgDK1v2a1Gb2oZnWd5b5wepFV6iF9tj3In164Qz3C/8I2MLvgM9n/+fYXLdsLjHNOuSDCirWAHj4lap/MPltIWr6XDhUV3LYc9aLKAInvzKZsNGuVwme68oCouHg9avMG/trsI5TvLn87orqdsVqjHPVktJMNzO6AFfxe9CuIsvOWYZaPriBo4Q1VW9ZYYeFVatpE3pGuUWKQv7AOPEAbcvfI0XMZ9AiLK4pfG5rwb03l3FCPIfertrrVk5kP9W6q/9hZU4xXl7iSsGTSadZ6joesgVUgL+7tH2DBqLpPQdIzWE7pv6E4qjeW71+p5GkGbh2oov8wacQfB2fTUtWgw+HkeGYFp3YF7of3V8BY6fPYFH1ZMM0KFzedmsrvM6m9/23ywnJ6cF+RJZQTb/KrmgOVR6iW0s2PCwhfbR9UEvECvkIK24SjWWh3hsJEiNceqR6f3vJ3jKUmb9W1axNfswHk7Sy3nMfMg5BE5FAnDy9pMeSJVIIjp6sLcHkPeKemNePnUjMy+WMKhla/oTIi4yfqfPdDnPvKQcqELV1S5pN3lgaI+jIW0Glm0LlEP4XCCf4Ivqq2rL1DIby/3g6M0n/giwKO3mO8RGPgUq61U6Whb9GfiLBZEsfRk48sak6JTcUC34GZLGq4ioIp0OlO4qaKs0/Lc2Fl94067MbIwcEfvkYsUZjl/RdrFW0JUUPv71v6uGrwAciMnvbJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(6506007)(55016003)(66556008)(478600001)(66946007)(6916009)(66446008)(71200400001)(966005)(66476007)(76116006)(64756008)(54906003)(38070700009)(122000001)(38100700002)(7696005)(8676002)(53546011)(107886003)(2906002)(83380400001)(5660300002)(33656002)(86362001)(316002)(41300700001)(9686003)(52536014)(4326008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXFCcGlrclBkVDhTeHBPUlBIRDloUm5RMVoyWGEvR05Fa3l2WDM5TUxHRHpq?=
 =?utf-8?B?bXdkR3VpMERPNHhrZDFBbUpPQkFYS1pXYzhwUlNXVnNPMVd1OUo1eFdzVThC?=
 =?utf-8?B?NDVsdWtRUFJyT1VQMHlERVFEQ3B1WTdxNFJZUHBmc0QvZlNPNVdpS1lBUFlM?=
 =?utf-8?B?bjlHOGRySFZxa1Q3NDlqbGowQjNFWk0xOWlBR0JJZStCTmx0Ujh3VzJOSnF1?=
 =?utf-8?B?ZVJSN0RITFUvbGdyWmJKOWQrcXdDZGp0di95ZW5LaUEvUFRxTTRadlpwNzI5?=
 =?utf-8?B?R0dQbkNYRm8xSUdMQldqNmdVL2kvbFpWN1dTa0JXNW1XVFNEeDJ2d0J2Y2Vs?=
 =?utf-8?B?RExCMzh4ZDlXNzVQeHk1UnVHcmpvc0JoRG5HbWtCR0p3aFgvWFdzWHdXVXNS?=
 =?utf-8?B?c0xNY0pNZ0VacHpDcHdhWUtmSjY2a3YwenJkM3VmTjJQQWxEMEovMThrd2xW?=
 =?utf-8?B?Tm5YYlJxNUJzcTNSMDVFcnVkblZDUDNrSHE2RWlTRjY3bUhOa2ZNRFcrK2hN?=
 =?utf-8?B?YW9tUFA0MjQwbWpFWUl6OXNyaGMvRXc3ekdTempJRGphQ1ZoK2FJcnlXOGV4?=
 =?utf-8?B?VEFtTGVlc0c4cUcvdEhxZTU0d05mQk1Ia1BqZGt1RlVLQUtXTjhBbHp0eXlM?=
 =?utf-8?B?OHRIQVBNOTE2QjBLVUNnM05nTk8rYnhHaVVVNE4xWlE5NmczcWhFYVplc2Ey?=
 =?utf-8?B?TERKNzJVckNING91Z0laZnc2aVlvdTdUWlNnTVpEYXplZHgwOFF5dVNWcXFk?=
 =?utf-8?B?Q1dFNWRMRmtTWUhGWkRnT3BqZEN4d044azNVUGg1YmhqM2J5Y3crS3FwMytF?=
 =?utf-8?B?eE5OZ1l4N1RGWE5NSVdNS0pQZGhwd2UvandPcHE3dDBnSWhocUp2ZkRiSk9G?=
 =?utf-8?B?WFIxQmZoRzlEYi9Dckt0dGU5RUxSSHdUUDlISFZZNU43Ly9lUW1BRGkxaU11?=
 =?utf-8?B?NHBXZkx1RStUZnpvU0FwSHVXWDJaSlJ0a1c5cndJcExDeThxL1R5eUZCaFQz?=
 =?utf-8?B?MXdLUHpmWnJHekc3U2NndnI4NWVkQkYwU0lWNWdzVUhnbzY1Vm54RmYzamZ4?=
 =?utf-8?B?SVNMTUo4UDVVdVhxNGpBTEU4Z1M5b1A1OXlBNFA2eFRpVzhlZ0dlOWlGdEY5?=
 =?utf-8?B?SUJFN2dqc2EybTFhc3FyOHNsY3loZG92VVg4RkRlckNFRDRtN0RTMEpIeGNy?=
 =?utf-8?B?SU1PUnE4SGk5cVdtT25wZ1ZlT0dpdU0rNXU0bDFZdEdtdkl3UUNLNnUrazd1?=
 =?utf-8?B?UXA3b3NMaWZibHFLUlBTZDhWeVZiTmNGdit1U2xpblUzVTFwODlGdGZQVFJs?=
 =?utf-8?B?Ym1VNzVSMU9DQ2NwWFZZdmFlVGdqRGxtQzhic1ljcng0aWV1Y2hrZ25adG1O?=
 =?utf-8?B?cmh1RTNaWXNFYzZSK2RHWEkzTGNWLzgzckRJWHZMOFMwRjJrQVhwWFE0RkZx?=
 =?utf-8?B?N3BGWW1rakRPV0w2OTRXbmpSaEVkS2YzS1R1Qnd4ZEE4MWsxWDRjUkxyZGpz?=
 =?utf-8?B?UWI2Z2lUc01uK3oxelpoVUhIUDVrNTdkVDlBb21LcDhVamZhbEcxbS9mUytF?=
 =?utf-8?B?a1ZvKzQyUk80M2M1UVlRaGhCR0tnUUZNQkVpNkFwc29iVERNV0gwanEzUmRU?=
 =?utf-8?B?TFlmUnNaR3BiRzhJK3RmZ2V3aHZVeTVac05rUW45Y2xsdHNyZ1pLa29JQTc5?=
 =?utf-8?B?MmVTQVMxSkc4VWhYQ0pTakMwbFpOdjkyRjV6TXRKSWtsZ05kYXhCT1BoclRB?=
 =?utf-8?B?REQxTVBYTW9KUnREclJWR2kveXNzZlBzNTY3cVRNaHc1QitPSU03RjVzRzRM?=
 =?utf-8?B?SDVJbXkwTm54Rm9tTUFreURjQW93RVdiWXZ6UFY3OFFWVzVGN0Y2SnRoWVhh?=
 =?utf-8?B?UVYvcFNBMER4RDRnOXk1SDVSTFhWUnU5aTVpVWhHMlJ2R0Naa0I5b0wzSytP?=
 =?utf-8?B?VlNJV2NaUlJtKy9SR1EzckhHZE9zU2tGcGNNMHdUbnVRQzBodXN5Q1haSGk3?=
 =?utf-8?B?c0xqenZhT1pwT2dPc1ViRkVVTUQvWGREdjA0STYyVVRwckN1TnN0VVR4ODNG?=
 =?utf-8?B?eWNmUFBmNVBhajd1YkFUdEt3aGdHNVNwM045RThUUmlBSWs5YTBudUd4N2xq?=
 =?utf-8?Q?ikXI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3875b361-4acb-4040-8720-08dbd5d3f75f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 03:30:56.8055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbpJQAu+d86+J8zstz0hj7iRmoaS3Mw1jmnIYTb9x1CfYwOn6Ty3m8mwvarXedblJbC4oYWTQymkdIXxRfXKhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBNaWNoYWVsIFMuIFRz
aXJraW4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDI1LCAyMDIzIDM6NTQgUE0NCj4gDQo+
IE9uIFdlZCwgT2N0IDI1LCAyMDIzIGF0IDA5OjU1OjIwQU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3
cm90ZToNCj4gPiBIaSBDb3JuZWxpYSwNCj4gPg0KPiA+ID4gRnJvbTogUGFyYXYgUGFuZGl0IDxw
YXJhdkBudmlkaWEuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDg6
NTIgUE0NCj4gPiA+IFRvOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47IE1pY2hh
ZWwgUy4gVHNpcmtpbg0KPiA+ID4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4gQ2M6IHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnOyBoZW5ncWlAbGludXguYWxpYmFiYS5jb207DQo+
ID4gPiB4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbTsgU2hhaGFmIFNodWxlciA8c2hhaGFmc0Bu
dmlkaWEuY29tPg0KPiA+ID4gU3ViamVjdDogUkU6IFt2aXJ0aW8tY29tbWVudF0gUkU6IFtQQVRD
SCB2MyAyLzJdIGNvbnRlbnQ6IFN1cHBvcnQNCj4gPiA+IGVuYWJsaW5nIHZpcnRxdWV1ZSBhZnRl
ciBEUklWRVJfT0sgc3RhZ2UNCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiBGcm9tOiB2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+ID4gPiA8dmlydGlvLWNvbW1lbnRAbGlzdHMu
b2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgQ29ybmVsaWEgSHVjaw0KPiA+ID4gPiBTZW50
OiBNb25kYXksIE9jdG9iZXIgMjMsIDIwMjMgODozMSBQTQ0KPiA+ID4gPg0KPiA+ID4gPiBPbiBN
b24sIE9jdCAyMyAyMDIzLCBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0K
PiA+ID4gPg0KPiA+ID4gPiA+PiBGcm9tOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNv
bT4NCj4gPiA+ID4gPj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDc6NTggUE0NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+PiBPbiBNb24sIE9jdCAyMyAyMDIzLCBQYXJhdiBQYW5kaXQgPHBh
cmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiA+PiBGcm9tOiB2
aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiA+ID4gPiA+PiA+PiA8dmlydGlv
LWNvbW1lbnRAbGlzdHMub2FzaXMtIG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgQ29ybmVsaWENCj4g
PiA+ID4gPj4gPj4gSHVjaw0KPiA+ID4gPiA+PiA+PiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMs
IDIwMjMgNzoyNyBQTQ0KPiA+ID4gPiA+PiA+DQo+ID4gPiA+ID4+ID4+IFdlbGwsIHRoZXJlIGFy
ZSAgc3RpbGwgY29tbWVudHMgZnJvbSBtZSBoZXJlIHRoYXQgcG9zdC1kYXRlDQo+ID4gPiA+ID4+
ID4+IHY0IChwbGVhc2Ugd2FpdCBmb3IgYSBiaXQgYmVmb3JlIHBvc3RpbmcgYW5vdGhlciB2ZXJz
aW9uISksDQo+ID4gPiA+ID4+ID4+IHNvIEknbGwgY29udGludWUgd2FpdGluZyBmb3IgdGhlbSB0
byBiZSBhZGRyZXNzZWQgZmlyc3QuDQo+ID4gPiA+ID4+ID4gVGhlIGxhc3Qgb25lIHdhcyBbMV0u
DQo+ID4gPiA+ID4+ID4gV2hpY2ggSSByZXBsaWVkIGZldyBkYXlzIGFnbyBhdCBbMl0uDQo+ID4g
PiA+ID4+ID4NCj4gPiA+ID4gPj4gPiBbMV0NCj4gPiA+ID4gPj4gPiBodHRwczovL2xpc3RzLm9h
c2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9tDQo+ID4gPiA+ID4+
ID4gc2cwMA0KPiA+ID4gPiA+PiA+IDI0DQo+ID4gPiA+ID4+ID4gMC5oDQo+ID4gPiA+ID4+ID4g
dG1sIFsyXQ0KPiA+ID4gPiA+PiA+IGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2
ZXMvdmlydGlvLWNvbW1lbnQvMjAyMzEwL20NCj4gPiA+ID4gPj4gPiBzZzAwDQo+ID4gPiA+ID4+
ID4gMjQNCj4gPiA+ID4gPj4gPiAyLmgNCj4gPiA+ID4gPj4gPiB0bWwNCj4gPiA+ID4gPj4NCj4g
PiA+ID4gPj4gSSBzdGlsbCBoYXZlIHNvbWUgb3BlbiBxdWVzdGlvbnMgZnJvbQ0KPiA+ID4gPiA+
PiA8ODdzZjY4Y2puMC5mc2ZAcmVkaGF0LmNvbT4gKGZpcnN0IGFuZCBsYXN0IHBhcmFncmFwaC4p
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBYm92ZSBsaW5rIGlzIG5vdCBhY2Nlc3NpYmxlIHRvIG1l
LiDimLkNCj4gPiA+ID4NCj4gPiA+ID4gVGhhdCdzIG5vdCBhIGxpbmssIGJ1dCBhIG1lc3NhZ2Ug
aWQuLi4gbWFueSBtYWlsIGNsaWVudHMgc3VwcG9ydA0KPiA+ID4gPiBzZWFyY2hpbmcgYnkgaXQs
IGFuZCB5b3UgY2FuIGFsc28gZ2V0IGl0IGZyb20gbG9yZToNCj4gPiA+ID4NCj4gPiA+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg3c2Y2OGNqbjAuZnNmQHJlZGhhdC5jb20vDQo+ID4g
PiA+DQo+ID4gPiA+ID4gSSBhZGRyZXNzZWQgeW91ciBjb21tZW50cy9xdWVzdGlvbnMgaW4gdjQu
DQo+ID4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sgdjQgaWYgdGhleSBhcmUgYWRkcmVzc2Vk
PyBJIHJld3JvdGUgYXMgeW91DQo+ID4gPiA+ID4gc3VnZ2VzdGVkIGluDQo+ID4gPiA+IHYzLg0K
PiA+ID4gPg0KPiA+ID4gPiBUaGlzIHdhcyBmb3IgcG9pbnRzIHlvdSBkaWQgbm90IGFncmVlIHdp
dGguIChBZ2FpbiwgaXQgbWlnaHQgYmUNCj4gPiA+ID4gaGVscGZ1bCB0byB3YWl0IHdpdGggcG9z
dGluZyBhIG5ldyB2ZXJzaW9uIHVudGlsIGRpc2N1c3Npb24gaGFzDQo+ID4gPiA+IHNvbWV3aGF0
DQo+ID4gPiA+IGNvbmNsdWRlZC4pDQo+ID4gPiBTdXJlLCB3aWxsIHdhaXQgbmV4dCB0aW1lLg0K
PiA+ID4NCj4gPiA+IFlvdXIgY29tbWVudCB3YXMsDQo+ID4gPiA9PT09PQ0KPiA+ID4gVGhpcyBp
cyBub3QgcmVhbGx5IGNsZWFyIHRvIG1lIGp1c3QgZnJvbSB0aGlzIHRleHQsIGVzcGVjaWFsbHkg
aWYNCj4gPiA+IHlvdSBqdXN0IHdyb3RlIGFib3ZlIHRoYXQgZW5hYmxpbmcgb3IgcmUtZW5hYmxp
bmcgaXMgc29tZXRoaW5nDQo+ID4gPiBkaWZmZXJlbnQuLi4gbXkgdW5kZXJzdGFuZGluZyB3b3Vs
ZCBiZToNCj4gPiA+DQo+ID4gPiAtIGlmIG5laXRoZXIgZHluYW1pYyB2cXMgbm9yIHF1ZXVlIHJl
c2V0IGFyZSBzdXBwb3J0ZWQgb3IgbmVnb3RpYXRlZCwNCj4gPiA+ICAgdGhlIG9ubHkgd2F5IHRv
IGVuYWJsZSBhIHZxIGlzIGJlZm9yZSBEUklWRVJfT0ssIGR1cmluZyBzZXR1cA0KPiA+ID4gLSBi
b3RoIG9mIHRoZXNlIGZlYXR1cmVzIHJlbHkgb24gdGhlIHRyYW5zcG9ydCBzdXBwb3J0aW5nIGVu
YWJsaW5nDQo+ID4gPiAgIGluZGl2aWR1YWwgcXVldWVzIChlaXRoZXIgYSBxdWV1ZSB0aGF0IGhh
cyBub3QgYmVlbiBlbmFibGVkIGJlZm9yZSwgb3INCj4gPiA+ICAgYSBxdWV1ZSB0aGF0IGhhcyBi
ZWVuIHJlc2V0KQ0KPiA+ID4gLSB0aGUgdHJhbnNwb3J0IGlzIHN1cHBvc2VkIHRvIHVzZSB0aGUg
c2FtZSBtZWNoYW5pc20gZm9yIGVpdGhlcg0KPiA+ID4NCj4gPiA+IERpZCBJIGdldCBpdCByaWdo
dD8gSWYgc28sIEkgdGhpbmsgd2Ugc2hvdWxkIG1ha2UgaXQgYSBiaXQgbW9yZSBjbGVhci4NCj4g
PiA+ID09PT09DQo+ID4gPg0KPiA+ID4gQWJvdmUgaXMgY2xhcmlmaWVkIGluIGJlbG93IHdvcmRp
bmcgd2l0aG91dCBjb21wbGljYXRpbmcgdGhlIHF1ZXVlX3Jlc2V0DQo+IGhlcmUuDQo+ID4gPg0K
PiA+ID4gRG9lcyB0aGF0IGxvb2sgb2sgdG8geW91Pw0KPiA+ID4NCj4gPiA+ICtXaGVuIFZJUlRJ
T19GX1JJTkdfRFlOQU1JQyBpcyBub3QgbmVnb3RpYXRlZCwgdGhlIGRyaXZlciBlbmFibGVzDQo+
ID4gPiArdGhlIHZpcnRxdWV1ZXMgZHVyaW5nIHRoZSBkZXZpY2UgaW5pdGlhbGl6YXRpb24gc2Vx
dWVuY2UsIGkuZS4NCj4gPiA+ICthZnRlciB0aGUgZGV2aWNlIHNldHMgdGhlIEZFQVRVUkVTX09L
IHN0YXR1cyBiaXQNCj4gDQo+IGFsbCBzdGF0dXMgYml0cyBhcmUgc2V0IGJ5IGRyaXZlcg0KPg0K
V2VsbCBkZXZpY2UgY2xlYXJzIGl0IGlmIGl0IGRvZXMgbm90IGxpa2UgdGhlIGZlYXR1cmVzLg0K
DQpZZXMuIEkgd2lsbCByZXdyaXRlIGl0IGFzLCANCg0KaS5lLiBhZnRlciB0aGUgZHJpdmVyIGhh
cyB2ZXJpZmllZCB0aGF0IEZFQVRVUkVTX09LIGJpdCBpcyBzZXQgYW5kIGJlZm9yZSB0aGUgZHJp
dmVyIHNldHMgRFJJVkVSX09LIGJpdC4NCiANCj4gPiBhbmQgYmVmb3JlIHRoZSBkcml2ZXIgc2V0
dGluZyB0aGUNCj4gDQo+IA0KPiBzZXR0aW5nIC0+IHNldHMNCj4gDQo+ID4gPiBEUklWRVJfT0sg
c3RhdHVzIGJpdC4NCj4gPiA+ICsNCj4gPiA+ICtXaGVuIFZJUlRJT19GX1JJTkdfRFlOQU1JQyBp
cyBuZWdvdGlhdGVkLCB0aGUgZHJpdmVyIGlzIG5vdA0KPiA+ID4gK3JlcXVpcmVkIHRvDQo+IA0K
PiB0cnkgdG8gYXZvaWQgInJlcXVpcmVkIiBvdXRzaWRlIGNvbmZvcm1hbmNlIHNlY3Rpb25zIHRo
b3VnaCBwbHMuDQo+IEFuZCB3aGVuIHVzZWQsIHdlIHVwcGVyLWNhc2UgaXQuDQo+IA0KT2suDQpI
b3cgYWJvdXQgYSByZXdyaXRlIGFzLA0KDQpXaGVuIFZJUlRJT19GX1JJTkdfRFlOQU1JQyBpcyBu
ZWdvdGlhdGVkLCB0aGUgZHJpdmVyIG1heSBub3QgZW5hYmxlIGV2ZXJ5IHZpcnRxdWV1ZSwgd2hp
Y2ggdGhlIGRyaXZlciB3YW50cyB0byB1c2UgYmVmb3JlIHNldHRpbmcgdGhlIERSSVZFUl9PSy4u
Lg0KDQo+ID4gPiArZW5hYmxlIGV2ZXJ5IHZpcnRxdWV1ZSBpdCB3YW50cyB0byB1c2UgYmVmb3Jl
IHNldHRpbmcgdGhlIERSSVZFUl9PSw0KPiA+ID4gK3N0YXR1cyBiaXQ7IHRoZSBkcml2ZXIgY2Fu
IGNob29zZSB0byBlbmFibGUgYSB2aXJ0cXVldWUgZXZlbiBhZnRlcg0KPiA+ID4gK3RoZSBkcml2
ZXIgaGFzIHNldCB0aGUgRFJJVkVSX09LIHN0YXR1cyBiaXQuIFRoZSB2aXJ0cXVldWUgZW5hYmxl
DQo+ID4gPiArbWVjaGFuaXNtIGlzDQo+ID4gPiB0cmFuc3BvcnQgc3BlY2lmaWMuDQo+ID4gPiAr
DQo=

