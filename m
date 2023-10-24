Return-Path: <virtio-comment-return-7926-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3908EC00A8F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 628822B01B
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:41:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32DD198699D
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:41:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 17F8B986990; Tue, 24 Oct 2023 03:41:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0749C986991
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 03:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msw7v+RMXKCEUtXr/g6O/wYJwE3jorFpiS+6DZL9QQqxMlHW+1ihF9yyBs5eu7U6iOJXYfurD0qHnkLldUJ7lywXd9MuKU7wmGE7A0WgGHOWZBwZa7IpYD3G9sSYkaaGC3fmNhn8plnss4Ifqj+pizMAPWj9NVPd5Izvr0pIY781up/yIPmkUw5IR3HnpzUXQdEbrlehggEnieHAxEFW876wlRRqKv+SD5Ovg0MpArA0NhtYXXj6+eIQ7L+zswVXQKK7+RARpW0hc4M0/W3C2ENk7NEvikgRcjjzqY5eJrnwNQuIweswX9cOTjJXU+6efjlbSeZ9FhSAVe7Vym6HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLTHgkLK70Qmcuvg9MH1RBtsO8UNAU4a8pIKVAVOVco=;
 b=E/LrBS/BeTTKxvgwCmxhvY9oOt4jTfGaq8ZygLQl88dtL8LM1GhnwnJz8bb5Xv89O2JgOgmbh0kY30Ku3+h44DBbIFzPTYwGMbh+XdxaS20s6P/dfJ01wgfUST+FMy+tNzfXaUbgdnu7r46d53wAq3xHR772k+tqujj9/N1G7SqYhWCcUTXK9RqIQCtG2zLCpxgyoRo1Ac7QU5hQqEEuLnioBM9KNpQKF/pzddhZ2g6mJZNYAIfhsbGrN2cPB67/WFwrMSjzpUXSB4z4HK3C7im/nZ69j3f+90slHTCuV38FrPYomviU3v0+eNDVw2IZoihi5yd6Ygdm2cJJ09udsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Yuri Benditovich
	<yuri.benditovich@daynix.com>, Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH RESEND v3] virtio-net: support the RSS
 context
Thread-Index: AQHZ/OBoRXldEdaR1k26LwqJuSdWs7BYXN0AgAAAqmA=
Date: Tue, 24 Oct 2023 03:41:38 +0000
Message-ID:
 <PH0PR12MB5481D10B5D788695BCFBBA89DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <6d62175fc237e79c1a985c58eee303d5b214656b.1697014234.git.hengqi@linux.alibaba.com>
 <f96785f3-005b-4803-b483-eb50fea4a672@linux.alibaba.com>
In-Reply-To: <f96785f3-005b-4803-b483-eb50fea4a672@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB8796:EE_
x-ms-office365-filtering-correlation-id: b08b63ba-f34a-4ddd-0686-08dbd44320e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Yg1PZ/ThmFGPcOp9tOl4fGj3SxC8FqWtTgBPl/ffKoUbjWHhBJEJNrZ9QtaplLeEp43lrPe9wVDbGtRLvVe5/9QSmlpcV12j7RozvuSgvFaDsXR80qye57gDxuXdv2uCXOVGkXZfhOleYgcIdVC8nx1t/qiaZeKgSSW0AftiMXad5Q5PGl083pRYBZRhUFvEXJTfJEYkzTgu7hLhXNzYSjwezjtFeKRbjWYatsHMDTthW2jdTHBbIW+lrWwC4knElS8GaFcRLi4lymy0160GN/kp8hjeA/lZQJbgdkM2uVx/BxmkBFXH2LuV2fW9uBfvO9RrrIAjrnxbaGZBc3fKgWiY1tFuSc9o9RnIQJlcbY3x6RFNyEimHz7LKOwzJS6jO2cmtTnT8ZoB5xN+lJNonVDl6G5GPUUU8n1qoHR+BpcufhCWMmUGpaMEDtHTAgzBAH/RwiBN5T+dHeEhfSM22KqydJ51aIFjsgnkYUg4g3wV/TcCxpJfDLo9uwy29YQoumwYjoK+Y3eRQWbdf1cHgVQeNry4F8SE+L2C2Jy1U8EWaWDPTfIplc8HLC/Rz+Z0rJybfWobbuuMOOWXMNGqYDpK8Z++4jNN2fMFwVHmeoRcdLYtkDqNy6o01pYfN/nwv8Z4LZv/DkhsUcE2+WkvDaDanD0vRHjjTh53FFRSC+TdKtVl72PQfrPQmb34tDZK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(122000001)(76116006)(66556008)(64756008)(54906003)(966005)(66946007)(316002)(110136005)(38070700009)(66446008)(38100700002)(7696005)(9686003)(6506007)(71200400001)(26005)(41300700001)(8676002)(52536014)(4326008)(8936002)(2906002)(33656002)(66476007)(86362001)(5660300002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXJ5di91c3l0bmlUaTBnK3pjT005eFNwa25VdmxpdE1LZFJTVDBndUI3ZC9n?=
 =?utf-8?B?c1o0aGFub0ZMSE1VV1RROFdDU1BlZEkyS05yOWt3aVEwUFpDeE9ORndRMHBF?=
 =?utf-8?B?ZHNqVGRzdGVha2xTOCtWbm51SW5sZUtpNXJvVU1ObmJJTmdyeGw0cWRsM0VR?=
 =?utf-8?B?UWJsYnZ3eGRGMFFZdGJnMW9iN1JYaUcwbk5vbHg5T2ZaaEdWSlI4aHpxWlo0?=
 =?utf-8?B?dks4Yld3aXhzTXgycGU5NHJGMG90ZnkwWTZWZk40ZkdHdlI3V1ZvNjRYTkVr?=
 =?utf-8?B?UkVOODZ2c1ZhWWZNem0wK3NPQ2RSc3UvQVBUSURqblBlNWVzc29kSENkVi9a?=
 =?utf-8?B?STd5YS81emxFckgyL0J5UFBWRXVETkhLSmRyazA1empxblB1U21oVUNsYTFs?=
 =?utf-8?B?Z0ZHZGpHeXpSRmtrKzlnY1lraUFteDlNV01TTXVnMWNqNE5WVXB6cUJraTJM?=
 =?utf-8?B?TkdCMGd2MzArcm9McWFVZlY4L3lET2JFSUM2K2NkbzlCbFJ3TlFhQmxjMVZJ?=
 =?utf-8?B?bm1aNHhzR1Nrb3o3dHdLVmdtSU5ydE5NS3Vxd1k1Tnh0M2hDV2tOWWdnektr?=
 =?utf-8?B?cFU0TWdndkdnL0t1OTZRR1lqdGpKTjRtemNKUUNsbyt4dTgwTDV4Z0pHSlJX?=
 =?utf-8?B?QlVkNE80YVJIQkNRUjkwZ29pOWJCcklBVXpuZ1dnSXplMUZiTFEvaTdsS0RK?=
 =?utf-8?B?WTkydWo3QVlJL3V4QmRlbFBoMmRxVUlZY0wwUFVXRzN0L2JoZlgrYW9zbyts?=
 =?utf-8?B?R1UvN2U0emEzQUhwQTB1aEZTSDBFMUFDbDBaMGRVR0dORytjb2pwTmQ3TFdM?=
 =?utf-8?B?L2JWaGxmZGg4cE1vTUU0ZTFGMzVXOUpPMlFSS1crd2o0bVJKU0VsaXhDM2hV?=
 =?utf-8?B?dU9sbWZKSmkzRmIvYmozd2dzSzhuSWg2bkdhbzZ2anAwd0NCQXFMUzJNV1Bn?=
 =?utf-8?B?LzVMYWNNUVVCeU9OOW93Q0dSUEZjd3Y3ZFZBZW5oUUxnZ0liVWhjaXVCNTl2?=
 =?utf-8?B?U1UrNmV1TXN3Vy90RlY1RDNWOGFEc1k3T0dzd1hyTFJGcVdjOXdZVi83anVq?=
 =?utf-8?B?ZVJkaTVvNE9xL1Avb0NVcENqNjZPMnpaTVRHOFdIZXEyY0dlazcxd0g2RWVC?=
 =?utf-8?B?NEUrNGNMM3k2dU5ic1hHNVE5emE0V1d1N0d5K1U2VFJCMjhzQXl2Uk44UTQ0?=
 =?utf-8?B?azQxNU03cGtJU3hIei9nc1ZBekorODFCRjBmTU9aNHVjczNWR0tWTjJiOU1q?=
 =?utf-8?B?RDZjak96cE1KSVdiYjBOSHVwai82aW9oSFZ5VXRJUXhlSjdVVzZ2TzZGcUYw?=
 =?utf-8?B?Q0NjQnVVZFRFZThWN21SZExlSHExWHZISjhSTlJsWmZUa3RpQ01hSGFuWlpa?=
 =?utf-8?B?UnJXdmpaVFBrOWJOVkNrQVZRSmIyNmNFT0FNKzk2cUhwcW5TSUJPMDdhTjV5?=
 =?utf-8?B?VkRCV2xxUEQrSmdCV1VMYlFRSW9pcm9oT0R5UUR6Rk52UG5qQzdsM1hKa0ww?=
 =?utf-8?B?TFAzcVpBdElxQUdzWVRIOTRBOXZlcnF3cXVTSllTd3F3RURvTXdzVW5PSXFk?=
 =?utf-8?B?cFNMN1ZhTksyWUdySGMreGVIRHMzNklvUVMrblFHZmJyR0NRdkNlU1ZkMWU3?=
 =?utf-8?B?K0FhODNaTHdxT1hUMFNiU2RRTE9iekMvQXRFbVNheVRScUZKdTUvVDl3Ynkw?=
 =?utf-8?B?am02K2hCa0I5MWpqdFZidFV6blVxdW0va2Vwb0hXVDZhQ05rNFllYlpVM3By?=
 =?utf-8?B?R2c2RkxjY0lBYnBKL3ZKclR3d1Zmd0I4S2g5UmRMbXpUSHl4V3hCcUxFeDhK?=
 =?utf-8?B?Z0xmZG9DWGtnazQ2NXAzY2ZiZERzY2lUODZzYTQwWkp0ZWl2bW93Z1J3a1pu?=
 =?utf-8?B?QTBxRnpvR29xUm42bjZPT0h1TnVyM05PZXFVQSszS1BMT3ZSd0lxOEJyeEVi?=
 =?utf-8?B?VUt3UjUxSWZmamhVZ0RZc1ozUS9LQXh1ZGYwMDdhNDBsWCtKQTlrKzdzTms2?=
 =?utf-8?B?dEltR1Z2T0RzL2FBc0c4a3F0U0pza3oveURZUzZOTmJvLzhqQnVVdCtoMWFL?=
 =?utf-8?B?T1pLWFRFUEVEM3pFUjJXMXZPTnVmak1RK25KT0x0ay8wOEpYK0FLb2YrVExt?=
 =?utf-8?Q?NshY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08b63ba-f34a-4ddd-0686-08dbd44320e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 03:41:38.2701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83dnZr/zJr3YLSvVdx5pU4ihDwCtS5EpsBDO9meXE5A3WfKGIMOsnewTv+aSx2HV5YsE+GtO4dxw77ZC3lTIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
Subject: RE: [virtio-comment] [PATCH RESEND v3] virtio-net: support the RSS
 context

SGkgSGVuZywNCg0KPiBGcm9tOiBIZW5nIFFpIDxoZW5ncWlAbGludXguYWxpYmFiYS5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjQsIDIwMjMgOTowNyBBTQ0KPiANCj4gDQo+IOWcqCAy
MDIzLzEwLzEyIOS4i+WNiDM6NDcsIEhlbmcgUWkg5YaZ6YGTOg0KPiA+IENvbW1pdCA4NGExZDlj
NDgyMDAgKCJuZXQ6IGV0aHRvb2w6IGV4dGVuZCBSWE5GQyBBUEkgdG8gc3VwcG9ydCBSU1MNCj4g
PiBzcHJlYWRpbmcgb2YgZmlsdGVyIG1hdGNoZXMiKSBhZGRzIHN1cHBvcnQgZm9yIFJTUyBjb250
ZXh0IGFzIGENCj4gPiBkZXN0aW5hdGlvbiBmb3IgcmVjZWl2ZSBmbG93IGZpbHRlcnMgKHNlZSBX
SVAgd29yazogaHR0cHM6Ly9saXN0cy5vYXNpcy0NCj4gb3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlv
LWNvbW1lbnQvMjAyMzA4L21zZzAwMTk0Lmh0bWwpLg0KPiA+DQo+ID4gQW4gUlNTIGNvbnRleHQg
Y29uc2lzdHMgb2YgY29uZmlndXJhYmxlIHBhcmFtZXRlcnMgc3BlY2lmaWVkIGJ5IHJlY2VpdmUt
c2lkZQ0KPiBzY2FsaW5nLg0KPiA+DQo+ID4gU29tZSB1c2UgY2FzZXM6DQo+ID4gMS4gV2hlbiB1
c2VycyB3YW50IHNvbWUgZGF0YSBmbG93cyB0byBiZSBzdGVlcmVkIHRvIHNwZWNpZmljIG11bHRp
cGxlIHJ4cXMsDQo+IHRoZXkgY2FuIHNldA0KPiA+ICAgICByZWNlaXZlIGZsb3cgZmlsdGVyIHJ1
bGVzIGZvciB0aGVzZSBkYXRhIGZsb3dzIHRvIGFuIFJTUyBjb250ZXh0IHdpdGggZGVzaXJlZA0K
PiByeHFzLg0KPiA+IDIuIFRyYWZmaWMgaXNvbGF0aW9uLiBVc2VkIHdoZW4gdXNlcnMgd2FudCB0
aGUgdHJhZmZpYyBvZiBjZXJ0YWluIGFwcGxpY2F0aW9ucyB0bw0KPiBvY2N1cHkNCj4gPiAgICAg
c2V2ZXJhbCBxdWV1ZXMgd2l0aG91dCBiZWluZyBkaXN0dWJlZC4NCj4gPg0KPiA+IEhvdyB0byBz
ZXQvY29uZmlndXJlIGFuIFJTUyBjb250ZXh0Og0KPiA+IEFzc3VtaW5nIG5vIFJTUyBjb250ZXh0
IGhhcyBiZWVuIGNyZWF0ZWQgYmVmb3JlLg0KPiA+IDEuIGV0aHRvb2wgLVggZXRoMCBjb250ZXh0
IG5ldyBzdGFydCA1IGVxdWFsIDgNCj4gPg0KPiA+IFRoaXMgY29tbWFuZCBjcmVhdGVzIGFuIFJT
UyBjb250ZXh0IHdpdGggYW4gaWQ9MSBmb3IgZXRoMCwgYW5kIGZpbGxzDQo+ID4gaW4gdGhlIGlu
ZGlyZWN0aW9uIHRhYmxlIHdpdGggcnhxIGluZGV4ZXMgNS04IGNpcmN1bGFybHkuIFRoZSBoYXNo
IGtleQ0KPiA+IGFuZCBoYXNoIHR5cGVzIHJldXNlIHRoZSBkZWZhdWx0IFJTUyBjb25maWd1cmF0
aW9uLg0KPiA+DQo+ID4gVGhlbiwgd2UgY2FuIHVzZSAnZXRodG9vbCAteCBldGgwIGNvbnRleHQg
MScgdG8gcXVlcnkgdGhlIGFib3ZlIGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiAyLiBldGh0b29s
IC1YIGV0aDAgY29udGV4dCBuZXcgc3RhcnQgNiBlcXVhbCA3IFwNCj4gPiAgICAgaGtleSA4Zjpi
ZjpkZDoxMToyMzo1ODpkMjo4YTowMDozMTpkMDozMjphMzpiNToxZjpcDQo+ID4NCj4gPiAxZjpl
NDpkMTpmZTo0Nzo3Zjo2NDo0MjpmZDpkMDo2MToxNjpiODpiMDpmOTo3MTplODoyZDozNjo3Zjox
ODpkZDo0ZDpjDQo+ID4gODpmMw0KPiA+DQo+ID4gVGhpcyBjb21tYW5kIGNyZWF0ZXMgYW4gUlNT
IGNvbnRleHQgd2l0aCBhbiBpZD0yIGZvciBldGgwLCBhbmQgZmlsbHMNCj4gPiBpbiB0aGUgaW5k
aXJlY3Rpb24gdGFibGUgd2l0aCByeHEgaW5kZXhlcyA2LTcgY2lyY3VsYXJseS4gVGhlIGhhc2gg
a2V5DQo+ID4gaXMgOGY6YmY6ZGQ6MTE6MjM6NTg6ZDI6OGE6MDA6MzE6ZDBcDQo+IDozMjphMzpi
NToxZjoxZjplNDpkMTpmZTo0Nzo3Zjo2NDo0MjpmZDpkMDo2MToxNjpiODpiMDpmOTo3MTplODoy
ZDozNjo3ZjoxODpkZDo0DQo+IGQ6Yzg6ZjMuDQo+ID4gSGFzaCB0eXBlcyByZXVzZSB0aGUgZGVm
YXVsdCBSU1MgY29uZmlndXJhdGlvbi4NCj4gPg0KPiA+IDMuIGV0aHRvb2wgLU4gZXRoMCByeC1m
bG93LWhhc2ggdGNwNCBzZGZuIGNvbnRleHQgMQ0KPiA+DQo+ID4gVGhpcyBjb21tYW5kIHNwZWNp
ZmllcyB0aGUgaGFzaCB0eXBlcyBmb3IgdGhlIFJTUyBjb250ZXh0IHdob3NlIGlkPTEgb24NCj4g
ZXRoMC4NCj4gPiBOb3cgdGhpcyBSU1MgY29udGV4dCBvbmx5IGhhcyB0aGUgaGFzaCBrZXkgdG8g
cmV1c2UgdGhlIGRlZmF1bHQgUlNTDQo+IGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiA0LiBldGh0
b29sIC1OIGV0aDAgZmxvdy10eXBlIHVkcDQgc3JjLWlwIDEuMS4xLjEgY29udGV4dCAxDQo+ID4N
Cj4gPiBUaGlzIGNvbW1hbmQgY29uZmlndXJlcyBhIHJlY2VpdmUgZmxvdyBmaWx0ZXIgcnVsZSBm
b3IgZXRoMCwgYW5kIHRoZQ0KPiA+IGRhdGEgZmxvdyBtYXRjaGluZyB0aGlzIHJ1bGUgd2lsbCBj
b250aW51ZSB0byBzZWxlY3QgdGhlIGZpbmFsIHJ4cQ0KPiA+IGFjY29yZGluZyB0byB0aGUgUlNT
IGNvbnRleHQgY29uZmlndXJhdGlvbiB3aXRoIGlkPTEuDQo+ID4NCj4gPiBGaXhlczogaHR0cHM6
Ly9naXRodWIuY29tL29hc2lzLXRjcy92aXJ0aW8tc3BlYy9pc3N1ZXMvMTc4DQo+ID4gU2lnbmVk
LW9mZi1ieTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4NCj4gPiBBY2tlZC1ieTogU2F0
YW5hbmRhIEJ1cmxhIDxzYnVybGFAbWFydmVsbC5jb20+DQo+IA0KPiBIaSBDb3JuZWxpYS4NCj4g
DQo+IENvdWxkIHlvdSBwbGVhc2Ugb3BlbiBhIHZvdGUgZm9yIHRoaXMgd29yaz8gVGhpcyB3b3Jr
IGhhcyBiZWVuIGxvbmcgZGVsYXllZC4NCj4gDQo+IFRoYW5rcyENCj4NCg0KQ2FuIHlvdSBwbGVh
c2UgcmViYXNlIHRoZSBwYXRjaCBvbiB0b3Agb2YgWHVhbidzIHBhdGNoIFsxXT8NCg0KVGhpcyBp
cyBiZWNhdXNlLCBYdWFuIHBhdGNoIHVzZXMgc2FtZSBmZWF0dXJlIGJpdCA1MC4NClBsZWFzZSBt
ZW50aW9uIGluIHRoZSBjb21taXQgbG9nIGFzIHdlbGwgZm9yIHRoZSBkZXBlbmRlbmN5Lg0KDQpP
bmNlIHlvdSByZWJhc2UgYW5kIHVzZSBkaWZmZXJlbnQgZmVhdHVyZSBiaXQsIGl0IGlzIGR1ZSBm
b3Igdm90ZS4NCg0KSSB3aWxsIGFsc28gcmViYXNlIHRoZSBmbG93IGZpbHRlcnMgb24gdG9wIG9m
IHlvdXIgc2VyaWVzIHRvIGF2b2lkIHRoZSBjb2xsaXNpb24gb24gZmVhdHVyZSBiaXQuDQoNClsx
XSBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIw
MjMxMC9tc2cwMDA0Ny5odG1sDQo=

