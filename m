Return-Path: <virtio-comment-return-6159-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C42C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 18:05:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F3451922E5
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 18:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 919D32AFF8; Tue,  6 Jun 2023 18:05:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F28CA9864A4
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 18:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjIabbwRvzxI1sU7gkPPO2Heeb8Sf5VL9HKwQUzrITeZesY5ICc+uVngwl4/QqPaMkvPGq/ceNaU6O7WGHYg7ma1SFR5yn/KWOoIuKqNeTCqLNzl0H6TdIhSJrhFc9CEKbcK/RnrlozUftYvQe5fK+kCHxEdafEL0QJ9+GiOzhqjLBjaAvpqIrAsSaG9J/c3nvJLyH46exMFZUkzkbs8Y9RtPiOAJ49rZZohhGOPhGFL+HMgFH0H27WAnToaxS2x0WAmi5y91fBv8ZNBfBHQl/tGaOzXIpEzWhnvJDmvfKUxUDQQlDD/QULYVRfOzidClEwwb0PTs3FMxTlR1ofxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leYLnIYlPCsyBvStlcDREZ5DzapXtFv/ECdOMGwaWb0=;
 b=ie0q5d0YY8wwnpU1vKX55e3I5mlm6yDmgN3SczbdNm9oirbHX9Ko9U84IdhOYcyKY4X8ugKwKb1ew5UMq5PiWpwpZcUf8EYHa2Gu5R/qfbyGxO1qZkGY8TPe7xO792/yfpGsRFxp2mIcW/03MPnix2aag9DdENOkmiqJtUm03oAQSCSqrWFqG3SZjOKMiyi5VytYW0WtV4HBQb/SYCxauAtAYFSbEvOSz5YfX3LmDh6XJsEBzA7Q7Khm9mqGVyh1esXzIpYgUmYkru8DLe2uw8VvfDipKtpBtrOxbkyWuKE5w8YPdEbpON/21dVfsOa0SxY57NyZ6hWw25YAUo8Tvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea
	<dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson
	<snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, "mst@redhat.com"
	<mst@redhat.com>
Thread-Topic: [PATCH 1/2] virtio: introduce selective queue enabling
Thread-Index: AQHZmKAVwn3zg7X1EUufTilOdi6rea9+EGGQ
Date: Tue, 6 Jun 2023 18:04:32 +0000
Message-ID:
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
In-Reply-To: <20230606175511.2337208-2-eperezma@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4180:EE_
x-ms-office365-filtering-correlation-id: 082373fd-35ea-496a-c53f-08db66b87b3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 omXemA1A5rXP49aISH3KBAT8T2+Xv+/RyPuWrMO/+JbFlp1YVREe7J7EUO7V1xjpmqN8FnQrht3C2O2DBsnq+XEBC+BjFnI8/u/NUhFag5nZok2vRdAgCMoEXBahT4pFKfvGD9uBcLLLyweKuCcSVjb5hUttUvzFdshok69PCVo62LCehGwGt77FGJ9evlxtBoj/+EsjN86F4aLLMWu59IX0hixvjf2Ef5kFQM/i2ZPpWewGksplaVIxMeYoOgZCBga3oM9f8KBTeL8rzzkSDKhDmESnay7snJAKmuWV16Wm3gonoZmnZNjti/D4VSIyK2GVrb/R22TPCYCE1FOCavtRFgioIMVocesL22nsJ14hCQEVNnZ34KQN/9SJyJ8K3zpvk1+4LVcHUwPVPG/j/ksV9wde0jDBd6evWFSf9yj8rJYztOQOAb/QB/WSofRgvykU1Br18JmCHDSAFBdzMELCH7ZVGCn/dTuNV1Lo+rB/YC+KGVRllLeJyWPsI+yaS6uujvsJkUac3AXyGrEvh91k/Lf5bbXndSx4PLqAyNipLKyVbiRcwe1dFuhMZhFhUAH5+r+uA3U+pcZZrR3drE3lTw4wXpKUnubcx6XOJhJ3snFCV5LL04jugZb5mB7c
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(9686003)(6506007)(38100700002)(41300700001)(7696005)(186003)(66574015)(26005)(83380400001)(478600001)(110136005)(54906003)(71200400001)(66446008)(66476007)(66556008)(64756008)(122000001)(76116006)(66946007)(4326008)(55016003)(316002)(7416002)(5660300002)(8676002)(8936002)(52536014)(38070700005)(33656002)(2906002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHBVeWJUTkw4OVlsMVJGMGovYmdLQ2lCRkM5bmhoRzk3YUg2aWttdlhESTJZ?=
 =?utf-8?B?QTAxbWJ0WkFab2Q2ZUhvQTBnblVEV1JIMWw1djUvdE9xdjFBbVUzWGJXWkVz?=
 =?utf-8?B?dk5QZ2FJRjhNaWhJZnZ0RmVvY0h1RzdmRldVQ1ZDTTc1UUVOeWozSUwxYWVM?=
 =?utf-8?B?ak52a0huZGpvaVBibldSQjZsOTBxWHNHWDhIVWFtS0NNSUdTd0RFU3hNZElJ?=
 =?utf-8?B?ZGY0djFaZjdlakVpU0VDRHVZMXZYWXI3cVY5S1JQdmN4d2FmdHc5ZVFPMkha?=
 =?utf-8?B?bzlHbU9Tc2ZOdTc3R1kwYjk4N1hnNWxMaVdrU0FZUHpyK3FLMXhuYnpmZXdP?=
 =?utf-8?B?ajlVSUgvQWVxU1RhMndFM3B1d204TVNCRmUxSEhUTE9UUVZTdjVzRnlhQk00?=
 =?utf-8?B?MjFwdjZqaFl4TDlKMmV3ZC94cFIwamVDQW1qeWxDNnJRUzFIUzh0VE9nL0g3?=
 =?utf-8?B?ZDl2QytadG9VWWtKUG1LMmVSNGxVRWhRNXI1R2RrRmNtb212SWd5RFZLdUxy?=
 =?utf-8?B?eEsrcWRyRmZmZmpydW1vZUZLY3NsdXo0NzhYVXpNVVZGMit0UCt5Sm9PcGhm?=
 =?utf-8?B?ZUFndDVPb3R3SXloVnMxMHN0MVhoQXV6MGRLdFVIc3p3Q0lkeXpqZ2ZJbDNx?=
 =?utf-8?B?RzZDSnlCVEQ0UDBHQXprbzVyMmQrS25HeHBTT3locUlnSzFZdHc0ZVRYWkJu?=
 =?utf-8?B?eCt0RjduNm9QYm5CNWVCazR3NWQ4bjhWMFBDNmljTnc2bmthY2FFTHZDRzJ5?=
 =?utf-8?B?ZWFhd0cxOWFXYUJuclk5b3Nkd05SR3NuK0p6TUJySFhUZUJmbDNXMUMvOU5V?=
 =?utf-8?B?a3psWmF4dmFzVWRwcGpIN2lDcVFLZ3RkMGlubEZLa1ErdzVCcXdvVXcyTWt2?=
 =?utf-8?B?SjVvYy9UOVUxRFk4M2xLNEIxN0RKN09PbXZTZi9QeTI2cEpIcTFPYVh6MzIx?=
 =?utf-8?B?RzFrZWQzNWNsL0JBVzRSZ0FqTmNIR1ByN3VodU5LZWZGaUFnd29NZFFxY2N1?=
 =?utf-8?B?VVJYVjU1cWUxN3VoTWsxVDBMWVN6K0FZSHBwLzRWMGlObWVGM05vZFJOTGN3?=
 =?utf-8?B?dmZISVh2b1ZLanZIcnZtK1hubVFTdUhLMHMzc01KZWY1ZjBjeDhjcWZMVmgr?=
 =?utf-8?B?eHNVckRTRVlFKzZNbTZmTW9USjMrVnB4ZHljMDU0M1F2T3dpSlZMYjZodXRX?=
 =?utf-8?B?QnkrdkZtUjcxQVNDQmp6aFBlbXAxN0p1Y1AzeWtvdUFHSC9CMU1RWitrSWJT?=
 =?utf-8?B?ZWY1RkpMSVIrTTc4aGZZcnp2SUFnZkhSVGxmYmVlRlp4MmFjbGZLRFFEY1k4?=
 =?utf-8?B?SE9kV081S3QydlpwUE1zUERnM3hxTFJNMXlFTCsvV1lhOUxXWjFNSE9kM3JS?=
 =?utf-8?B?MDU1eDV5V0ZsQ3BaamlqcjRCZldBNDNGVjlwUlJpN0oyVmlFQlRaTVJkL3hp?=
 =?utf-8?B?TGRuRHorcmtGUUhoK2FMNVgwakViWStnNEhyZzFrQTVWL1FwekV0dWpiZVZW?=
 =?utf-8?B?OHdUQXJOdVpwdUlhbXJUWlRQVUxNMGFWT0g3WXcxSmZqdHNkeXo3b3puVXVD?=
 =?utf-8?B?WmFSU3VWWGlIRWNyWnpBWlhHL0FOTUFGeHM3YjczcHRja0ZZWnJoNjBpN0xO?=
 =?utf-8?B?WXd4S1dXQlBjQ3p4ZmlFMUFnakxUVk5HWFJQU0pVQ2wwUFN5NndYdnNyZWlq?=
 =?utf-8?B?UWtHNWhScVlMWEsvcXdXcVgxazRWYVRIK3JtQ1ZyNGNQbzZUMzFDUjZQcDYw?=
 =?utf-8?B?bXZXbnhyOW15RXJEcTlUWHY4NnZZaXJYbnpQSHZKdll5T0s4aTM5eVN6VUw4?=
 =?utf-8?B?TGw1dEhscENNUUc1bTA2RG1STFRGRzFqSGpGYzBmVXVVTEtMWlZ1VVAvTVR6?=
 =?utf-8?B?ZExmLy9UcDdFV3NrQ0crU2V0ZkRPQ0ZLdnRnR0dzV2kwMWFtNFlMWDNvWVM5?=
 =?utf-8?B?OEMydm5SVHBaUnRpSU1sZDh5ZVBUdzYxRlNxd3QwR1dWL3BjRG5SNGFIaWQy?=
 =?utf-8?B?QnFQSXhCYXgrSGt3WEdsN3lPQkJ5enlERHdsUzJFZHlaQ1FSU09kVFNydmpV?=
 =?utf-8?B?ZlRHOHdxOUFnZ1drcDdVUU9QSm1mM3Z3bUpoWGhlZU1HSGhiY09USkNlVXFh?=
 =?utf-8?Q?WTr8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082373fd-35ea-496a-c53f-08db66b87b3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 18:04:33.0397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNqA26pRAyHqmh1IL2vosv4qkou5NzN8gThxHDv23JM447jxamLSuWTcoFGphMDh1VeibTlUsonND39hmaGoXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
Subject: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective queue enabling

SGkgRXVnZW5pbywNCg0KPiBGcm9tOiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNv
bT4NCj4gU2VudDogVHVlc2RheSwgSnVuZSA2LCAyMDIzIDE6NTUgUE0NCj4gDQo+IFRoaXMgcGF0
Y2ggYWxsb3dzIHRoZSBkcml2ZXIgdG8gc3RhcnQgdGhlIGRldmljZSAoYXMgc2V0IERSSVZFUl9P
Sykgd2l0aCBvbmx5DQo+IHNvbWUgcXVldWVzIGVuYWJsZWQsIGFuZCB0aGVuIGVuYWJsZSBhbm90
aGVyIHF1ZXVlcyBsYXRlci4NCj4gDQo+IFRoaXMgaXMgdGhlIGN1cnJlbnQgd2F5IHRvIG1pZ3Jh
dGUgbmV0IGRldmljZSBzdGF0ZSB0aHJvdWdoIGNvbnRyb2wgdmlydHF1ZXVlLCBpbg0KPiBhIHNv
ZnR3YXJlIGFzc2lzdGVkIGZyYW1ld29yayB3aXRoIHZEUEE6DQo+ICogRmlyc3QsIG9ubHkgbmV0
IENWUSBpcyBlbmFibGVkIGF0IERSSVZFUl9PSw0KPiAqIEFsbCB0aGUgY29udHJvbCBjb21tYW5k
cyAobWFjIGFkZHJlc3MsIG1xLCBldGMpIG5lZWRlZCBmb3IgdGhlIGRldmljZSB0bw0KPiBiZWhh
dmUgdGhlIHNhbWUgYXMgdGhlIHNvdXJjZSBvZiBtaWdyYXRpb24gYXJlIHNlbnQNCj4gKiBGaW5h
bGx5IGFsbCB0aGUgZGF0YXBsYW5lIHF1ZXVlcyBhcmUgZW5hYmxlZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPg0KPiAtLS0NCj4gIGNv
bnRlbnQudGV4IHwgMTUgKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9jb250ZW50LnRl
eCBiL2NvbnRlbnQudGV4DQo+IGluZGV4IGQyYWI5ZWIuLmVhNGE2ZDggMTAwNjQ0DQo+IC0tLSBh
L2NvbnRlbnQudGV4DQo+ICsrKyBiL2NvbnRlbnQudGV4DQo+IEBAIC05OSwxMCArOTksMTAgQEAg
XHNlY3Rpb257RmVhdHVyZSBCaXRzfVxsYWJlbHtzZWM6QmFzaWMgRmFjaWxpdGllcyBvZiBhDQo+
IFZpcnRpbyBEZXZpY2UgLyBGZWF0dXJlIEIgIFxiZWdpbntkZXNjcmlwdGlvbn0NCj4gIFxpdGVt
WzAgdG8gMjMsIGFuZCA1MCB0byAxMjddIEZlYXR1cmUgYml0cyBmb3IgdGhlIHNwZWNpZmljIGRl
dmljZSB0eXBlDQo+IA0KPiAtXGl0ZW1bMjQgdG8gNDFdIEZlYXR1cmUgYml0cyByZXNlcnZlZCBm
b3IgZXh0ZW5zaW9ucyB0byB0aGUgcXVldWUgYW5kDQo+ICtcaXRlbVsyNCB0byA0Ml0gRmVhdHVy
ZSBiaXRzIHJlc2VydmVkIGZvciBleHRlbnNpb25zIHRvIHRoZSBxdWV1ZSBhbmQNCj4gICAgZmVh
dHVyZSBuZWdvdGlhdGlvbiBtZWNoYW5pc21zDQo+IA0KPiAtXGl0ZW1bNDIgdG8gNDksIGFuZCAx
MjggYW5kIGFib3ZlXSBGZWF0dXJlIGJpdHMgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSBleHRlbnNpb25z
Lg0KPiArXGl0ZW1bNDMgdG8gNDksIGFuZCAxMjggYW5kIGFib3ZlXSBGZWF0dXJlIGJpdHMgcmVz
ZXJ2ZWQgZm9yIGZ1dHVyZQ0KPiBleHRlbnNpb25zLg0KPiAgXGVuZHtkZXNjcmlwdGlvbn0NCj4g
DQo+ICBcYmVnaW57bm90ZX0NCj4gQEAgLTM5OCw2ICszOTgsMTMgQEAgXHNlY3Rpb257VmlydHF1
ZXVlc31cbGFiZWx7c2VjOkJhc2ljIEZhY2lsaXRpZXMgb2YgYQ0KPiBWaXJ0aW8gRGV2aWNlIC8g
VmlydHF1ZXVlc30gIEV2ZXJ5IGRyaXZlciBhbmQgZGV2aWNlIHN1cHBvcnRzIGVpdGhlciB0aGUg
UGFja2VkDQo+IG9yIHRoZSBTcGxpdCAgVmlydHF1ZXVlIGZvcm1hdCwgb3IgYm90aC4NCj4gDQo+
ICtcc3Vic2VjdGlvbntWaXJ0cXVldWUgc2VsZWN0aXZlIGVuYWJsaW5nfVxsYWJlbHtzZWM6QmFz
aWMgRmFjaWxpdGllcyBvZg0KPiArYSBWaXJ0aW8gRGV2aWNlIC8gVmlydHF1ZXVlcyAvIFNlbGVj
dGl2ZSBWaXJ0cXVldWUgRW5hYmxlfQ0KPiArDQo+ICtJZiB0aGUgZHJpdmVyIG5lZ290aWF0ZXMg
VklSVElPXF9GXF9SSU5HXF9FTkFCTEVcX0FOWVRJTUUsIGl0IGNhbg0KPiArZW5hYmxlIGluZGl2
aWR1YWwgdmlydHF1ZXVlcyBib3RoIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIERSSVZFUlxfT0suIFRo
ZQ0KPiArd2F5IHRvIGVuYWJsZSBhIHZpcnRxdWV1ZSBpcyB0cmFuc3BvcnQgc3BlY2lmaWMsIGJ1
dCBpdCBtaW1pY3MgdGhlDQo+ICtyZS1lbmFibGluZyBhZnRlciBhbiBoeXBvdGhldGljYWwgcmVz
ZXQuDQo+ICsNCj4gIFxzdWJzZWN0aW9ue1ZpcnRxdWV1ZSBSZXNldH1cbGFiZWx7c2VjOkJhc2lj
IEZhY2lsaXRpZXMgb2YgYSBWaXJ0aW8gRGV2aWNlIC8NCj4gVmlydHF1ZXVlcyAvIFZpcnRxdWV1
ZSBSZXNldH0NCj4gDQo+ICBXaGVuIFZJUlRJT19GX1JJTkdfUkVTRVQgaXMgbmVnb3RpYXRlZCwg
dGhlIGRyaXZlciBjYW4gcmVzZXQgYSB2aXJ0cXVldWUNCj4gQEAgLTg3MCw2ICs4NzcsMTAgQEAg
XGNoYXB0ZXJ7UmVzZXJ2ZWQgRmVhdHVyZSBCaXRzfVxsYWJlbHtzZWM6UmVzZXJ2ZWQNCj4gRmVh
dHVyZSBCaXRzfQ0KPiAgCVxyZWZ7ZGV2aWNlbm9ybWF0aXZlOkJhc2ljIEZhY2lsaXRpZXMgb2Yg
YSBWaXJ0aW8gRGV2aWNlIC8gRmVhdHVyZSBCaXRzfSBmb3INCj4gIAloYW5kbGluZyBmZWF0dXJl
cyByZXNlcnZlZCBmb3IgZnV0dXJlIHVzZS4NCj4gDQo+ICsgIFxpdGVtW1ZJUlRJT19GX1JJTkdf
RU5BQkxFX0FOWVRJTUUoNDIpXSBUaGlzIGZlYXR1cmUgaW5kaWNhdGVzICB0aGF0DQo+ICsgdGhl
IGRyaXZlciBjYW4gZW5hYmxlIGEgcXVldWUgYm90aCBiZWZvcmUgYW5kIGFmdGVyIERSSVZFUlxf
T0suDQo+ICsgIFNlZSBccmVme3NlYzpCYXNpYyBGYWNpbGl0aWVzIG9mIGEgVmlydGlvIERldmlj
ZSAvIFZpcnRxdWV1ZXMgLyBTZWxlY3RpdmUNCj4gVmlydHF1ZXVlIEVuYWJsZX0uDQo+ICsNCg0K
Q2FuIHlvdSBwbGVhc2UgaGlnaGxpZ2h0LCBjdXJyZW50IHNwZWMgbm9ybWF0aXZlIHdoaWNoIGlu
ZGljYXRlcyB0aGF0IGFsbCBxdWV1ZXMgbXVzdCBiZSBlbmFibGVkIGJlZm9yZSBEUklWRVJfT0sg
YW5kIG1vcmUgcXVldWVzIGNhbm5vdCBiZSBlbmFibGVkIGFmdGVyIERSSVZFUl9PSz8NCg==

