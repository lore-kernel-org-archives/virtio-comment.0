Return-Path: <virtio-comment-return-6234-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB94C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:15:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 984B5370FA
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:15:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76107986671
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:15:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5A57C986669; Thu,  8 Jun 2023 13:15:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4517898666A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 13:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgDMrVaglD0QUeeP3pkLlo+r435qn+pAqhvb7LR5pL63raHvPkOB8H+qb+mulg1hlbHSPlTvWxO+tJmVH2+eYF4hjEU4Hq9LpqPXr9di61SlYNiaOZYIbahmoLzqz04w2HjqgtWgKUaRqdIlKZOejZhJdRhTWU1w/XqLJ+nKaYBVg8KnHRNahOEYEuBIdEtR3ohULtyCU4oq7vRterrmKrgFZPPyY4+YfpwUZgU15LiqIwSEuGY+ZGgNPujUGdlrUW7e5qAXK0g9kNu51Lf1ofC10pwPoJ/xUCCjEGZE2HcBeo+Q9z034dc4iAVZ/NtE2dJYENPzGrEilgLhwSdQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xICMwtjwfbSsZBRN3ZEXAEenP1KMgZhZxFsRvKGGtxU=;
 b=WORuganPNUtxsGSdIwuFVDhDGQvKy0azbHLRbpuwtTfJGlzi/mHcsyezgxNohb8MKxX/z75SVqK6dyD1aLhR6nm9ptV2K7mcSVb3xgRHkRmCV1VyogwMcuaJu4cEHRdEezms759hMxYlE0bhp3p2SZPgI6e6gj3ctQCtWw7ENHGGKIDhvgAAV0Z2UTdTEMONy8Y+W68ZpaVUTLNb54XTsBRFJdPL+6tJu9P7W7C/l5O/wsKK89hYOol77wqkJcOtsNL8lcwU9I9ttq+HEWlFKuHUePWo4VtyStB8Ft+dWWuBlMsMfUQSaprHvpBP9HSV5f87rHTAIpt5nn94oV3ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea
	<dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson
	<snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling
Thread-Index: AQHZmKAVwn3zg7X1EUufTilOdi6rea9+EGGQgAAWHICAAAA7UIACp7kAgAAV03A=
Date: Thu, 8 Jun 2023 13:15:46 +0000
Message-ID:
 <PH0PR12MB54814006554B79237E0C1282DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
In-Reply-To:
 <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB6738:EE_
x-ms-office365-filtering-correlation-id: 3417a18e-910e-42b1-0f9e-08db682278f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C5pKkeYF30S/ZmAH4E9ZrtzjYMbOjrve6WJ9ragyakDnOVCDtuKKETH0L+0sSRpQN0/3fxglE2peaVU71pgNmvpmdohVJOBaKiD8dk/J0xvIuzmfG3YMzXOofpAT73jDgdm2an5cFcHCQiYA87Dk+l4O0ePgshloJBrsOR00bLoHjw7yptlTmuMqrh8N5kZyd3snhp+ypN6oJ7Ftq0jm58qlaTga3c3CgbhKvsBwbHr7Ci+Blat+zj2836lFbu7HMWChMYRQxlrI1Cb9H11rDcEaDcKMy3yM6ia2Ek2jLuXnoL979WuAJFmQnJJyLn4nYBaJp67d/jnzV4AAY9EREWQVa3cS6MJC8490tj/5TZUXBg3+yUJgP9ZVRUrzrHEpNX9OQnnyIgjEn2VwzGbb7qH219MkoJJHDeZbAFhz1AVeQAOBIGhn3nJnwcxxjkOWs5xZu6JNt9HZJpOx1vgwXPoV2VGZQ9u49CuVyxA0kxOyfgBhir0hbUSg9HlFyFjYzP+nijynx245HEX0AUYa0adRFtMs1uyu6UQVAxkxfJq0sDOUwXflYBI+f0zT99tqbUnvSHzqSdevxX3H5jpa5Pd4UMGIBe2bo7rCBVSvP3UPf/nifVW56oHtrpz6J6gI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(5660300002)(33656002)(38070700005)(2906002)(52536014)(86362001)(7416002)(55016003)(71200400001)(9686003)(26005)(6506007)(316002)(478600001)(54906003)(7696005)(64756008)(6916009)(66946007)(38100700002)(4326008)(41300700001)(66446008)(76116006)(186003)(122000001)(66556008)(66476007)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cERVdnRFV1NKc3FiV1c0WmZxZDVOSkRJdnNpWWt0cUZDOU9UaXJ5RWljcnZw?=
 =?utf-8?B?akZxQkdncFhVdkpyZTRoYW9QNTcxMkZrWXJUdUdEUXFxSjAxR0Iva2d0THB2?=
 =?utf-8?B?RHNZTzlSQWpGM0ZtTS93SUtlMXp4Uk1IcFF4RTg4RGxzaHNXd3BRQWl4UUVJ?=
 =?utf-8?B?czgyNXFGelJTdHN1TlFhYkJocWJrUWY1clpyOC9TQkxid2VsMnVBY0M2cXZG?=
 =?utf-8?B?OXZ0K2FTZ3I5ckU0emZVR2I4YWV6UnNMVnFxWFp2MEtQYWV2QjFtbDExNm5w?=
 =?utf-8?B?UG8raFdLTFUyR2w1Vy84anA5Ykd2bUlpUjVHL1pENlRVOWhIUE1YcU55WFY1?=
 =?utf-8?B?K1ZJRTJUMGlMS2JSTjk3dnFzM21OOGdFN3RIQmYxMXBFbEVyMWhSV05IK0hF?=
 =?utf-8?B?TzIrRlNhdTU1YWdnZGUrQXRPUFBqbjFFUG4yV3FvOVdPVGpTckRoUHMxOVZi?=
 =?utf-8?B?WFh1aS9pTWJ3b3gyN3A4MTI3U0oxallnS2JISXhSL2Q0bVc0T3U2Z3dJcTRU?=
 =?utf-8?B?dGYxa2x1T1JqSWZYbm5vMUdRVGxJMzRHUG1pZ3FFVVgxYUpNYk5BWjk1TU45?=
 =?utf-8?B?ZXl2ZXZUUUVndGI1N01IMlgxTjh5VTFZcnFIUndjOXh3QlRFR0R1RDBqc0pv?=
 =?utf-8?B?M05TYXpWV1BTbU5NTFpJMEpPZ2dXanFSYUdzM0tROTBsbFBTKzdXRmMrSUp6?=
 =?utf-8?B?bmhiWllPMXl4cWZpV1RjZDVpTWFiZXJTUlVWWEI2WUdicFhNSVFJVU1Gd05t?=
 =?utf-8?B?UWM1Zk5qR05aZC9mT2NZWFlWVHFjaHNtbklURkIvTnR0WDI5QjRJZ21XRE5p?=
 =?utf-8?B?MkdzcnlsZ083NlYwT1VZd2pLTlNSZVVDbmRSc2JmRkxrbC9CUnFERUxVaW9P?=
 =?utf-8?B?T2lPMEhLYkRqRjR5U3ErdDJMYkovTWx6YmRiUVh3d2g2WnBsVVFJSFpObHZQ?=
 =?utf-8?B?K3dwVStsRmtqYnBNTGs4WnRKRm9oeEswSDdvRlNUMWdwRUxNLzI3eTJlaWlQ?=
 =?utf-8?B?dzBHNklwZzZXdEZuNnJiMmpMbkZ5RnhnZk4zNFFVT3RhazE3UEdNQmlHT2Zk?=
 =?utf-8?B?VEFxalFuN3NrKzhzUGlMdDVGU3dxcGkzbUxKODdsL3Z1NFdhZmJsMit0QlhS?=
 =?utf-8?B?eTBOcDBTVDRodTZIREV1dXdybkN1S1liY0djc3ZYbmxDbkZXd2ZabWxGQ2dW?=
 =?utf-8?B?aGw0WDd3WmVOOC9YV2h5OGxKNFpkMUtzeFJucGdweGRYUEhQRHdSdGtsUUtz?=
 =?utf-8?B?N1MzTVJXSGlZR2VtbkJZZzBqOHEvd0RleGNscVlMbkdySnpMSzVuTTRHTXZv?=
 =?utf-8?B?NlR2Z254Ynh4STd4RVpISTR4ZmlVRU5PSlAyRXFtM1UyVGI1MkorT0NxVlVn?=
 =?utf-8?B?NzRBTDZyOWZUZmpiL0lFNDlaNVcvZ0UyRW5EMHV4OG14TU1YaEFmTS9xQ2l2?=
 =?utf-8?B?S2xsekhrN0VvbzdIZW1DUksvZnhSU0NXSmdzNEpTSUNYTVlEblpaUi9jOVdr?=
 =?utf-8?B?U3Y0WlMyT0FVYTU3TkRGRGlYbkxVREhQS21mRFFVTjhIb2NUZ0hGWU0wUWpR?=
 =?utf-8?B?SXcwTTR0bnhiWFU5S21tQUhaQUY0NUt5VTVhQUJ2MUxaeEQwYnRqMWtaZDJh?=
 =?utf-8?B?YXpCVTdtN0gxVkNLOU5xODRiOWRSeXhJM3JQVUEzcDNOR0hjcCtvcXl5NnBr?=
 =?utf-8?B?aFVhMm9SQkV6NHJwWDBOM0VGWlgraXdCQ0FMaExBMS9QQjJYdlQ3VEhOYVgv?=
 =?utf-8?B?Z21KQUNwa2tkOWE4WEtMYWN5a3daSGI0dmJFd1dlK0kwcFdkQWJlUmxUdzNS?=
 =?utf-8?B?U3Bnb3FHREJFYmxnQkdiUGdta2tENXZzS0dLTWFrOWpQSGt0NTBwQWEycHMr?=
 =?utf-8?B?NkhRK002YmE3RVdITmtITG5qSTVNOEo3Vjd3dm9QWHI1VHRlYkRNS2xJVHlC?=
 =?utf-8?B?Y1JaQUhoTDdmWlprRVJYTzh5cGxValVVY2EzWjFtZzFzVjU0dnhvT1IvMnNm?=
 =?utf-8?B?QnJOT2hobkdCM3BHZHBuZVZ0TWJDRUlzOXRaeE04bUE3UWlicjBLL1BCWXRI?=
 =?utf-8?B?dXVoSXgxaFc5K2ZYMlVlZmQ2dGxuY1hicXV5OWp2OFBqTzd2cEcrZjB3SlFV?=
 =?utf-8?Q?409s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3417a18e-910e-42b1-0f9e-08db682278f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 13:15:47.0275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P41GjFOa3uiauog14SUK+77JSNktRWzKUHU6i108BoRAEhe7JyNonrvp7kwMNCTbjDj2otHGtSk1yI2HVDzdvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738
Subject: RE: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling

DQoNCj4gRnJvbTogRXVnZW5pbyBQZXJleiBNYXJ0aW4gPGVwZXJlem1hQHJlZGhhdC5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDgsIDIwMjMgNzo1NCBBTQ0KDQo+ID4gWWVzLCBJIGhhdmUg
cmVhZCBpdCBmZXcgdGltZXMgYW5kIGV2ZXJ5IHRpbWUgSSBjb25jbHVkZWQgdGhhdDoNCj4gPiBp
dCBkb2VzIG5vdCBzYXkgdGhhdCBpdCBtdXN0IGJlIGRvbmUgYmVmb3JlIERSSVZFUl9PSyBhbmQg
Y2Fubm90IGJlIGRvbmUNCj4gYWZ0ZXIgRFJJVkVSX09LLg0KPiA+DQo+IA0KPiBJIGFsc28gcmVh
ZCBpdCB0aGlzIHdheSB0byBiZSBob25lc3QuIEZyb20gYSBQT1YsIHRvIGFsbG93IGl0IGlmIGEg
ZGV2aWNlIGRvZXMgbm90DQo+IGhhbmRsZSBpdCBjb3VsZCBiZSBjb25zaWRlcmVkIGEgZml4LCBy
YXRoZXIgdGhhbiBhbiBhZGRpdGlvbi4NCj4gDQo+IEknbSBhc3N1bWluZyB3ZSBuZWVkIHRvIG1v
ZGlmeSB0aGUgc3RhbmRhcmQganVzdCBiZWNhdXNlIGl0IHdhcyBub3QgZXhwbGljaXRseQ0KPiBh
bGxvd2VkLiBUbyBleHBsaWNpdGx5IGFsbG93IGl0IGJlZm9yZSBEUklWRVJfT0sgd2FzIG5vdCBu
ZWVkZWQgYmVjYXVzZSBpdCB3YXMNCj4gYWxyZWFkeSB3aWRlc3ByZWFkLg0KPiANCkl0IHdhcyBl
eHBsaWNpdCBlbm91Z2ggdGhhdCBxdWV1ZXMgY2FuIGJlIGVuYWJsZWQgYWZ0ZXIgRFJJVkVSX09L
Lg0KQW5kIHF1ZXVlIHJlc2V0IGlzIHRoZSBwZXJmZWN0IGV4YW1wbGUgc2hvd2VkIHRoYXQuDQpX
aG8gZXZlciBpbXBsZW1lbnRzIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIHJlYWR5IHRvIGhhbmRsZSBx
dWV1ZV9lbmFibGUgd3JpdGVzIGFmdGVyIERSSVZFUl9PSyBzdGFnZSwgaXQgaXMgcmVhbGx5IHRo
YXQgc2ltcGxlLg0KVGhlcmUgaXMgbm8gbmVlZCBvZiBuZXcgZmVhdHVyZSBiaXQuDQoNCj4gSXQg
d291bGQgYmUgZ3JlYXQgZm9yIG1lIGlmIHdlIGFncmVlIHRoZSBkZXZpY2UgbXVzdCBzdXBwb3J0
IGl0LCBidXQgbWF5YmUgaXQgaXMNCj4ganVzdCB0b28gbGF0ZSBmb3IgdGhhdC4NCkRldmljZSBt
dXN0IHN1cHBvcnQgaXQuIFRoZXJlIGlzIG5vdGhpbmcgbGF0ZSBhYm91dCBpdC4NCkFuZCBpZiB5
b3UgYXJlIGNvbnNpZGVyaW5nIExNIGZsb3csIHRoZW4gZm9yIHN1cmUgaXQgaXMgbm90IGxhdGUg
YmVjYXVzZSBMTSBpcyBqdXN0IG5vdCBmdWxseSBiYWtlZC4NCg==

